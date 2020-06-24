SUBROUTINE  gofr(distance,NB,GoR,confinement,xc,RDF,element,nid)
IMPLICIT NONE 

INTEGER	, 	PARAMETER 				:: dp    = kind(1.0D0)
REAL(DP), 	PARAMETER 				:: PI= 3.141592653589793238462643383279502884197
real*8,    	INTENT(IN) 				:: confinement
INTEGER*8, 	INTENT(IN) 				:: NB
REAL(DP),    	DIMENSION(NB), INTENT(OUT)		:: RDF
REAL(DP), 	DIMENSION(NB), INTENT(OUT)		:: distance
REAL(DP),    	DIMENSION(NB), INTENT(OUT)		:: GoR
integer*8, 	PARAMETER 				:: NP  =5000
real*8,    	DIMENSION(3*NP), INTENT(IN)  		:: xc
REAL(DP),	DIMENSION(NB), INTENT(OUT)		:: element,nid
real*8 	   						dxx,dyy,dzz,rSH,BinSize
integer*8						ceilingg, varu1, varu

BinSize=0.5*(sqrt(3.0))*confinement/NB
!print*, BinSize
!BinSize=confinement/NB
RDF=0.0
GoR=0.0
DO varu=1,NP-1
	DO varu1=(varu+1),NP
		dxx=ABS( xc(3*varu-2)-xc(3*varu1-2) )
		dyy=ABS( xc(3*varu-1)-xc(3*varu1-1) )
		dzz=ABS( xc(3*varu  )-xc(3*varu1  ) )
		if (dxx > confinement*.5) then
                	dxx=confinement-dxx;
            	end if
		if (dyy > confinement*.5) then
		        dyy=confinement-dyy;
		end if
		if (dzz > confinement*.5) then
		        dzz=confinement-dzz;
		end if
		rSH=sqrt(dxx*dxx+dyy*dyy+dzz*dzz)
		ceilingg=ceiling(rSH/BinSize)
		RDF(ceilingg)=RDF(ceilingg)+2.0
	END DO
END DO

DO varu=1,NB
	element(varu)=(4.0/3.0)*pi*( (varu*BinSize)**3.0-((varu-1)*BinSize)**3.0 )
	nid(varu)=element(varu)*NP/(confinement**3.0)
	GoR(varu)=RDF(varu)/(NP*nid(varu))
	distance(varu)=varu*BinSize
END DO
end subroutine gofr
