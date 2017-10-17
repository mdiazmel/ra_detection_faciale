I=imread(input('...'));

%I=imrotate(I,90);

[Ix, Iy]=size(I);

I_gris=rgb2gray(I);

detector = vision.CascadeObjectDetector('FrontalFaceLBP', 'MinSize', [100 100]);

bboxes=step(detector, I_gris);
[m,n]=size(bboxes);

figure
imshow(I)
%hold on
for i=1:m
    rectangle('Position',bboxes(i,:),'EdgeColor','r','LineWidth',3)
end