clear
clc
cd /home/yaser/Desktop/RESEARCH/BrownianDynamics/

gridx=24;
gridy=24;
gridz=24;
numerator=0;

d=importdata('velocity.txt');
s=size(d);
time=s(1)/(gridx*gridy)

figure1 = figure('XVisual',...
    '0x27 (TrueColor, depth 24, RGB mask 0xff0000 0xff00 0x00ff)',...
    'Color',[1 1 1]);

for t=1:1:time
    for i=1:1:gridx
        for j=1:1:gridy
            numerator=numerator+1;
            ux(i,j)=d(numerator,2);
            uy(i,j)=d(numerator,3);
            uz(i,j)=d(numerator,4);
            UX(i,j)=ux(i,j)/(ux(i,j)*ux(i,j)+uy(i,j)*uy(i,j))^.5;
            UY(i,j)=uy(i,j)/(ux(i,j)*ux(i,j)+uy(i,j)*uy(i,j))^.5;
        end
    end
    
    hVELO=quiver(1:1:gridx,1:1:gridy,ux,uy);
    axis([1 gridx 1 gridy]);
    set(gca,'YTick',[]);
    set(gca,'XTick',[]);
    %title('Velocity Field','FontWeight','bold','FontSize',12);
    
    obj=annotation(figure1,'textbox',...
    [0.506454078638498 0.942815202271751 0.13103125 0.0380313199105144],...
    'String',t,...
    'FontWeight','bold',...
    'FontSize',20,...
    'FitBoxToText','off',...
    'LineStyle','none');

    pause(.1)
    if t~=time
        delete(obj);
    end
end