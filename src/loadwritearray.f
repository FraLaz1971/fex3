C load in memory a 3x3 array and then write it down
      PROGRAM LP
        INTEGER A(3,3),I,J
        DO 5 I=1,3
          DO 7 J=1,3
            A(I,J) = I*J
7       CONTINUE
5       CONTINUE
        DO 10 I=1,3
          DO 20 J=1,3
          WRITE(*,100) 'I=',I,' J=',J,A(I,J)
20        CONTINUE 
10      CONTINUE 
100     FORMAT (A3,I1,A3,I1,' ',I6)
        STOP
      END
