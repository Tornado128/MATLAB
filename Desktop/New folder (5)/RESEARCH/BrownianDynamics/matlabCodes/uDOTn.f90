 PROGRAM uDOTn
 IMPLICIT NONE
 
 INTEGER, PARAMETER 	      					:: 	DP     = kind(1.0D0)
 INTEGER, PARAMETER 	      					:: 	DPC    = kind( (1.d0,1.d0) )
 
 INTEGER*8  , PARAMETER						::	DUMBELL=190
 INTEGER*8  , PARAMETER	      					::	time=100
 REAL*8     , PARAMETER	      					::	confinement=10
 INTEGER*8  , PARAMETER	      					::	MESH=21

 REAL(DP)   , DIMENSION(MESH,MESH,MESH)   			::      UXF, UYF, UZF
 REAL*8     , DIMENSION(time*(MESH-1)*(MESH-1)*(MESH-1))    	:: 	X1, X2, X3, U1, U2, U3
 REAL*8	    , DIMENSION(time*(MESH-1)*(MESH-1)*(MESH-1))    	:: 	XX1, XX2, XX3
 REAL*8	    , DIMENSION(time*DUMBELL)				::	N1, N2, N3, CM1, CM2, CM3 
 REAL*8	    , DIMENSION(DUMBELL)				::	uf1, uf2, uf3
 integer(dp), DIMENSION(DUMBELL) 				:: 	c_index1, c_index2, c_index3
 real(dp)   , DIMENSION(DUMBELL)				::	xd, yd, zd
 real(dp)   , DIMENSION(DUMBELL) 				:: 	c00_x, c01_x, c10_x, c11_x, c0_x, c1_x
 real(dp)   , DIMENSION(DUMBELL) 				:: 	c00_y, c01_y, c10_y, c11_y, c0_y, c1_y
 real(dp)   , DIMENSION(DUMBELL) 				:: 	c00_z, c01_z, c10_z, c11_z, c0_z, c1_z

 INTEGER*8, PARAMETER 	      					::  	H1=1, H2=2, H3=3, H4=4
 INTEGER								i, j, k, t, N, NUMERATE, NUMERATE1
 REAL*8									delta, summ


 !CALL CHDIR("/home/yaser/Desktop/RESEARCH/BrownianDynamics/pusherSizeBox10")



 OPEN(H1, FILE='u_field.out', STATUS='OLD', ACTION='READ')            ! opens the first file
 OPEN(H2, FILE='centerMassSWIMMERS.txt', STATUS='OLD', ACTION='READ')            ! opens the first file
 OPEN(H3, FILE='orienSWIMMERS.txt', STATUS='OLD', ACTION='READ')            ! opens the first file
 OPEN(H4, FILE='TimeEvolutionUdotN.txt')
 delta=confinement/(MESH-1)
 NUMERATE  = 0
 NUMERATE1 = 0
 DO t=1,TIME	
 	DO I=1,mesh-1
    		DO J=1,mesh-1
       			DO K=1,mesh-1
				NUMERATE= NUMERATE + 1
    	  			READ(H1,*)  X1(numerate), X2(numerate), X3(numerate), U1(numerate), U2(numerate), U3(numerate) 
				XX1(numerate)=X1(numerate)+CONFINEMENT/2.0
				XX2(numerate)=X2(numerate)+CONFINEMENT/2.0
				XX3(numerate)=X3(numerate)+CONFINEMENT/2.0
				UXF( floor(xx1(numerate)/delta)+1, floor(xx2(numerate)/delta)+1, floor(xx3(numerate)/delta)+1 ) = U1(NUMERATE)
				UYF( floor(xx1(numerate)/delta)+1, floor(xx2(numerate)/delta)+1, floor(xx3(numerate)/delta)+1 ) = U2(NUMERATE)
				UZF( floor(xx1(numerate)/delta)+1, floor(xx2(numerate)/delta)+1, floor(xx3(numerate)/delta)+1 ) = U3(NUMERATE)
			END DO
    		END DO
 	END DO
	uxf(mesh,1:mesh-1,1:mesh-1)     = uxf(1,1:mesh-1,1:mesh-1)
	uxf(1:mesh-1,mesh,1:mesh-1)     = uxf(1:mesh-1,1,1:mesh-1)
	uxf(1:mesh-1,1:mesh-1,mesh)     = uxf(1:mesh-1,1:mesh-1,1)
 	uxf(mesh,mesh,1:mesh-1)         = uxf(1,1,1:mesh-1)
	uxf(mesh,1:mesh-1,mesh)   	= uxf(1,1:mesh-1,1)
	uxf(1:mesh-1,mesh,mesh)	        = uxf(1:mesh-1,1,1)
	uxf(mesh,mesh,mesh)	        = uxf(1,1,1)

	uyf(mesh,1:mesh-1,1:mesh-1)     = uyf(1,1:mesh-1,1:mesh-1)
	uyf(1:mesh-1,mesh,1:mesh-1)     = uyf(1:mesh-1,1,1:mesh-1)
	uyf(1:mesh-1,1:mesh-1,mesh)     = uyf(1:mesh-1,1:mesh-1,1)
 	uyf(mesh,mesh,1:mesh-1)         = uyf(1,1,1:mesh-1)
	uyf(mesh,1:mesh-1,mesh)   	= uyf(1,1:mesh-1,1)
	uyf(1:mesh-1,mesh,mesh)	        = uyf(1:mesh-1,1,1)
	uyf(mesh,mesh,mesh)	        = uyf(1,1,1)

	uzf(mesh,1:mesh-1,1:mesh-1)     = uzf(1,1:mesh-1,1:mesh-1)
	uzf(1:mesh-1,mesh,1:mesh-1)     = uzf(1:mesh-1,1,1:mesh-1)
	uzf(1:mesh-1,1:mesh-1,mesh)     = uzf(1:mesh-1,1:mesh-1,1)
 	uzf(mesh,mesh,1:mesh-1)         = uzf(1,1,1:mesh-1)
	uzf(mesh,1:mesh-1,mesh)   	= uzf(1,1:mesh-1,1)
	uzf(1:mesh-1,mesh,mesh)	        = uzf(1:mesh-1,1,1)
	uzf(mesh,mesh,mesh)	        = uzf(1,1,1)

	summ=0.0
	DO N=1,DUMBELL
		NUMERATE1= NUMERATE1 + 1
		READ(H2,*)  CM1(NUMERATE1), CM2(NUMERATE1), CM3(NUMERATE1)
		READ(H3,*)  N1(NUMERATE1) , N2(NUMERATE1) , N3(NUMERATE1)
		c_index1(n)= floor(CM1(NUMERATE1)/(confinement/(mesh-1)))+1
		c_index2(n)= floor(CM2(NUMERATE1)/(confinement/(mesh-1)))+1
		c_index3(n)= floor(CM3(NUMERATE1)/(confinement/(mesh-1)))+1
		!print*, t, N, NUMERATE1, c_index1(n), c_index2(n), c_index3(n)
		xd(n)= ( CM1(NUMERATE1) - (c_index1(n)-1)*confinement/(mesh-1) ) / ( confinement/(mesh-1) )
		yd(n)= ( CM2(NUMERATE1) - (c_index2(n)-1)*confinement/(mesh-1) ) / ( confinement/(mesh-1) )
		zd(n)= ( CM3(NUMERATE1) - (c_index3(n)-1)*confinement/(mesh-1) ) / ( confinement/(mesh-1) )
		!print*, xd(n), yd(n), zd(n)

		!print*, uxf(c_index1(n),c_index2(n),c_index3(n)), uxf(c_index1(n)+1,c_index2(n),c_index3(n)),(1-xd(n)), xd(n), c00_x(n)
		c00_x(n)= uxf(c_index1(n),c_index2(n),c_index3(n))*(1-xd(n))+ &
			uxf(c_index1(n)+1,c_index2(n),c_index3(n))*xd(n)
		c10_x(n)= uxf(c_index1(n),c_index2(n)+1,c_index3(n))*(1-xd(n))+ &
			uxf(c_index1(n)+1,c_index2(n)+1,c_index3(n))*xd(n)
		c01_x(n)= uxf(c_index1(n),c_index2(n),c_index3(n)+1)*(1-xd(n))+ &
			uxf(c_index1(n)+1,c_index2(n),c_index3(n)+1)*xd(n)
		c11_x(n)= uxf(c_index1(n),c_index2(n)+1,c_index3(n)+1)*(1-xd(n))+ &
			uxf(c_index1(n)+1,c_index2(n)+1,c_index3(n)+1)*xd(n)
		c0_x(n) = c00_x(n)*(1-yd(n))+c10_x(n)*yd(n)
		c1_x(n) = c01_x(n)*(1-yd(n))+c11_x(n)*yd(n)


		c00_y(n)= uyf(c_index1(n),c_index2(n),c_index3(n))*(1-yd(n))+ &
			uyf(c_index1(n)+1,c_index2(n),c_index3(n))*yd(n)
		c10_y(n)= uyf(c_index1(n),c_index2(n)+1,c_index3(n))*(1-yd(n))+ &
			uyf(c_index1(n)+1,c_index2(n)+1,c_index3(n))*yd(n)
		c01_y(n)= uyf(c_index1(n),c_index2(n),c_index3(n)+1)*(1-yd(n))+ &
			uyf(c_index1(n)+1,c_index2(n),c_index3(n)+1)*yd(n)
		c11_y(n)= uyf(c_index1(n),c_index2(n)+1,c_index3(n)+1)*(1-yd(n))+ &
			uyf(c_index1(n)+1,c_index2(n)+1,c_index3(n)+1)*yd(n)
		c0_y(n) = c00_y(n)*(1-yd(n))+c10_y(n)*yd(n)
		c1_y(n) = c01_y(n)*(1-yd(n))+c11_y(n)*yd(n)


		c00_z(n)= uzf(c_index1(n),c_index2(n),c_index3(n))*(1-zd(n))+ &
			uzf(c_index1(n)+1,c_index2(n),c_index3(n))*zd(n)
		c10_z(n)= uzf(c_index1(n),c_index2(n)+1,c_index3(n))*(1-zd(n))+ &
			uzf(c_index1(n)+1,c_index2(n)+1,c_index3(n))*zd(n)
		c01_z(n)= uzf(c_index1(n),c_index2(n),c_index3(n)+1)*(1-zd(n))+ &
			uzf(c_index1(n)+1,c_index2(n),c_index3(n)+1)*zd(n)
		c11_z(n)= uzf(c_index1(n),c_index2(n)+1,c_index3(n)+1)*(1-zd(n))+ &
			uzf(c_index1(n)+1,c_index2(n)+1,c_index3(n)+1)*zd(n)
		c0_z(n) = c00_z(n)*(1-yd(n))+c10_z(n)*yd(n)
		c1_z(n) = c01_z(n)*(1-yd(n))+c11_z(n)*yd(n)



		uf1(n)= c0_x(n)*(1-zd(n))+c1_x(n)*zd(n)
		uf2(n)= c0_y(n)*(1-zd(n))+c1_y(n)*zd(n)
		uf3(n)= c0_z(n)*(1-zd(n))+c1_z(n)*zd(n)
		
                summ=summ + ( N1(NUMERATE1)*uf1(n) + N2(NUMERATE1)*uf2(n) + N3(NUMERATE1)*uf3(n) ) &
				/( sqrt(uf1(n)*uf1(n)+uf2(n)*uf2(n)+uf3(n)*uf3(n)) ) &
				/( sqrt(n1(NUMERATE1)**2.0+n2(NUMERATE1)**2.0+n3(NUMERATE1)**2.0) )/dumbell

	END DO
	
	print*, summ
	write(H4,*)	summ

END DO

 CLOSE(H1)
 CLOSE(H2)
 CLOSE(H3)
 CLOSE(H4)

END PROGRAM uDOTn
	


