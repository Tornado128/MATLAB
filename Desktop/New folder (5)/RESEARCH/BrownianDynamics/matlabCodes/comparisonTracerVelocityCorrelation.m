clear
clc

cd /home/yaser/Desktop/RESEARCH/BrownianDynamics/Newtonian/pusher/pusherSizeBox20/
ds=importdata('TracerVelocityCorrelation.txt');
cd /home/yaser/Desktop/RESEARCH/BrownianDynamics/Newtonian/puller/pullerSizeBox20/
du=importdata('TracerVelocityCorrelation.txt');
cd /home/yaser/Desktop/RESEARCH/BrownianDynamics/NonNewtonian/pusher/pusherBoxSize20/
d0=importdata('TracerVelocityCorrelation.txt');
cd /home/yaser/Desktop/RESEARCH/BrownianDynamics/NonNewtonian/pusher/pusherBoxSize201/
d1=importdata('TracerVelocityCorrelation.txt');
cd /home/yaser/Desktop/RESEARCH/BrownianDynamics/NonNewtonian/pusher/pusherBoxSize202/
d2=importdata('TracerVelocityCorrelation.txt');
cd /home/yaser/Desktop/RESEARCH/BrownianDynamics/NonNewtonian/puller/pullerBoxSize20/
dd0=importdata('TracerVelocityCorrelation.txt');
cd /home/yaser/Desktop/RESEARCH/BrownianDynamics/NonNewtonian/puller/pullerBoxSize201/
dd1=importdata('TracerVelocityCorrelation.txt');
cd /home/yaser/Desktop/RESEARCH/BrownianDynamics/NonNewtonian/puller/pullerBoxSize202/
dd2=importdata('TracerVelocityCorrelation.txt');

plot(ds(:,1),ds(:,2),'*',d0(:,1),d0(:,2),d1(:,1),d1(:,2),d2(:,1),d2(:,2),du(:,1),du(:,2),'o',dd0(:,1),dd0(:,2),dd1(:,1),dd1(:,2),dd2(:,1),dd2(:,2));