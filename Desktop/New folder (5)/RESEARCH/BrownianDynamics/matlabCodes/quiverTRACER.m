clear
clc
cd /home/yaser/Desktop/RESEARCH/BrownianDynamics/pusherSizeBox10
figure1 = figure('XVisual',...
    '0x27 (TrueColor, depth 24, RGB mask 0xff0000 0xff00 0x00ff)',...
    'Color',[1 1 1]);

time=100;                   %total sampling time
Nt=400;                     %number of tracers
grid=21;                    %grids
cn=3;

Pt=importdata('tracerPOS.txt');
Vt=importdata('tracerVELOCITY.txt');

vf=(Vt(:,1).^2+Vt(:,2).^2+Vt(:,3).^2).^.5;               % fluid avg velocity at each node

cmap=hsv(cn);

s=0;
for t=1:1:time
    s1=0;
    s2=0;
    s3=0;
    vmax=max( vf(1:1:(t-1)*Nt+1) );
end

