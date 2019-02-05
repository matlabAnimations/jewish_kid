clear all
a = image;
def_image = a.CData;
close all

%%% Parameters %%%
size = length(def_image);
center = size/2;

%%% Create Canvas %%%
canvas = zeros(size,size);
%%%%%%%%%%%%%%%%%%%%%

%%%%%%% Objects %%%%%%%%%
%% SWORD 
sword = canvas;
%%%Parameters%%% [maoz handle blade]
color = [1 1 1];
length =[15 5 10];
width =[4 3 5];
index_maoz =1;
index_handle =2;
index_blade =3;
rot_angle = 0;
%%%%%%%%%%%%%%%
%%% maoz %%%
for j = 1:width(index_maoz)
    for i =1:length(index_maoz)
    sword(center-floor(width(index_maoz)/2)+j,center-floor(length(index_maoz)/2)+i)=color(index_maoz);
    end
end
maoz_y_start = center-floor(width(index_maoz)/2)+1; 
maoz_y_end = center-floor(width(index_maoz)/2)+width(index_maoz);
%%% handle %%%
for j = 1:length(index_handle)
    for i =1:width(index_handle)
        sword(maoz_y_end+j,center-floor(width(index_handle)/2)+i)=color(index_handle);
    end
end
%%% blade %%%
for j = 1:length(index_blade)
    for i =1:width(index_blade)
        sword(maoz_y_start-j,center-floor(width(index_blade)/2)+i)=color(index_blade);
    end
end
%%% edge sword%%%
count = width(index_blade)-2;
i = 0;
while count>0
    i = i+1;
    for j=1:count
        sword(maoz_y_start-length(index_blade)-i,center-2*floor(width(index_blade)/2)+width(index_blade)...
                                -floor(count/2)+j-1)=color(index_blade);
    end
    count = count-2;
end
%%% rotating %%%
sword = imrotate(sword,rot_angle,'crop');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% video %%%%%%
time = 10;
fps = 0.1;
number_of_frame = floor(time/fps);
%%% rotaing movement
cyc_per_sec = 2;
deg_per_frame = (360*cyc_per_sec)*fps;
%%% linear movement
velocty = 5;
x = 0;
y = 0;

change_dir_rate = 0.4;
change_dir_in_frame = floor(change_dir_rate/fps);
change_velocity_rate = 0.2;
change_velocity_in_frame = floor(change_velocity_rate/fps);

phase = rot_angle;
temp_sword = sword;
for i = 1:number_of_frame
    temp_sword = 1-temp_sword;
    new_image = def_image.*temp_sword;
    surf(new_image)
    colormap(bone);
    view(180,90);
    xlim([1 size]);
    ylim([1 size]);
    pause(fps);
    %%% roatation
    temp_sword = sword;
    phase = phase+deg_per_frame;
    temp_sword = imrotate(sword,phase,'bilinear','crop');
    %%% random walk
    if(mod(i-1,change_velocity_in_frame)==0)
        vy = rand(1)*velocty;
        vx = square(velocty^2-vy);
    end
    if(mod(i-1,change_dir_in_frame)==0)
        direction_x = randi([0 1])*2-1;
        direction_y = randi([0 1])*2-1;
    end
    vy = direction_y*vy;
    vx = direction_x*vx;
    x = x + size*vx*fps;
    y = y + size*vy*fps;
    temp_sword = circshift(temp_sword,[floor(y) floor(x)]);
    
end

