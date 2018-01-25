%% Prepare for the webcam and detector object
clear cam
% Create the webcam object
cam = VideoReader('Video0003.avi');
% Creat a Cascade object detector
detector = vision.CascadeObjectDetector('EyePairBig');
% Capture one frame to initialize things
videoFrame = readFrame(cam);
frameSize = size(videoFrame);
% Read in the hat and beard images to overlay on face
inhat = imread('hat2.jpg');
inbeard = imread('beard.png');
% Create the video player object
videoPlayer = vision.VideoPlayer('Position', [200 200 [frameSize(2), frameSize(1)]+30]);
%% Detect the face in every frame and overlay objects on top of it
% Initialize the live capture loop
runLoop = true;
frameCount = 0;
% Start the live capture loop to run 500 frames or until stopped (window closed)
while runLoop && frameCount < 500
    % Take a snapshot each frame
    videoFrame = readFrame(cam);
    videoOut = videoFrame;
    % Detect the eye pair and get the boundary box
    bbox = step(detector, videoFrame);
    if size(bbox, 1) == 1
        % Resize the hat and beard based on the size of the eye pair
        hat = imresize(inhat, bbox(:,3)*2/size(inhat,1));
        beard = imresize(inbeard, bbox(:,3)*1.5/size(inbeard,1));
        % Position the hat and the beard
        hatPos = [bbox(:,2) + bbox(:,4) - size(hat,1) + 1,...
            bbox(:,1) - round(bbox(:,3)/2)];
        beardPos = [bbox(:,2) + 8*bbox(:,4) - size(beard,1) + 1,...
            bbox(:,1) - round(bbox(:,3)/5)];
        % Use the custom imoverlay function to overlay the images onto the videoFrame
        videoOut = imoverlay(videoFrame, hat, hatPos);
        videoOut = imoverlay(videoOut, beard, beardPos);
    end
    % Display the video frame
    step(videoPlayer, videoOut);
    % Update frame count
    frameCount = frameCount + 1;
    % Check whether the video player window has been closed.
    runLoop = isOpen(videoPlayer);
end
%% Release resources
clear cam
release(videoPlayer);
release(detector);

