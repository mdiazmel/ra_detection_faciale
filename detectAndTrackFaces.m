%% detectAndTrackFaces
% Automatically detects and tracks multiple faces in a webcam-acquired
% video stream.
%
% Copyright 2013-2014 The MathWorks, Inc 

clear classes;

%% Instantiate video device, face detector, and KLT object tracker
vidObj = VideoReader('Video0003.avi');

faceDetector = vision.CascadeObjectDetector(); % Finds faces by default
eyeDetector = vision.CascadeObjectDetector('EyePairBig');
tracker = MultiObjectTrackerKLT;

%% Get a frame for frame-size information
frame = readFrame(vidObj);
frameSize = size(frame);

%% Create a video player instance
videoPlayer  = vision.VideoPlayer('Position',[200 100 fliplr(frameSize(1:2)+30)]);

%% Iterate until we have successfully detected a face
bboxes = [];
eyebboxes = [];
while isempty(bboxes)
    framergb = readFrame(vidObj);
    frame = rgb2gray(framergb);
    bboxes = faceDetector.step(frame);
end
while isempty(eyebboxes)
    framergb = readFrame(vidObj);
    frame = rgb2gray(framergb);
    eyebboxes = eyeDetector.step(frame);
end
tracker.addDetections(frame, bboxes);
tracker.addDetections(frame, eyebboxes);

%% And loop until the player is closed
frameNumber = 0;
keepRunning = true;
disp('Press Ctrl-C to exit...');
while keepRunning
    
    framergb = readFrame(vidObj);
    frame = rgb2gray(framergb);
    
    if mod(frameNumber, 10) == 0
        % (Re)detect faces.
        %
        % NOTE: face detection is more expensive than imresize; we can
        % speed up the implementation by reacquiring faces using a
        % downsampled frame:
        % bboxes = faceDetector.step(frame);
        bboxes = 2 * faceDetector.step(imresize(frame, 0.5));
        eyebboxes =  2 * eyeDetector.step(imresize(frame,0.5));
        if ~isempty(bboxes)
            tracker.addDetections(frame, bboxes);
        end
        if ~isempty(eyebboxes)
            tracker.addDetections(frame, eyebboxes);
        end
    else
        % Track faces
        tracker.track(frame);
    end
        
    % Display bounding boxes and tracked points.
    displayFrame = insertObjectAnnotation(framergb, 'rectangle',...
        tracker.Bboxes, tracker.BoxIds);
    displayFrame = insertMarker(displayFrame, tracker.Points);
    videoPlayer.step(displayFrame);
    
    frameNumber = frameNumber + 1;
end