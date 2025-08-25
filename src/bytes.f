c Write bytes binary data
      SUBROUTINE WRBYT(CBYTES)
      END
C Read bytes binary data from a string
      SUBROUTINE RDBYT(CBYTES)
        INTEGER I,NIBBLE(8),MHEX
        CHARACTER*8 CBYTES
        DO 10,I=1,8
            PRINT *,CBYTES(I:I)
10      CONTINUE
        DO 20,I=1,8
            READ(CBYTES(I:I),100) NIBBLE(I)
20      CONTINUE
        DO 30,I=1,8
            PRINT *,NIBBLE(I)
30      CONTINUE
        READ(CBYTES,200)MHEX
        PRINT *,'MHEXd = ',MHEX
        WRITE(*, 300)'MHEX = ',MHEX
100     FORMAT(Z1)
200     FORMAT(Z8)
300     FORMAT(A,Z8)
      END
C handle bytes, bits and hexadecimal data
      PROGRAM BYTES
        INTEGER NBYTES
        CHARACTER*8 CBYTES
        PARAMETER(NBYTES=8)
        CBYTES='0E77C000'
        CALL RDBYT(CBYTES)
        STOP
      END
