clear
clc

cd /home/yaser/Desktop/RESEARCH/BrownianDynamics/BoxSize10/pusher_independent/
NB=2;                                                                       % number of beads
NP=400;                                                                     % number of particles
BL=10;                                                                      % box length
%grid=fix(BL)+1;                                                            % grid
grid=5;                                                                     % odd number (This normally should be larger than the size of bateria)
delx=BL/(grid-1);                                                           % increment in x
time=100;                                                                   % time in 'xyz.dat' file


BV=BL*BL*BL;                                                                % box volume
UC=NP/BV;                                                                   % uniform concentration (This will be used in scaling the concentration)

position =importdata('velocitySWIMMERS.txt');
direction=importdata('orienSWIMMERS.txt');
number( 1:1:(grid-1) , 1:1:(grid-1)  ) = 0;
nxx   ( 1:1:(grid-1) , 1:1:(grid-1)  ) = 0;
nyy   ( 1:1:(grid-1) , 1:1:(grid-1)  ) = 0;

figure1 = figure('XVisual',...
    '0x27 (TrueColor, depth 24, RGB mask 0xff0000 0xff00 0x00ff)',...
    'Color',[1 1 1]);

im=1;
for i=1:1:time
    adad=0;
    for j=(1+NP*(i-1)):1:(i*NP)
            number( fix((position(j,1)+BL/2)/delx-.000001)+1 , fix( (position(j,2)+BL/2)/delx-.000001)+1  )  = ...
            number( fix((position(j,1)+BL/2)/delx-.000001)+1 , fix( (position(j,2)+BL/2)/delx-.000001)+1  )  +1;
        
            nxx( fix((position(j,1)+BL/2)/delx-.000001)+1 , fix( (position(j,2)+BL/2)/delx-.000001)+1  )  = ...
            nxx( fix((position(j,1)+BL/2)/delx-.000001)+1 , fix( (position(j,2)+BL/2)/delx-.000001)+1  )  + direction(j,1);
        
            nyy( fix((position(j,1)+BL/2)/delx-.000001)+1 , fix( (position(j,2)+BL/2)/delx-.000001)+1  )  = ...
            nyy( fix((position(j,1)+BL/2)/delx-.000001)+1 , fix( (position(j,2)+BL/2)/delx-.000001)+1  )  + direction(j,2);
        
            adad=adad+1;
    end 
    C=(number/(delx*delx*BL))/UC;
    
    hVELO=subplot(1,2,1);
    hVELO=quiver(1:1:(grid-1),1:1:(grid-1),nxx/((nyy.^2.0+nxx.^2.0).^.5),nyy/((nyy.^2.0+nxx.^2.0).^.5));
    set(gca,'YTick',[]);
    set(gca,'XTick',[]);
    axis([1 grid-1 1 grid-1]);
    title('Director Field','FontWeight','bold','FontSize',12);
    
%     [XI,YI] = meshgrid(1:.01:(grid-1),1:.01:(grid-1));
%     ZI=interp2(1:1:(grid-1),1:1:(grid-1),C,XI,YI,'spline');
    hCONC=subplot(1,2,2);
    hCONC=contourf(1:1:(grid-1),(1:1:grid-1),C,'edgecolor','none');
    title('Concentration Field','FontWeight','bold','FontSize',12);
    set(gca,'YTick',[]);
    set(gca,'XTick',[]);
    colormap jet;
    colorbar;
    caxis([0        2]);
    
    obj=annotation(figure1,'textbox',...
    [0.506454078638498 0.942815202271751 0.13103125 0.0380313199105144],...
    'String',im*(i-1),...
    'FontWeight','bold',...
    'FontSize',20,...
    'FitBoxToText','off',...
    'LineStyle','none');
    number( 1:1:(grid-1) , 1:1:(grid-1)  ) = 0;
    nxx   ( 1:1:(grid-1) , 1:1:(grid-1)  ) = 0;
    nyy   ( 1:1:(grid-1) , 1:1:(grid-1)  ) = 0;
    pause(0.1);
    delete(obj);
end