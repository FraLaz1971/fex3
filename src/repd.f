C #Name,Address,Number
C 'Adcroft A.','61 Connaught Road, Roath, Cardiff', 223309
C 'Beale K.','14 Airedale Road, Balham', 7459870
C 'Blunt R.U.',81 Stanlake Road, Shepherds Bush, 6744546
C 'Sims Tony','99 Andover Road,Twickenham', 8987330

C subroutine that reads the data
C and loads in memory
      SUBROUTINE READF(NMAX,NAME,ADDRES,NUMBER)
        INTEGER NMAX,I
        CHARACTER*25 RAW1
        CHARACTER*20 NAME(50)
        CHARACTER*40 ADDRES(50)
        INTEGER NUMBER(50)
        OPEN(11,FILE='phonedir.csv',STATUS='OLD')
          READ(11,'(3A)')RAW1
          PRINT *,'RAW1 = ', RAW1
          DO 10 I=1,50
            READ(11,'(A11,A33,I8)',END=200)NAME(I),ADDRES(I),NUMBER(I)
C            PRINT *,'I=',I,'NAME=',NAME(I),'ADDRESS=',ADDRES(I),
C     +      'NUMBER=',NUMBER(I)
10        CONTINUE
200     NMAX=I-1
        CLOSE(11)
      END
C print the telephone directory
      SUBROUTINE PRDB(NMAX,NAME,ADDRES,NUMBER)
        INTEGER NMAX,I
        CHARACTER*20 NAME(50)
        CHARACTER*40 ADDRES(50)
        INTEGER NUMBER(50)
        DO 10,I=1,NMAX
            PRINT *,'I=',I,'NAME=',NAME(I),'ADDRESS=',ADDRES(I),
     +      'NUMBER=',NUMBER(I)
10      CONTINUE
      END
C read and load in memory the telephone directory
C contained in the file phonedir.csv
      PROGRAM REPD
        INTEGER NMAX
        CHARACTER*20 NAME(50)
        CHARACTER*40 ADDRES(50)
        INTEGER NUMBER(50)
        CALL READF(NMAX,NAME,ADDRES,NUMBER)
        PRINT *,'the file contained',NMAX,' records'
        CALL PRDB(NMAX,NAME,ADDRES,NUMBER)
        STOP
      END
