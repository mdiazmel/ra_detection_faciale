I=imread(input('...'));

%I=imrotate(I,90);

I_gris=rgb2gray(I);

[a b]=size(I(:,:,1));

detector = vision.CascadeObjectDetector('FrontalFaceLBP', 'MinSize', [floor(a/10) floor(b/10)]);

bboxes=step(detector, I_gris);
[m,n]=size(bboxes);

figure
imshow(I)
%hold on
for i=1:m
    rectangle('Position',bboxes(i,:),'EdgeColor','r','LineWidth',3)
end