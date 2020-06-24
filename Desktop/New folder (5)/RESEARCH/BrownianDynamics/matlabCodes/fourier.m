clear 
clc
cd /home/yaser/Desktop/RESEARCH/BrownianDynamics/NonNewtonian/pusher/pusherBoxSize10/
data = importdata('fourier.txt');                     
dd=size(data);





interval = 24; %number of modes
deltaT   = 1;



% %---------%SigmaF%-----------------------------
for j=1:1:interval
    numer=0;
    for i=j:interval:dd(1);
        numer=numer+1;
        d1(j,numer)=data(i,1);
    end
end

figure1 = figure('XVisual',...
    '0x27 (TrueColor, depth 24, RGB mask 0xff0000 0xff00 0x00ff)',...
    'Color',[1 1 1]);

axes1 = axes('Parent',figure1,'FontWeight','bold','FontSize',20);
box(axes1,'on');
hold(axes1,'all');

% for i=1:1:dd/interval
%     % De=250 H=40
%       st1(i)=(9.89478812200050883E-005)*exp( 1*( 0.210077748643993)*deltaT*(i-1) 
%       st2(i)=(1.66155310958150746E-005)*exp( 1*( 0.210077748643993)*deltaT*(i-1) );
%       st3(i)=(8.25775851293499940E-004)*exp( 0.001804041987063*deltaT*(i-1) );
%       st4(i)=(6.54021092592869642E-004)*exp( 0.004347772544518*deltaT*(i-1) );
% %       st1(i)=(9.89478812200050883E-005)*exp( 0.034372387944220*deltaT*(i-1) );
% %       st2(i)=(1.66155310958150746E-005)*exp( 0.034372387944220*deltaT*(i-1) );
% %       st3(i)=(8.25775851293499940E-004)*exp( 0.031771180332086*deltaT*(i-1) );
% %       st4(i)=(6.54021092592869642E-004)*exp( (0.021196478510290 + 0.017807951042605i)*deltaT*(i-1) );
% end
%  PPP=plot(deltaT*(1:1:dd/interval),d1(1,:),deltaT*(1:1:dd/interval),d1(2,:) ...
%      ,deltaT*(1:1:dd/interval),st1,'-.b',deltaT*(1:1:dd/interval),st2,'-.g' ...
%      ,deltaT*(1:1:dd/interval),d1(3,:), deltaT*(1:1:dd/interval),d1(4,:),'k'    ...
%      ,deltaT*(1:1:dd/interval),st3,'-.r',deltaT*(1:1:dd/interval),st4,'-.k');
% PPP=plot(deltaT*(1:1:dd/interval),d1(3,:) ...
%     ,deltaT*(1:1:dd/interval),d1(4,:) ...
%     ,deltaT*(1:1:dd/interval),st3,'-.b',deltaT*(1:1:dd/interval),st4,'-.g');

 PPP=plot(deltaT*(1:1:dd/interval),d1(1,:),'c',deltaT*(1:1:dd/interval),d1(2,:),'b' ...
     ,deltaT*(1:1:dd/interval),d1(3,:),'g',deltaT*(1:1:dd/interval),d1(4,:),'k' ...
     ,deltaT*(1:1:dd/interval),d1(5,:),'r', deltaT*(1:1:dd/interval),d1(6,:),'m'    ...
     ,deltaT*(1:1:dd/interval),d1(7,:),'y',deltaT*(1:1:dd/interval),d1(8,:),'-.b' ...
     ,deltaT*(1:1:dd/interval),d1(9,:),'-.m',deltaT*(1:1:dd/interval),d1(10,:),'-.y' ...
     ,deltaT*(1:1:dd/interval),d1(11,:),'-.k', deltaT*(1:1:dd/interval),d1(12,:),'-.r'    ...
     ,deltaT*(1:1:dd/interval),d1(13,:),'-.g',deltaT*(1:1:dd/interval),d1(14,:),'.b' ...
     ,deltaT*(1:1:dd/interval),d1(15,:),'.k',deltaT*(1:1:dd/interval),d1(16,:),'.g' ...
     ,deltaT*(1:1:dd/interval),d1(17,:),'.g', deltaT*(1:1:dd/interval),d1(18,:),'.r'    ...
     ,deltaT*(1:1:dd/interval),d1(19,:),'.c',deltaT*(1:1:dd/interval),d1(20,:),'.y' ...
 );
set(PPP,'LineWidth',2)
xlabel({'time'},'FontWeight','bold','FontSize',26);

% Create ylabel
ylabel({'F(velocity)'},'FontWeight','bold','FontSize',26);

% Create title
%title({'A'},'FontWeight','bold','FontSize',14);

legend('0,0,0','1,0,0','0,1,0','0,0,1','0,1,1','1,0,1','1,1,0','1,1,1','2,0,0','0,2,0','0,0,2','0,1,2','2,1,0','2,1,1','2,1,2','2,2,2','3,2,1','3,3,3','4,0,0','1,2,4');

% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.906260850694444 0.325406085783269 0.0574869791666667 0.599482662192393]);

axis tight;
