clear;
clc;
cd /home/yaser/Desktop/RESEARCH/BrownianDynamics/pusherSizeBox40/ 
velPUSH=importdata('xyzTracerVelocity.txt');
xyzPUSH=importdata('xyzTracer.txt');
cd /home/yaser/Desktop/RESEARCH/BrownianDynamics/pullerSizeBox40/
velPULL=importdata('xyzTracerVelocity.txt');
xyzPULL=importdata('xyzTracer.txt');

TotalTime=500;
tracerNumber=400;
BoxSize=39.7551;
numberOfBins=500;
binSize=0.5*(3^.5)*BoxSize/numberOfBins;
BV=BoxSize^3;
correlationPUSH(1:1:numberOfBins)=0;
numberPUSH(1:1:numberOfBins)=0;
correlationPULL(1:1:numberOfBins)=0;
numberPULL(1:1:numberOfBins)=0;
for t=1:1:TotalTime
    for i=(tracerNumber*(t-1)+1):1:tracerNumber*t-1
        for j=(i+1):1:tracerNumber*t
            dx=abs( xyzPUSH(i,1)-xyzPUSH(j,1) );
            dy=abs( xyzPUSH(i,2)-xyzPUSH(j,2) );
            dz=abs( xyzPUSH(i,3)-xyzPUSH(j,3) );
            velI=(velPUSH(i,1)^2+velPUSH(i,2)^2+velPUSH(i,3)^2)^.5;
            velJ=(velPUSH(j,1)^2+velPUSH(j,2)^2+velPUSH(j,3)^2)^.5;
            dummyPUSH=( velPUSH(i,1)*velPUSH(j,1)+velPUSH(i,2)*velPUSH(j,2)+velPUSH(i,3)*velPUSH(j,3) )/ (velI*velJ);
            if (dx > BoxSize*.5)
                dx=BoxSize-dx;
            end
            if (dy > BoxSize*.5)
                dy=BoxSize-dy;
            end
            if (dz > BoxSize*.5)
                dz=BoxSize-dz;
            end
            r = ( dx^2 + dy^2 + dz^2 )^.5;
            k = ceil(r/binSize);
           correlationPUSH(k)=dummyPUSH+correlationPUSH(k);
           numberPUSH(k)=1+numberPUSH(k);
           
%            dx=abs( xyzPULL(i,1)-xyzPULL(j,1) );
%            dy=abs( xyzPULL(i,2)-xyzPULL(j,2) );
%            dz=abs( xyzPULL(i,3)-xyzPULL(j,3) );
%            velI=(velPULL(i,1)^2+velPULL(i,2)^2+velPULL(i,3)^2)^.5;
%            velJ=(velPULL(j,1)^2+velPULL(j,2)^2+velPULL(j,3)^2)^.5;
%            dummyPULL=( velPULL(i,1)*velPULL(j,1)+velPULL(i,2)*velPULL(j,2)+velPULL(i,3)*velPULL(j,3) )/ (velI*velJ);
%            if (dx > BoxSize*.5)
%                dx=BoxSize-dx;
%            end
%            if (dy > BoxSize*.5)
%                dy=BoxSize-dy;
%            end
%            if (dz > BoxSize*.5)
%                dz=BoxSize-dz;
%            end
%            r = ( dx^2 + dy^2 + dz^2 )^.5;
%            k = ceil(r/binSize);
%            correlationPULL(k)=dummyPULL+correlationPULL(k);
%            numberPULL(k)=1+numberPULL(k);
           
        end
    end
%     loglog(binSize*(1:1:numberOfBins),correlationPUSH./numberPUSH, binSize*(1:1:numberOfBins),correlationPULL./numberPULL)
    loglog(binSize*(1:1:numberOfBins),correlationPUSH./numberPUSH)
    axis([.1 BoxSize 0.0001 10]);
    pause(.5);
    t
end
loglog(binSize*(1:1:numberOfBins),correlationPUSH./numberPUSH)