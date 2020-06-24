clear;
clc;
cd /home/yaser/Desktop/RESEARCH/BrownianDynamics/pusherSizeBox30/

position=3*importdata('xyzWithOutPBC.txt');
CoM=importdata('CenterOfMassPositionYASER.txt');
force   =importdata('forcePUSHER.txt');
i=1;
SD=size(position);
SF=size(force);
j=0;

qq=3;
beads=2;
qeqi=qq/(beads-1);
spring=(beads - 1.0)/beads/qeqi/0.02;

for i=2:2:SD
    j=j+1;
    swimmerSIZE(j)=(  (position(i-1,1)-position(i,1))^2+(position(i-1,2)-position(i,2))^2+(position(i-1,3)-position(i,3))^2  )^.5;
    NetForce(j)=(force(i,1)^2+force(i,2)^2+force(i,3)^2)^.5;
    dipole(j)=force(i,1)*( position(i-1,1)-position(i,1) ) + force(i,2)*( position(i-1,2)-position(i,2) )  ...
             + force(i,3)*( position(i-1,3)-position(i,3) );
         
    forceX(j)=spring*( position(i-1,1)-position(i,1) )*(1-qeqi/swimmerSIZE(j))/( 1-((swimmerSIZE(j)-qeqi)/qeqi/0.15)^2 );
    forceY(j)=spring*( position(i-1,2)-position(i,2) )*(1-qeqi/swimmerSIZE(j))/( 1-((swimmerSIZE(j)-qeqi)/qeqi/0.15)^2 );
    forceZ(j)=spring*( position(i-1,3)-position(i,3) )*(1-qeqi/swimmerSIZE(j))/( 1-((swimmerSIZE(j)-qeqi)/qeqi/0.15)^2 );
    CheckNetForce(j)=(forceX(j)^2+forceY(j)^2+forceZ(j)^2)^.5;
    CheckDipole(j)=forceX(j)*( position(i-1,1)-position(i,1) ) + forceY(j)*( position(i-1,2)-position(i,2) )  ...
             + forceZ(j)*( position(i-1,3)-position(i,3) );
end
dipole=dipole';
CheckDipole=CheckDipole';
forceX=forceX';
forceY=forceY';
forceZ=forceZ';
CheckNetForce=CheckNetForce';
NetForce=NetForce';
swimmerSIZE=abs(swimmerSIZE');