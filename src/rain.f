C monthly rainfall in mm x m**2
C #Month Rainfall
C January   10.4
C February  11.1
C March     8.3
C April     7.5
C May       3.2
C June      4.6
C July      3.2
C August    4.5
C September 2.1
C October   3.1
C November  10.1
C December  11.1
C Writes the data in a file rainfall.txt
      SUBROUTINE PRAIN(MONNAM,RAINFL)
        INTEGER I
        REAL RAINFL(12)
        CHARACTER*10 MONNAM(12),XLABEL,YLABEL
        DATA XLABEL,YLABEL/'#Month ','Rainfall'/
        OPEN(11,FILE='rainfall.txt',STATUS='UNKNOWN')
        WRITE(11,'(A,A)')XLABEL,YLABEL
        DO 10,I=1,12
          WRITE(11,'(A10,F4.1)')MONNAM(I),RAINFL(I)
10      CONTINUE
        CLOSE(11)
      END

      SUBROUTINE RRAIN(MONNAM,RAINFL)
        INTEGER I
        REAL RAINFL(12)
        CHARACTER*10 MONNAM(12),XLABEL,YLABEL
        OPEN(11,FILE='rainfall.txt',STATUS='OLD')
        READ(11,'(A,A)')XLABEL,YLABEL
        DO 10,I=1,12
          READ(11,'(A10,F4.1)')MONNAM(I),RAINFL(I)
10      CONTINUE
        CLOSE(11)
        PRINT *,XLABEL,YLABEL
        DO 20 I=1,12
        PRINT *,MONNAM(I),RAINFL(I)
20      CONTINUE
      END

      PROGRAM RAIN
       IMPLICIT NONE
       REAL RAINFL(12)
       CHARACTER*10 MONNAM(12)
       DATA RAINFL /10.4,11.1,8.3,7.5,3.2,4.6,3.2,4.5,2.1,3.1,10.1,11.1/
       DATA MONNAM /'January','February','March','April','May','June',
     + 'July','August','September','October','November','December'/
       CALL PRAIN(MONNAM,RAINFL)
       CALL RRAIN(MONNAM,RAINFL)

       STOP
      END
