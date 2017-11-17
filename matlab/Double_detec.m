    I=imread('Kevin2.jpg');
    
    I_gris=rgb2gray(I);

    [a b]=size(I(:,:,1));

    detector = vision.CascadeObjectDetector('FrontalFaceLBP', 'MinSize', [floor(a/10) floor(b/10)]);
    eyeDetector = vision.CascadeObjectDetector('EyePairBig');
    
    bboxes=step(detector, I_gris);
    eyebboxes=step(eyeDetector, I_gris);
    
    [m,n]=size(bboxes);
    [eye_m, eye_n]=size(eyebboxes);
    
    figure
    imshow(I)

    for i=1:m
        rectangle('Position',bboxes(i,:),'EdgeColor','r','LineWidth',3)
    end
    for j=1:eye_m
        rectangle('Position',eyebboxes(j,:),'EdgeColor','r','LineWidth',3)
    end
    