clear
clc
cd /home/yaser/Desktop/RESEARCH/BrownianDynamics/pusherSizeBox10
figure1 = figure('XVisual',...
    '0x27 (TrueColor, depth 24, RGB mask 0xff0000 0xff00 0x00ff)',...
    'Color',[1 1 1]);

time=100;
grid=41;
cn=3;

dvf=importdata('fluidVELOCITY.txt');                        % fluid velocity at each node
vf=(dvf(:,1).^2+dvf(:,2).^2+dvf(:,3).^2).^.5;               % fluid avg velocity at each node

cmap=hsv(cn);

s=0;
for t=1:1:time
    s1=0;
    s2=0;
    s3=0;
    vmax=max(vf((t-1)*grid*grid*grid+1:1:t*grid*grid*grid));
    for i=1:1:grid
        for j=1:1:grid
            for k=1:1:grid
                s=s+1;
                
                velX(i,j,k)=dvf(s,1);
                velY(i,j,k)=dvf(s,2);
                velZ(i,j,k)=dvf(s,3);
                
                if (vf(s)<2*vmax/6)
                   s1=s1+1;
                   vx1(s1)=velX(i,j,k);
                   vy1(s1)=velY(i,j,k);
                   vz1(s1)=velZ(i,j,k);
                   x1(s1)=i;
                   y1(s1)=j;
                   z1(s1)=k;
                end
                if ( (2*vmax/6 < vf(s)) &  (vf(s) < 4*vmax/6) )
                   s2=s2+1;
                   vx2(s2)=velX(i,j,k);
                   vy2(s2)=velY(i,j,k);
                   vz2(s2)=velZ(i,j,k);
                   x2(s2)=i;
                   y2(s2)=j;
                   z2(s2)=k;
                end
                if (4*vmax/6 < vf(s))
                   s3=s3+1;
                   vx3(s3)=velX(i,j,k);
                   vy3(s3)=velY(i,j,k);
                   vz3(s3)=velZ(i,j,k);
                   x3(s3)=i;
                   y3(s3)=j;
                   z3(s3)=k;
                end
                
            end
        end
    end
    for m=1:1:3
        if (m==1)
           hTRACER1=quiver3( x1(:),y1(:),z1(:),vx1(:),vy1(:),vz1(:),'color',cmap(1,:));
           axis square;
           set(gca,'ZTick',[]);
           set(gca,'YTick',[]);
           set(gca,'XTick',[]);
           axis([0 grid 0 grid 0 grid]);
           hold on
        end
        if (m==2)
           hTRACER2=quiver3( x2(:),y2(:),z2(:),vx2(:),vy2(:),vz2(:),'color',cmap(2,:));
           axis square;
           set(gca,'ZTick',[]);
           set(gca,'YTick',[]);
           set(gca,'XTick',[]);
           axis([0 grid 0 grid 0 grid]);
           hold on
        end
        if (m==3)
           hTRACER3=quiver3( x3(:),y3(:),z3(:),vx3(:),vy3(:),vz3(:),'color',cmap(3,:));
           axis square;
           set(gca,'ZTick',[]);
           set(gca,'YTick',[]);
           set(gca,'XTick',[]);
           axis([0 grid 0 grid 0 grid]);an
           hold on
        end
    end
    %colorbar hsv;
    pause(.1);
    delete(hTRACER1);
    delete(hTRACER2);
    delete(hTRACER3);
    clear x1 x2 x3 y1 y2 y3 z1 z2 z3 vx1 vx2 vx3 vy1 vy2 vy3 vz1 vz2 vz3     
         
end
