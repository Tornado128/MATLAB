clear
clc
grid=21;
cd /home/yaser/Desktop/RESEARCH/BrownianDynamics/pullerSizeBox40/
concen1=importdata('GHELZAT1.txt');
concen2=importdata('GHELZAT2.txt');
concen3=importdata('GHELZAT3.txt');
concen4=importdata('GHELZAT4.txt');
concen5=importdata('GHELZAT5.txt');
concen6=importdata('GHELZAT6.txt');
S=size(concen1);
xslice = [1:.025:grid-1]; yslice = [1:.025:grid-1]; zslice = [1:.025:grid-1];
alpha('direct');
figure1 = figure('XVisual',...
'0x27 (TrueColor, depth 24, RGB mask 0xff0000 0xff00 0x00ff)',...
'Color',[1 1 1]);


num=0;
for i=1:1:grid-1
    for j=1:1:grid-1
        for k=1:1:grid-1
            num=num+1;
            conc1(i,j,k)=concen1(num,1);
        end
    end
end
subplot(3,2,1)
h1=contourslice(1:1:grid-1,1:1:grid-1,1:1:grid-1,conc1,xslice,yslice,zslice,2);
set(h1,'LineStyle','-','LineWidth',.001);
set(gca,'ZTick',[]);
set(gca,'YTick',[]);
set(gca,'XTick',[]);    
axis([1 grid-1 1 grid-1 1 grid-1]);
colormap;                           % colormap jet is the best
SSS=colorbar;
colorBar=get(SSS,'Children');
caxis([0        2]);
%camlight headlight;

num=0;
for i=1:1:grid-1
    for j=1:1:grid-1
        for k=1:1:grid-1
            num=num+1;
            conc2(i,j,k)=concen2(num,1);
        end
    end
end
subplot(3,2,2)
h2=contourslice(1:1:grid-1,1:1:grid-1,1:1:grid-1,conc2,xslice,yslice,zslice,2);
set(h2,'LineStyle','-','LineWidth',.001);
set(gca,'ZTick',[]);
set(gca,'YTick',[]);
set(gca,'XTick',[]);    
axis([1 grid-1 1 grid-1 1 grid-1]);
colormap;                           % colormap jet is the best
SSS=colorbar;
colorBar=get(SSS,'Children');
caxis([0        2]);
camlight headlight;
%lighting phong; 

num=0;
for i=1:1:grid-1
    for j=1:1:grid-1
        for k=1:1:grid-1
            num=num+1;
            conc3(i,j,k)=concen3(num,1);
        end
    end
end
subplot(3,2,3)
h3=contourslice(1:1:grid-1,1:1:grid-1,1:1:grid-1,conc3,xslice,yslice,zslice,2);
set(h3,'LineStyle','-','LineWidth',.001);
set(gca,'ZTick',[]);
set(gca,'YTick',[]);
set(gca,'XTick',[]);    
axis([1 grid-1 1 grid-1 1 grid-1]);
colormap;                           % colormap jet is the best
SSS=colorbar;
colorBar=get(SSS,'Children');
caxis([0        2]);
camlight headlight;
%lighting phong; 

num=0;
for i=1:1:grid-1
    for j=1:1:grid-1
        for k=1:1:grid-1
            num=num+1;
            conc4(i,j,k)=concen4(num,1);
        end
    end
end
subplot(3,2,4)
h4=contourslice(1:1:grid-1,1:1:grid-1,1:1:grid-1,conc4,xslice,yslice,zslice,2);
set(h4,'LineStyle','-','LineWidth',.001);
set(gca,'ZTick',[]);
set(gca,'YTick',[]);
set(gca,'XTick',[]);    
axis([1 grid-1 1 grid-1 1 grid-1]);
colormap;                           % colormap jet is the best
SSS=colorbar;
colorBar=get(SSS,'Children');
caxis([0        2]);
camlight headlight;
%lighting phong; 


num=0;
for i=1:1:grid-1
    for j=1:1:grid-1
        for k=1:1:grid-1
            num=num+1;
            conc5(i,j,k)=concen5(num,1);
        end
    end
end
subplot(3,2,5)
h5=contourslice(1:1:grid-1,1:1:grid-1,1:1:grid-1,conc5,xslice,yslice,zslice,2);
set(h5,'LineStyle','-','LineWidth',.001);
set(gca,'ZTick',[]);
set(gca,'YTick',[]);
set(gca,'XTick',[]);    
axis([1 grid-1 1 grid-1 1 grid-1]);
colormap;                           % colormap jet is the best
SSS=colorbar;
colorBar=get(SSS,'Children');
caxis([0        2]);
camlight headlight;
%lighting phong;

num=0;
for i=1:1:grid-1
    for j=1:1:grid-1
        for k=1:1:grid-1
            num=num+1;
            conc6(i,j,k)=concen6(num,1);
        end
    end
end
subplot(3,2,6)
h6=contourslice(1:1:grid-1,1:1:grid-1,1:1:grid-1,conc6,xslice,yslice,zslice,2);
set(h6,'LineStyle','-','LineWidth',.001);
set(gca,'ZTick',[]);
set(gca,'YTick',[]);
set(gca,'XTick',[]);    
axis([1 grid-1 1 grid-1 1 grid-1]);
colormap;                           % colormap jet is the best
SSS=colorbar;
colorBar=get(SSS,'Children');
caxis([0       2 ]);
camlight headlight;
%lighting phong;

% Create textbox
annotation(figure1,'textbox',...
    [0.229978384194053 0.92902385358264 0.1161875 0.0380313199105138],...
    'String',{'t = 0'},...
    'FitBoxToText','off',...
    'LineStyle','none');

% Create textbox
annotation(figure1,'textbox',...
    [0.226540884194053 0.626026090719106 0.1161875 0.0380313199105138],...
    'String',{'t = 200'},...
    'FitBoxToText','off',...
    'LineStyle','none');

% Create textbox
annotation(figure1,'textbox',...
    [0.224197134194054 0.325131236132976 0.1161875 0.0380313199105138],...
    'String',{'t = 400'},...
    'FitBoxToText','off',...
    'LineStyle','none');

% Create textbox
annotation(figure1,'textbox',...
    [0.670603384194057 0.91895673948868 0.1161875 0.0380313199105138],...
    'String',{'t = 100'},...
    'FitBoxToText','off',...
    'LineStyle','none');

% Create textbox
annotation(figure1,'textbox',...
    [0.669040884194058 0.624773294298524 0.1161875 0.0380313199105138],...
    'String',{'t = 300'},...
    'FitBoxToText','off',...
    'LineStyle','none');

% Create textbox
annotation(figure1,'textbox',...
    [0.669822134194056 0.329471280875706 0.1161875 0.0380313199105138],...
    'String',{'t = 500'},...
    'FitBoxToText','off',...
    'LineStyle','none');