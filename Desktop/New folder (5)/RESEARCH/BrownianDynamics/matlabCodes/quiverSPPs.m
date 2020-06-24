clear
clc
cd /home/yaser/Desktop/RESEARCH/BrownianDynamics/pusherSizeBox10
figure1 = figure('XVisual',...
    '0x27 (TrueColor, depth 24, RGB mask 0xff0000 0xff00 0x00ff)',...
    'Color',[1 1 1]);
Nt=400;                         %number of tracers
Ns=190;                         %number of swimmers
beads=2;                        %number of beads

dJ=importdata('orienSWIMMERS.txt');
ds=importdata('centerMassSWIMMERS.txt');

DJ=size(dJ);
time=DJ(1)/Ns;

I=ceil(max(ds(:,1)));
J=ceil(max(ds(:,2)));
K=ceil(max(ds(:,3)));

k=0;
for i=1:1:time
    k=k+1;
    
    hTRACER=quiver3( ds(k*(1:1:Ns),1),ds(k*(1:1:Ns),2),ds(k*(1:1:Ns),3), dJ(k*(1:1:Ns),1),dJ(k*(1:1:Ns),2),dJ(k*(1:1:Ns),3),.5);
    grid on
    axis square
    set(gca,'ZTick',[]);
    set(gca,'YTick',[]);
    set(gca,'XTick',[]);
    axis([0 I 0 J 0 K]);
    
    STT=annotation(figure1,'textbox',...
    [0.490843750000001 0.961632499901252 0.26071875 0.0343642611683855],...
    'String',i,...
    'FontWeight','bold',...
    'FontSize',14,...
    'FitBoxToText','off',...
    'LineStyle','none');
    pause(1);
    delete(STT);
end

