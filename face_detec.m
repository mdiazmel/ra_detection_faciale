function face_detec(d)

for j=1:length(d)

    I=imread([d(j).folder '\' d(j).name]);
    
    I_gris=rgb2gray(I);

    [a b]=size(I(:,:,1));

    detector = vision.CascadeObjectDetector('FrontalFaceLBP', 'MinSize', [floor(a/10) floor(b/10)]);

    bboxes=step(detector, I_gris);
    [m,n]=size(bboxes);

    %figure
    imshow(I)

    for i=1:m
        rectangle('Position',bboxes(i,:),'EdgeColor','r','LineWidth',3)
    end
    
    waitforbuttonpress;
end


end

