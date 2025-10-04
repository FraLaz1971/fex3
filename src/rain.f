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
        PRINT *,'PRAIN: opening file rainfall.txt'
        OPEN(11,FILE='rainfall.txt',STATUS='UNKNOWN')
        WRITE(11,'(A,A)')XLABEL,YLABEL
        DO 10,I=1,12
          WRITE(11,'(A10,F4.1)')MONNAM(I),RAINFL(I)
10      CONTINUE
        CLOSE(11)
        PRINT *,'PRAIN: written file rainfall.txt'
      END
C reads rain data from the file rainfall.txt
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
        WRITE(*,'(A10,F4.1)') MONNAM(I),RAINFL(I)
20      CONTINUE
        PRINT *,'RRAIN: read file rainfall.txt and loaded in memory'
      END
C compute yearly average
      SUBROUTINE AVG(RAINFL)
        REAL RAINFL(12)
        REAL MYSUM,MYAVG
        INTEGER I
        MYSUM=0
        DO 10,I=1,12
          MYSUM=MYSUM+RAINFL(I)
10      CONTINUE
        MYAVG = MYSUM/12.0
        WRITE(*,'(A,F6.2)') 'TOTAL YEARLY RAIN = ',MYSUM
        WRITE(*,'(A,F4.1)') 'MONTHLY RAIN AVERAGE = ',MYAVG
      END
C create gnuplot plot file (.plt) including data
      SUBROUTINE CRGPLT(MONNAM,RAINFL)
         INTEGER I
         REAL RAINFL(12)
         CHARACTER*60 LINE
         CHARACTER*10 MONNAM(12)
         OPEN(UNIT=3, FILE='rain.plt', STATUS='UNKNOWN')
           WRITE (3,100)'reset'
           WRITE (3,100)'set terminal png'
           WRITE (3,100)'set output ''out.png'' '
           WRITE (3,100)'set style data histogram'
           WRITE (3,100)'set style histogram clustered'
           WRITE (3,100)'set style fill solid 1.0 border lt -1'
           WRITE (3,100)'set xtic rotate by -45 scale 0'
           WRITE (3,100)'set xlabel ''month'' '
           WRITE (3,100)'set ylabel ''rainfall(mm x m**2)'' '
           WRITE (3,100)'$file1 << EOD'
           DO 10,I=1,12
              WRITE (3,200) MONNAM(I),' ',RAINFL(I)
10         CONTINUE
           WRITE (3,100)'EOD'
           LINE='plot ''$file1'' using 2:xtic(1) title ''rainfall'' '
           WRITE (3,100)LINE
         CLOSE(3)
100      FORMAT(A)
200      FORMAT(A10,A1,F4.1)
         PRINT *,'CRGPLT: created gnuplot plot file rain.plt'
      END
C MAIN program
      SUBROUTINE RPLOT
C      CHARACTER*10 FC
C win with FTN77
C        FC='FTN77'
C        IF (FC.EQ.'FTN77') THEN
C          CALL CISSUE('gpw.bat')
C        ELSE IF (FC.EQ.'GFORTRAN') THEN
C linux with gfortran/f77
C
         PRINT *,'RPLOT: plotting statistics on screen'
          CALL SYSTEM('gnuplot -p rain.plt')
C        ELSE
C          CALL SYSTEM('gnuplot -p rain.plt')
C        END IF
      END
      PROGRAM RAIN
       IMPLICIT NONE
       REAL RAINFL(12)
       CHARACTER*10 MONNAM(12)
       DATA RAINFL /10.4,11.1,8.3,7.5,3.2,4.6,3.2,4.5,2.1,3.1,10.1,11.1/
       DATA MONNAM /'January','February','March','April','May','June',
     + 'July','August','September','October','November','December'/
C       CALL PRAIN(MONNAM,RAINFL)
       CALL RRAIN(MONNAM,RAINFL)
       CALL AVG(RAINFL)
       CALL CRGPLT(MONNAM,RAINFL)
       CALL RPLOT
       STOP
      END
