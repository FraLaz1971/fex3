C convert a nibble (4bit) numbr in binary string
        SUBROUTINE NTOBIT(N,MR)
        IMPLICIT NONE
        INTEGER N,I,K
        CHARACTER*4 MR,TR
        MR=' '
        DO 10 I=1,4
          K=MOD(N,2)
          IF (K.EQ.1) THEN
	        TR='1' // MR
            MR=TR
          ELSE IF (K.EQ.0) THEN 
	        TR='0' // MR
            MR=TR
          ENDIF
          N=N/2
10      CONTINUE
        PRINT *,MR
      END
      SUBROUTINE READEC(J)
      IMPLICIT NONE
        INTEGER J
        PRINT *,'INSERT A NUMBER IN (0,15)'
        READ *,J
      END
      SUBROUTINE REAHEX(J)
        IMPLICIT NONE
        INTEGER J
        PRINT *,'INSERT A HEX NUMBER IN (0,F)'
        READ '(Z1)',J
      END
      PROGRAM CONVER
        IMPLICIT NONE 
        INTEGER J
        CHARACTER*4 M
        CALL READEC(J)
        CALL NTOBIT(J,M)
        CALL REAHEX(J)
        CALL NTOBIT(J,M)
        PRINT *,'M = ',M
      END
