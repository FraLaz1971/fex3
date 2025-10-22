      PROGRAM TEMPS
        IMPLICIT NONE
        INTEGER C1,C2,CMIN,CMAX,CSTEP,CVAL
        REAL FVAL
        WRITE(0, *) 'enter min,max,step'
        READ *,C1,C2,CSTEP
        CSTEP=-ABS(CSTEP)
        CMIN=MIN(C1,C2)
        CMAX=MAX(C1,C2)
        DO 10,CVAL=CMAX,CMIN,CSTEP
          FVAL=1.8*CVAL+32.0
          WRITE(*,100),CVAL,FVAL
10      CONTINUE
100   FORMAT(I3,1X,F6.1)
      END
