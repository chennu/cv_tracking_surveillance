%%%%%%%% Program to detect a person entering into a secured region by
%%%%%%%% Background subtraction using approximate median
%%%% @author : Chaitanya Sri Krishna Lolla.

clear all;
close all;
clc;
%Creating an object for input video.
source= vision.VideoFileReader('FinalSample.wmv');
%Creating an object for videoPlayer.
videoPlayer= vision.VideoPlayer;

%Read and display the input video.
while ~isDone(source)
    videoFrame1= step(source);
    step(videoPlayer,videoFrame1);
end

release(videoPlayer);

count=0;
%Display the background
background= rgb2gray(step(source));
imshow(background);
%Implementing the approximate median algorithm.
for i =2:967
    
    count=count+1;
    videoFrame= rgb2gray(step(source));
    %Performing the frame difference.
    DiffFrames=abs(videoFrame-background);
    
    %Approximate the median of background pixels.
       if(DiffFrames>background)
           background=background+1;

       elseif( DiffFrames<background)
           background= background-1;
       end

     step(videoPlayer,DiffFrames);
end

display(count);
release(videoPlayer);

release(source);