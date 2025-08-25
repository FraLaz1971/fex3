      PROGRAM DIMTEST
        IMPLICIT NONE
        INTEGER I,N
        REAL A
        DIMENSION A(3),N(4)
        DATA A /3.14,2.78,1.3333/
        DATA N /3,2,1,0/
        DO 10,I=1,3
          PRINT '(F6.4)',A(I)
10      CONTINUE
        DO 20,I=1,4
          PRINT *,N(I)
20      CONTINUE
        STOP
      END
