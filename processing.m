%Clear workspace

clc
clear

close all

%Image Load

frontimage = imread('front.png');
backimage = imread('back.png');
rightimage = imread('right.png');
leftimage = imread('left.png');

%Image Proccessing

% figure
frontimage2 = flip(frontimage,1);
%image(frontimage2)

% figure
backimage2 = imrotate(backimage,180,'bilinear');
backimage2 = flip(backimage2,1);
%image(backimage2)

% figure
rightimage2 = imrotate(rightimage,90,'bilinear');
rightimage2 = flip(rightimage2,2);
%image(rightimage2)

% figure
leftimage2 = imrotate(leftimage,270,'bilinear');
leftimage2 = flip(leftimage2,2);
%image(leftimage2)

clear frontimage backimage rightimage leftimage

%image size searching
%Front and back's second size will apply (middle rectangle)
%Left and right's first size will apply

%the LARGEST size will be size of sqaure

%  
%                           centerline
% 
%                (leftback)       BACK      (rightback)
% 
%  Midlinemat ->  LEFT   (Middle Square)     RIGHT
% 
%                (leftfront)      FRONT     (rightfront)
% 
% 
% 

MidSq = zeros(max(size(leftimage2,1),size(rightimage2,1)),max(size(frontimage2,2),size(backimage2,2)),3);
% 
% Midlinemat = [leftimage2 MidSq rightimage2];
% 

leftback = zeros(size(backimage2,1),size(leftimage2,2),3);
rightback = zeros(size(backimage2,1),size(rightimage2,2),3);

leftfront = zeros(size(frontimage2,1),size(leftimage2,2),3);
rightfront = zeros(size(frontimage2,1),size(rightimage2,2),3);

finalimage = ...
    [...
    leftback backimage2 rightback; ...
    leftimage2 MidSq rightimage2; ...
    leftfront frontimage2 rightfront ...
    ];

figure
image(finalimage)
    
imwrite(finalimage,'FourSqaureImage.png');


