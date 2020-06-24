clear;
clc;
cd /home/yaser/Desktop/RESEARCH/BrownianDynamics/pusherSizeBox10/ 
xyzPUSH=importdata('CenterOfMassPositionYASER.txt');
cd /home/yaser/Desktop/RESEARCH/BrownianDynamics/pullerSizeBox10/
xyzPULL=importdata('CenterOfMassPositionYASER.txt');
d=size(xyzPUSH);

BoxSize=10;
NP=190;
numberOfBins=20;
BV=BoxSize^3;

binSize=0.5*(3^.5)*BoxSize/numberOfBins;

RDFpush(1:1:numberOfBins)=0;
RDFpull(1:1:numberOfBins)=0;
for t=1:1:d(1)/NP
%     RDFpush(1:1:numberOfBins)=0;
%     RDFpull(1:1:numberOfBins)=0;
    for i=(NP*(t-1)+1):1:(NP*t)
        for j=(i+1):1:NP*t
            dx=abs( xyzPUSH(i,1)-xyzPUSH(j,1) );
            dy=abs( xyzPUSH(i,2)-xyzPUSH(j,2) );
            dz=abs( xyzPUSH(i,3)-xyzPUSH(j,3) );
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
            RDFpush(k)=RDFpush(k)+2;
        end
    end
    
    for i=(NP*(t-1)+1):1:(NP*t)
        for j=(i+1):1:NP*t
            dx=abs( xyzPULL(i,1)-xyzPULL(j,1) );
            dy=abs( xyzPULL(i,2)-xyzPULL(j,2) );
            dz=abs( xyzPULL(i,3)-xyzPULL(j,3) );
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
            RDFpull(k)=RDFpull(k)+2;
        end
    end

    for k=1:1:numberOfBins
        element(k)=(4/3)*pi*((k*binSize)^3-((k-1)*binSize)^3);
        nid(k)=element(k)*NP/BV;                                                  %number of particles in a homogenous system 
        GofRpush(k)=RDFpush(k)/(NP*nid(k)*t);
        GofRpull(k)=RDFpull(k)/(NP*nid(k)*t);
%         GofRpush(k)=RDFpush(k)/(NP*nid);
%         GofRpull(k)=RDFpull(k)/(NP*nid);
        distance(k)=k*binSize;
    end
    Rpush=(1:1:numberOfBins)*binSize;
    RRpush=binSize:.01:numberOfBins*binSize;
    RrPUSH=pchip(Rpush,GofRpush,RRpush);
    Rpull=(1:1:numberOfBins)*binSize;
    RRpull=binSize:.01:numberOfBins*binSize;
    RrPULL=pchip(Rpull,GofRpull,RRpull);
    plot(RRpush,RrPUSH,RRpull,RrPULL)
    axis([binSize BoxSize/2 0 2]);
    pause(.5)
    t
end