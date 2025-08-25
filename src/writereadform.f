      PROGRAM WRRD
C Writing and Reading with the FORMAT statement instruction
        REAL A(1:1000)
C
C ASK the COMPONENT NUMBER of the VECTOR A
        PRINT *,'Vector Component NUMBER (1,1000) = ?'
        READ *,N
        DO 10 I=1,N
          A(I) = I*I
10      CONTINUE
C
        PRINT 10010,(I,A(I),I=1,N)
10010 FORMAT('The Result VECTOR'/
     % 2(' A(',I3,')=',G15.6) )
        STOP
      END
