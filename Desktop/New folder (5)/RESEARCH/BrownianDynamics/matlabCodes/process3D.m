clear
clc

cd /home/yaser/Desktop/RESEARCH/BrownianDynamics/

NP=1600;                                                                    %number of particles
BL=20.031;                                                                  %box length
%grid=fix(BL)+1;                                                            %grid
grid=7;                                                                     %odd number (This normally should be larger than the size of bateria)
delx=BL/(grid-1);                                                           %increment in x
time=500;                                                                   %time in 'xyz.dat' file
position=importdata('xyz1.txt');       
S=size(position);
im=1;

num=0;                                                                      %numerator

i=2:2:S(1);
j=(2:2:S(1))-1;

POSITION(1:1:S(1)/2,1:1:3)=(position(i,1:1:3)+position(j,1:1:3))/2;         %center
clear position

BV=BL*BL*BL;                                                                %box volume
UC=NP/BV;                                                                   %uniform concentration (This will be used in scaling the concentration)

number( 1:1:(grid-1) , 1:1:(grid-1) , 1:1:(grid-1)  ) = 0;

figure1 = figure('XVisual',...
    '0x27 (TrueColor, depth 24, RGB mask 0xff0000 0xff00 0x00ff)',...
    'Color',[1 1 1]);

for i=1:1:time
    for j=(1+NP*(i-1)):1:i*NP
            number( fix((POSITION(j,1)+BL/2)/delx)+1 , fix( (POSITION(j,2)+BL/2)/delx)+1 ,  fix( (POSITION(j,2)+BL/2)/delx)+1  )  = ...
            number( fix((POSITION(j,1)+BL/2)/delx)+1 , fix( (POSITION(j,2)+BL/2)/delx)+1 ,  fix( (POSITION(j,2)+BL/2)/delx)+1  )  +1;
    end 
    C=(number/(delx*delx*delx))/UC;
    
    [XI,YI,ZI] = meshgrid( 1:.01:(grid-1) , 1:.01:(grid-1) , 1:.01:(grid-1));
    VALUE=interp3(1:1:(grid-1),1:1:(grid-1),1:1:(grid-1),C,XI,YI,ZI,'spline');
    hCONC=contourf(1:.01:(grid-1),(1:.01:grid-1),(1:.01:grid-1),VALUE,'edgecolor','none');
    
    %hCONC=contourf(1:1:(grid-1),(1:1:grid-1),C,'edgecolor','none');
    
    title('Concentration Field','FontWeight','bold','FontSize',12);
    set(gca,'ZTick',[]);
    set(gca,'YTick',[]);
    set(gca,'XTick',[]);
    colormap jet;
    colorbar;
    caxis([0        2]);
    pause(0.1);
    
    annotation(figure1,'textbox',...
    [0.490843750000001 0.961632499901252 0.26071875 0.0343642611683855],...
    'String',(i-1)*im,...
    'FontWeight','bold',...
    'FontSize',14,...
    'FitBoxToText','off',...
    'LineStyle','none');
    number( 1:1:(grid-1) , 1:1:(grid-1) , 1:1:(grid-1)  ) = 0;
end

 

