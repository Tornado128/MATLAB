clear
clc
cd /home/yaser/Desktop/RESEARCH/BrownianDynamics/Newtonian/4beads/pusherSizeBox20/
% cd /home/yaser/Desktop/RESEARCH/BrownianDynamics/Newtonian/pusherSizeBox10/
%figure1 = figure('XVisual',...
%    '0x27 (TrueColor, depth 24, RGB mask 0xff0000 0xff00 0x00ff)',...
%    'Color',[1 1 1]);
Nt=400;                         %number of tracers
Ns=1528;                        %number of swimmers
confinement=20;

d=importdata('tracerPOS.txt');
d=d+confinement/2;
ds=importdata('CenterOfMassPositionPTU.txt');
ds=ds+confinement/2;
dJ=importdata('swimmerVELOCITY.txt');
Vt=importdata('tracerVELOCITY.txt');

I=ceil(max(ds(:,1)));
J=ceil(max(ds(:,2)));
K=ceil(max(ds(:,3)));

% [X,Y] = meshgrid(-8:.5:8);
% Z = X+1;
% surf(X,Y,Z)

D=size(d);
time=D(1)/Nt;

k=0;


 SHO=0;
 numframes=1500;
 fig1=figure('Color',[1 1 1]);

 set(fig1, 'Position', [950 950 950 950]);
 AA=moviein(numframes,fig1);
 set(fig1,'NextPlot','replacechildren');
%count=100;
%a=rand(count,3);
for i=1:1:time
    k=k+1;
    numT=1+(i-1)*Nt:1:i*Nt;
    numS=1+(i-1)*Ns:1:i*Ns;
    
    NUMT=1+(i-1)*Nt:1:i*Nt-1;
    
    subplot(2,2,1);
    hTRACER1=plot3(d(NUMT,1),d(NUMT,2),d(NUMT,3),'o','MarkerSize',3);
    hold on
    hTRACER2=plot3(d(max(numT),1),d(max(numT),2),d(max(numT),3),'o','MarkerSize',7,'Color',[1 0 0]);
    title({'tracers position'},'FontWeight','bold','FontSize',14);
    grid on;
    axis square;
    set(gca,'ZTick',[]);
    set(gca,'YTick',[]);
    set(gca,'XTick',[]);
    
%     sum(Vt(numT,1))
%     sum(Vt(numT,2))
%     sum(Vt(numT,3))
%     for p=1+(i-1)*Nt:1:i*Nt;
%         if ( sum(Vt(numT,1))/Nt>0 & Vt(p,1)<-sum(Vt(numT,1))/Nt/2) 
%             Vt(p,1)=0;
%         end
%         if ( sum(Vt(numT,1))/Nt<0 & Vt(p,1)>sum(Vt(numT,1))/Nt/2 )
%             Vt(p,1)=0;
%         end
%         if ( sum(Vt(numT,2))/Nt>0 & Vt(p,2)<-sum(Vt(numT,1))/Nt/2 )
%             Vt(p,2)=0;
%         end
%         if ( sum(Vt(numT,2))/Nt<0 & Vt(p,2)>sum(Vt(numT,1))/Nt/2 )
%             Vt(p,2)=0;
%         end
%         if ( sum(Vt(numT,3))/Nt>0 & Vt(p,3)<-sum(Vt(numT,1))/Nt/2 )
%             Vt(p,3)=0;
%         end
%         if ( sum(Vt(numT,3))/Nt<0 & Vt(p,3)>sum(Vt(numT,1))/Nt/2 )
%             Vt(p,3)=0;
%         end
%     end
    
    subplot(2,2,2);
    hTRACER=quiver3( d(numT,1),d(numT,2),d(numT,3), Vt(numT,1),Vt(numT,2),Vt(numT,3),1);
    title({'tracers velocity'},'FontWeight','bold','FontSize',14);
    grid on;
    axis square;
    set(gca,'ZTick',[]);
    set(gca,'YTick',[]);
    set(gca,'XTick',[]);
    axis([0 I 0 J 0 K]);
    
    [sum(sqrt(dJ(numS,1).^2+dJ(numS,2).^2+dJ(numS,3).^2))/Ns sum(sqrt(Vt(numT,1).^2+Vt(numT,2).^2+Vt(numT,3).^2))/Nt]
    
    subplot(2,2,3);
    hSWIM=plot3(ds(numS,1),ds(numS,2),ds(numS,3),'o','MarkerSize',3);
    title({'SPPs position'},'FontWeight','bold','FontSize',14);
    grid on;
    axis square;
    set(gca,'ZTick',[]);
    set(gca,'YTick',[]);
    set(gca,'XTick',[]);
    
    %count=100;
    %a=rand(count,3);
    subplot(2,2,4);
    hTRACER=quiver3( ds(numS,1),ds(numS,2),ds(numS,3) , dJ(numS,1),dJ(numS,2),dJ(numS,3));
    title({'SPPs velocity'},'FontWeight','bold','FontSize',14);
    grid on;
    axis square;
    set(gca,'ZTick',[]);
    set(gca,'YTick',[]);
    set(gca,'XTick',[]);
    axis([0 I 0 J 0 K]);
    

    
    STT=annotation(fig1,'textbox',...
    [0.490843750000001 0.961632499901252 0.26071875 0.0343642611683855],...
    'String',i,...
    'FontWeight','bold',...
    'FontSize',14,...
    'FitBoxToText','off',...
    'LineStyle','none');
    pause(0.5);
    SHO=SHO+1;
    FILM(:,SHO) = getframe(fig1);
    delete(STT);
    delete(hTRACER1);
    delete(hTRACER2);

end
        

