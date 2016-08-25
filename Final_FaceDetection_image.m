   %  Program to perform FaceDetection in an image.
%%%% @author : Chaitanya Sri Krishna Lolla.


clear all;
close all;
clc;
%Creating an object for face detection.
faceDetector= vision.CascadeObjectDetector();  
 
%Target Image
Target_image= imread('visionteam.jpg');          
figure;
imshow(Target_image)

drawBox= step(faceDetector,Target_image);
faceDetected= insertObjectAnnotation(Target_image,'rectangle',drawBox,'Face');
imshow(faceDetected);


 %finding the number of persons in the target image
[rows columns]=size(drawBox)  
display('Number of faces detected');
display(rows);   %%% number of rows is equal to number of facess

for count=1:rows
%read the face
readface=drawBox(count,1:columns);      

%Crop and display the Face detected in the target image.
croppedfaces= imcrop(faceDetected,readface);
figure;
imshow(croppedfaces);

%Creating the database
switch (count)
    
    case 1,  imwrite(croppedfaces,'Saved_Image(1).jpg');
    case 2,  imwrite(croppedfaces,'Saved_Image(2).jpg');
    case 3,  imwrite(croppedfaces,'Saved_Image(3).jpg');
    case 4,  imwrite(croppedfaces,'Saved_Image(4).jpg');
    case 5,  imwrite(croppedfaces,'Saved_Image(5).jpg');
    case 6,  imwrite(croppedfaces,'Saved_Image(6).jpg');
end
end
