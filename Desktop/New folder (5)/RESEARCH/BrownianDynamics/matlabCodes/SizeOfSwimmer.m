clear
clc

cd /home/yaser/Desktop/RESEARCH/BrownianDynamics/

NB=2;                                                                       %number of beads
NP=400;                                                                     %number of particles
BL=12.7943886178;                                                           %box length
%grid=fix(BL)+1;                                                            %grid
grid=7;                                                                    %odd number (This normally should be larger than the size of bateria)
delx=BL/(grid-1);                                                           %increment in x
time=500;                                                                   %time in 'xyz.dat' file

xyzPBC=importdata('xyz1.txt');                                             %This gives the x,y and z of the beads (PBC IS OBSERVED)     
S=size(xyzPBC);                                                            %we are interested in the center of mass (we wanna remove PBC rules)
xyzNoPBC=xyzPBC;
mashk=0;
mashk2=0;
adad=0;
for j=1:1:time                                                              %index for time
    time;
    for i=1:1:(   S(1)/(NB*time)    )                                       %index for swimmer
        adad=adad+1;

        SizeofSwimmerr(i,j)   =( xyzPBC(2*adad-1,1)-xyzPBC(2*adad,1) )^2 ...
                              +( xyzPBC(2*adad-1,2)-xyzPBC(2*adad,2) )^2 ...
                              +( xyzPBC(2*adad-1,3)-xyzPBC(2*adad,3) )^2;
   
        SizeofSwimmerr(i,j)=SizeofSwimmerr(i,j)^.5;
                                
        if (SizeofSwimmerr(i,j)>BL/3.0)
            mashk=mashk+1; %number of swimmers whose size are very large and needs to be corrected
        end
       
                         
        if ( xyzPBC(2*adad-1,1)>BL/3.0  &&  xyzPBC(2*adad,1)<-BL/3.0 )
            if abs(xyzPBC(2*adad-1,1))>abs(xyzPBC(2*adad,1))
                xyzNoPBC(2*adad-1,1)=xyzPBC(2*adad-1,1)-BL;
            else
                xyzNoPBC(2*adad,1)  =xyzPBC(2*adad,1)+BL;
            end
        end
        if ( xyzPBC(2*adad-1,2)>BL/3.0  &&  xyzPBC(2*adad,2)<-BL/3.0 )
            if abs(xyzPBC(2*adad-1,2))>abs(xyzPBC(2*adad,2))
                xyzNoPBC(2*adad-1,2)=xyzPBC(2*adad-1,2)-BL;
            else
                xyzNoPBC(2*adad,2)  =xyzPBC(2*adad,2)+BL;
            end
        end
        if ( xyzPBC(2*adad-1,3)>BL/3.0  &&  xyzPBC(2*adad,3)<-BL/3.0 )
            if abs(xyzPBC(2*adad-1,3))>abs(xyzPBC(2*adad,3))
                xyzNoPBC(2*adad-1,3)=xyzPBC(2*adad-1,3)-BL;
            else
                xyzNoPBC(2*adad,3)  =xyzPBC(2*adad,3)+BL;
            end
         end
         if ( xyzPBC(2*adad-1,1)<-BL/3.0 &&  xyzPBC(2*adad,1)>BL/3.0 )
             if abs(xyzPBC(2*adad-1,1))>abs(xyzPBC(2*adad,1))
                 xyzNoPBC(2*adad-1,1)=xyzPBC(2*adad-1,1)+BL;
             else
                 xyzNoPBC(2*adad,1)  =xyzPBC(2*adad,1)-BL;
             end
         end
         if ( xyzPBC(2*adad-1,2)<-BL/3.0 &&  xyzPBC(2*adad,2)>BL/3.0 )
             if abs(xyzPBC(2*adad-1,2))>abs(xyzPBC(2*adad,2))
                 xyzNoPBC(2*adad-1,2)=xyzPBC(2*adad-1,2)+BL;
             else
                 xyzNoPBC(2*adad,2)  =xyzPBC(2*adad,2)-BL;
             end
         end
         if ( xyzPBC(2*adad-1,3)<-BL/3.0 &&  xyzPBC(2*adad,3)>BL/3.0 )
             if abs(xyzPBC(2*adad-1,3))>abs(xyzPBC(2*adad,3))
                xyzNoPBC(2*adad-1,3)=xyzPBC(2*adad-1,3)+BL;
             else
                xyzNoPBC(2*adad,3)  =xyzPBC(2*adad,3)-BL;
             end
         end
         SizeofSwimmerr(i,j)   =( xyzNoPBC(2*adad-1,1)-xyzNoPBC(2*adad,1) )^2 ...
         +( xyzNoPBC(2*adad-1,2)-xyzNoPBC(2*adad,2) )^2 ...
         +( xyzNoPBC(2*adad-1,3)-xyzNoPBC(2*adad,3) )^2;
     
         SizeofSwimmerr(i,j)=SizeofSwimmerr(i,j)^.5;
         
    end
end
SizeofSwimmerr=SizeofSwimmerr';
im=1;
num=0;                                                                      %numerator

i=2:2:S(1);
j=(2:2:S(1))-1;

CenterMassYaser(1:1:S(1)/2,1:1:3)=(xyzNoPBC(i,1:1:3)+xyzNoPBC(j,1:1:3))/2; %center of mass
%CenterMassPTU=importdata('CenterOfMassPosition.txt');
%clear position
BV=BL*BL*BL;                                                                %box volume
UC=NP/BV;                                                                   %uniform concentration (This will be used in scaling the concentration)

FORCE=importdata('FORCE1.txt');

adad=0;
for j=1:1:time                                                              %index for time
    time;
    conc ( 1:1:(grid-1) , 1:1:(grid-1)  ) = 0;
    TAUxx( 1:1:(grid-1) , 1:1:(grid-1)  ) = 0;   TAUxy( 1:1:(grid-1) , 1:1:(grid-1)  ) = 0;  
    TAUyx( 1:1:(grid-1) , 1:1:(grid-1)  ) = 0;   TAUyy( 1:1:(grid-1) , 1:1:(grid-1)  ) = 0;
    for i=1:1:(   S(1)/(NB*time)    )                                       %index for swimmer
        
        adad=adad+1;
        conc( fix((CenterMassYaser(adad,1)+BL/2)/delx-.000001)+1 , fix( (CenterMassYaser(adad,2)+BL/2)/delx-.000001)+1  )  = ...
        conc( fix((CenterMassYaser(adad,1)+BL/2)/delx-.000001)+1 , fix( (CenterMassYaser(adad,2)+BL/2)/delx-.000001)+1  )  + 1/(delx*delx*BL) ;
    
        tempXX  = FORCE(2*adad-1,1)*( xyzNoPBC(2*adad-1,1)-CenterMassYaser(adad,1) ) ...
                + FORCE(2*adad  ,1)*( xyzNoPBC(2*adad  ,1)-CenterMassYaser(adad,1) );
        TAUxx( fix((CenterMassYaser(adad,1)+BL/2)/delx-.000001)+1 , fix( (CenterMassYaser(adad,2)+BL/2)/delx-.000001)+1  )  =  ...
        TAUxx( fix((CenterMassYaser(adad,1)+BL/2)/delx-.000001)+1 , fix( (CenterMassYaser(adad,2)+BL/2)/delx-.000001)+1  )  +  ...
        tempXX * conc( fix((CenterMassYaser(adad,1)+BL/2)/delx-.000001)+1 , fix( (CenterMassYaser(adad,2)+BL/2)/delx-.000001)+1  );
    
    
        tempXY  = FORCE(2*adad-1,1)*( xyzNoPBC(2*adad-1,2)-CenterMassYaser(adad,2) ) ...
                + FORCE(2*adad  ,1)*( xyzNoPBC(2*adad  ,2)-CenterMassYaser(adad,2) );  
        TAUxy( fix((CenterMassYaser(adad,1)+BL/2)/delx-.000001)+1 , fix( (CenterMassYaser(adad,2)+BL/2)/delx-.000001)+1  )  =  ...
        TAUxy( fix((CenterMassYaser(adad,1)+BL/2)/delx-.000001)+1 , fix( (CenterMassYaser(adad,2)+BL/2)/delx-.000001)+1  )  +  ...
        tempXY * conc( fix((CenterMassYaser(adad,1)+BL/2)/delx-.000001)+1 , fix( (CenterMassYaser(adad,2)+BL/2)/delx-.000001)+1  );
    
        
        tempYX  = FORCE(2*adad-1,2)*( xyzNoPBC(2*adad-1,1)-CenterMassYaser(adad,1) ) ...
                + FORCE(2*adad  ,2)*( xyzNoPBC(2*adad  ,1)-CenterMassYaser(adad,1) );
        TAUyx( fix((CenterMassYaser(adad,1)+BL/2)/delx-.000001)+1 , fix( (CenterMassYaser(adad,2)+BL/2)/delx-.000001)+1  )  =  ...
        TAUyx( fix((CenterMassYaser(adad,1)+BL/2)/delx-.000001)+1 , fix( (CenterMassYaser(adad,2)+BL/2)/delx-.000001)+1  )  +  ...
        tempYX * conc( fix((CenterMassYaser(adad,1)+BL/2)/delx-.000001)+1 , fix( (CenterMassYaser(adad,2)+BL/2)/delx-.000001)+1  );
    
        
        tempYY  = FORCE(2*adad-1,2)*( xyzNoPBC(2*adad-1,2)-CenterMassYaser(adad,2) ) ...
                + FORCE(2*adad  ,2)*( xyzNoPBC(2*adad  ,2)-CenterMassYaser(adad,2) );
        TAUyy( fix((CenterMassYaser(adad,1)+BL/2)/delx-.000001)+1 , fix( (CenterMassYaser(adad,2)+BL/2)/delx-.000001)+1  )  =  ...
        TAUyy( fix((CenterMassYaser(adad,1)+BL/2)/delx-.000001)+1 , fix( (CenterMassYaser(adad,2)+BL/2)/delx-.000001)+1  )  +  ...
        tempYY * conc( fix((CenterMassYaser(adad,1)+BL/2)/delx-.000001)+1 , fix( (CenterMassYaser(adad,2)+BL/2)/delx-.000001)+1  );
        
    end
end
cd /home/yaser/Desktop/RESEARCH/BrownianDynamics/
 

