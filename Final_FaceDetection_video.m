%Program to perform Face Detection in a video 
%%%% @author : Chaitanya Sri Krishna Lolla.


clear all;
close all;
clc;
%Create an object for face Detector
faceDetector= vision.CascadeObjectDetector();

%Create a target video
source= vision.VideoFileReader('FinalSample.mp4');
%Create an object for video Player.
videoPlayer= vision.VideoPlayer();

%initialisations
count=1;
imagecount=0;
savecontrol=1
  
%Face Detection and creation of database of faces.
while ~isDone(source)
    %Read Video.
    videoFrame =step(source);
    r = rem(count,10);
   
    if ( r == 0)
        %Create a box to the face.
        bbox= step(faceDetector,videoFrame)
        face_box= insertObjectAnnotation(videoFrame,'rectangle',bbox,'Face');
           
        %If faces are detected in a frame
        if(bbox ~= 0)
            %Crop the face
            cropped=imcrop(face_box,bbox);
            imshow(cropped);
                 
                 %Save the face only once.
                 if( savecontrol==0 || imagecount==0)
                
                       switch imagecount
    
                        case 0,imwrite(cropped,'Saved_video(1).jpg');
                        case 1,imwrite(cropped,'Saved_video(2).jpg');
                        case 2,imwrite(cropped,'Saved_video(3).jpg');
                        case 3,imwrite(cropped,'Saved_video(4).jpg');
                        case 4,imwrite(cropped,'Saved_video(5).jpg');
                        case 5,imwrite(cropped,'Saved_video(6).jpg');
        
                       end
                       
                       imagecount=imagecount+1; 
                       savecontrol=1    
                                    
                  end
                 
        else
            %If no faces are detected in a frame.
           savecontrol=0
           display('bbox zero')
             
        end
        %Display the video.
        step(videoPlayer,face_box);
        end
      
      count= count+1;
  
end 
              
  display(imagecount);
release(source);    
release(videoPlayer);
