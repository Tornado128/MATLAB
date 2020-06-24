% clear
% clc
% GRID=32;
% time=1000;
% cd /home/yaser/Desktop/RESEARCH/BrownianDynamics/
% velocity=importdata('velocity.txt');
% V=size(velocity);
sadeh=2;
num=0;
I=0; J=0; K=0;
figure1 = figure('XVisual',...
'0x27 (TrueColor, depth 24, RGB mask 0xff0000 0xff00 0x00ff)',...
'Color',[1 1 1]);
clear VELX VELY VELZ ;
clear IX IY IZ ;
for i=1:1:GRID-1
    IX(floor(i/sadeh)+1)=floor(floor(i/sadeh)+1);
    IY(floor(i/sadeh)+1)=floor(floor(i/sadeh)+1);
    IZ(floor(i/sadeh)+1)=floor(floor(i/sadeh)+1);
end
            

for t=1:1:V(1)/((GRID-1)^3)
    for i=1:1:GRID-1
        for j=1:1:GRID-1
            for k=1:1:GRID-1
                num=num+1;
                VELx(i,j,k)=velocity(num,1);
                VELy(i,j,k)=velocity(num,2);
                VELz(i,j,k)=velocity(num,3);
                IM=mod(i,sadeh);
                JM=mod(j,sadeh);
                KM=mod(k,sadeh);
                
                if ( (i==1 && JM==0 && KM==0) || (IM==0 && j==1 && KM==0) || (IM==0 && JM==0 && k==1) || (IM ==0 && JM==0 && KM==0) || (i==1 && j==1 && k==1) )
                    I=floor(i/sadeh)+1;
                    J=floor(j/sadeh)+1;
                    K=floor(k/sadeh)+1;
                    VELX(I,J,K)=velocity(num,1);
                    VELY(I,J,K)=velocity(num,2);
                    VELZ(I,J,K)=velocity(num,3);
                end
            end
        end
    end
    [xx,yy,zz] = meshgrid(IX,IY,IZ);
    L=quiver3(xx(12,:,:),yy(12,:,:),zz(12,:,:),VELX(12,:,:),VELY(12,:,:),VELZ(12,:,:));
    %L=quiver3(xx,yy,zz,VELX,VELY,VELZ);
    %L=quiver(xx(:,:,4),yy(:,:,4),VELX(:,:,4),VELY(:,:,4));
    set(L,'Color','b');
    set(gca,'ZTick',[]);
    set(gca,'YTick',[]);
    set(gca,'XTick',[]);    
    axis([1 I 1 J 1 K]);
%    axis([1 I 1 J]);
    obj=annotation(figure1,'textbox',...
    [0.490843750000001 0.961632499901252 0.26071875 0.0343642611683855],...
    'String',t,...
    'FontWeight','bold',...
    'FontSize',14,...
    'FitBoxToText','off',...
    'LineStyle','none');
     pause(.1)
     if t~=V(1)/((GRID-1)^3)
        delete(obj);
        delete(L);
     end
end