clear
clc
grid=11;
GRID=51;
time=500;
cd /home/yaser/Desktop/RESEARCH/BrownianDynamics/pusherSizeBox40/
concen=importdata('GHELZAT.txt');
S=size(concen);
num=0;

figure1 = figure('XVisual',...
'0x27 (TrueColor, depth 24, RGB mask 0xff0000 0xff00 0x00ff)',...
'Color',[1 1 1]);
for t=1:1:S(1)/((grid-1)^3)
    for i=1:1:grid-1
        for j=1:1:grid-1
            for k=1:1:grid-1
                num=num+1;
                conc(i,j,k)=concen(num,1);
            end
        end
    end
%    [x,y,z] = meshgrid(1:1:grid-1,1:1:grid-1,1:1:grid-1);
%    xslice = [1,5,grid-1]; yslice = 3; zslice = [1,5];
%    h=slice(x,y,z,conc,xslice,yslice,zslice)

    xslice = [1:.025:grid-1]; yslice = [1:.025:grid-1]; zslice = [1:.025:grid-1];
    h=contourslice(1:1:grid-1,1:1:grid-1,1:1:grid-1,conc,xslice,yslice,zslice,2);
    %h=contourslice(1:1:grid-1,1:1:grid-1,1:1:2,conc(1:1:grid-1,1:1:grid-1,1:1:2),xslice,yslice,zslice,2);
    %h1=contourslice(1:1:grid-1,1:1:2,1:1:grid-1,conc(1:1:grid-1,1:1:2,1:1:grid-1),xslice,yslice,zslice,2);
    view(3);
    set(h,'LineStyle','-','LineWidth',.001);
    set(gca,'ZTick',[]);
    set(gca,'YTick',[]);
    set(gca,'XTick',[]);    
    axis([1 grid-1 1 grid-1 1 grid-1]);
    colormap;                           % colormap jet is the best
    SSS=colorbar;
    colorBar=get(SSS,'Children');
    caxis([.4        1.6]);
    camlight headlight;
    lighting phong; 
    %colorbar;
    
    obj=annotation(figure1,'textbox',...
    [0.490843750000001 0.961632499901252 0.26071875 0.0343642611683855],...
    'String',t,...
    'FontWeight','bold',...
    'FontSize',14,...
    'FitBoxToText','off',...
    'LineStyle','none');
     camlight headlight;
     lighting phong;
     pause(.5)
     if t~=S(1)/((grid-1)^3)
        delete(obj);      
        delete(h);
     end 
end
                