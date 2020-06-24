clear
clc
NB=20;          %number of bin
time=500;       % sampling time

cd /home/yaser/Desktop/RESEARCH/BrownianDynamics/pusherSizeBox10
d=importdata('GofR.txt');
dsPS(1:1:NB)=0;

cd /home/yaser/Desktop/RESEARCH/BrownianDynamics/pullerSizeBox10
d1=importdata('GofR.txt');
dsPL(1:1:NB)=0;


k=0;
for i=1:1:time
    for j=1:1:NB
        k=k+1;
%         dsPS(j)=dsPS(j)+d(k,2)/time;
        dsPS(j)=d(k,2);
        dsPL(j)=d1(k,2);
    end
    plot(1:1:NB,dsPS,1:1:NB,dsPL);
    pause(0.5);
end

% cd /home/yaser/Desktop/RESEARCH/BrownianDynamics/pullerSizeBox20
% d1=importdata('GofR.txt');
% dsPL(1:1:NB)=0;
% k1=0;
% for i=1:1:time
%     for j=1:1:NB
%         k1=k1+1;
% %         dsPL(j)=dsPL(j)+d1(k1,2)/time;
%         dsPL(j)=dsPL(j)+d1(k1,2);
%     end
% end

   