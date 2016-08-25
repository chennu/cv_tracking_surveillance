%%%%%%%% Program to detect a person entering into a secured region by
%%%%%%%% Background subtraction using FrameDifference Method.
%%%% @author : Chaitanya Sri Krishna Lolla.


clear all;
close all;
clc;

% Creating an object for video Input
source_video = vision.VideoFileReader('FinalSample.wmv');
%Creating an object for video Player
videoPlayer= vision.VideoPlayer();

%Read the input video and display it.
while ~isDone(source_video)
    videoFrame1 = step(source_video);
    step(videoPlayer,videoFrame1);
end

release(videoPlayer);
release(source_video);


count=0;

background= rgb2gray(step(source_video));

%Implementing Frame difference algorithm and displaying the processed
%frames.
while ~isDone(source_video)
   count=count+1;
   videoFrame = rgb2gray(step(source_video));
   finalFrame = abs(double(videoFrame) - double(background));
  
   step(videoPlayer,finalFrame);
      
end
%display the total number of frames.
display(count); 
release(videoPlayer);



