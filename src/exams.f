C program that handle marks and exams (MAX 50 items)
C #Name     Physics   Maths     History   Geography French
C Fowler .L. 50 47 89 30 46
C Barron.L.W 37 67 65 68 98
C Warren.J.  25 45 48 10 36
C Mallory.D. 89 56 45 30 65
C Codd.S.    68 78 76 98 65

C THIS ROUTINE WRITE THE EXAMINATIONS RESULTS TO A FILE
      SUBROUTINE PREXA(NMAX)
        INTEGER I,NMAX
        INTEGER PHYS(50)
        INTEGER MATHS(50)
        INTEGER HISTO(50)
        INTEGER GEOGRA(50)
        INTEGER FRENCH(50)
        CHARACTER*20 NAME(50)
        OPEN(11,FILE='exams.txt',STATUS='UNKNOWN')
          WRITE(11,'(6A10)')'#Name','Physics','Maths','History',
     +    'Geography','French'
          I=1
          NAME(I)='Fowler .L.'
          PHYS(I)=50
          MATHS(I)=47
          HISTO(I)=89
          GEOGRA(I)=30
          FRENCH(I)=46
          WRITE(11,'(A11,5I10)')NAME(I),PHYS(I),MATHS(I),HISTO(I),
     +    GEOGRA(I),FRENCH(I)
          I=2
          NAME(I)='Barron.L.W'
          PHYS(I)=37
          MATHS(I)=67
          HISTO(I)=65
          GEOGRA(I)=68
          FRENCH(I)=98
          WRITE(11,'(A11,5I10)')NAME(I),PHYS(I),MATHS(I),HISTO(I),
     +    GEOGRA(I),FRENCH(I)
          I=3
          NAME(I)='Warren.J.'
          PHYS(I)=25
          MATHS(I)=45
          HISTO(I)=48
          GEOGRA(I)=10
          FRENCH(I)=36
          WRITE(11,'(A11,5I10)')NAME(I),PHYS(I),MATHS(I),HISTO(I),
     +    GEOGRA(I),FRENCH(I)
          I=4
          NAME(I)='Mallory.D.'
          PHYS(I)=89
          MATHS(I)=56
          HISTO(I)=45
          GEOGRA(I)=30
          FRENCH(I)=65
          WRITE(11,'(A11,5I10)')NAME(I),PHYS(I),MATHS(I),HISTO(I),
     +    GEOGRA(I),FRENCH(I)
          I=5
          NAME(I)='Codd.S.'
          PHYS(I)=68
          MATHS(I)=78
          HISTO(I)=76
          GEOGRA(I)=98
          FRENCH(I)=65
          WRITE(11,'(A11,5I10)')NAME(I),PHYS(I),MATHS(I),HISTO(I),
     +    GEOGRA(I),FRENCH(I)
        CLOSE(11)
      END
C read exams table from file
        SUBROUTINE RDEXA(NMAX,INTEST,NAME,PHYS,MATHS,HISTO,
     +   GEOGRA,FRENCH)
        INTEGER I,NMAX
        INTEGER PHYS(50)
        INTEGER MATHS(50)
        INTEGER HISTO(50)
        INTEGER GEOGRA(50)
        INTEGER FRENCH(50)
        CHARACTER*10 INTEST(6)
        CHARACTER*20 NAME(50)
          I=1
          OPEN(11,FILE='exams.txt',STATUS='OLD',IOSTAT=IOS,ERR=999)
            READ(11,'(6A10)',END=200)INTEST(1),INTEST(2),INTEST(3),
     +      INTEST(4),INTEST(5),INTEST(6)
          DO 10 I=1,50
            READ(11,'(A19,5I10)',END=200)NAME(I),PHYS(I),MATHS(I),
     +    HISTO(I),GEOGRA(I),FRENCH(I)
10        CONTINUE
200       CONTINUE
          CLOSE(11)
          PRINT *,'The file Contained ', I-1,' records'
          NMAX=I-1
C Shows the data table in memory
          WRITE(*,'(6A10)')INTEST(1),INTEST(2),INTEST(3),INTEST(4),
     +    INTEST(5),INTEST(6)
          DO 20 I=1,NMAX
            WRITE(*,'(A11,5I10)')NAME(I),PHYS(I),MATHS(I),HISTO(I),
     +    GEOGRA(I),FRENCH(I)
20        CONTINUE
          GOTO 100
999       PRINT*,'ERROR OPENING THE FILE'
100       CONTINUE
      END

C if present, shows the mark for a given author and subject
        SUBROUTINE SHOWM(NMAX,INTEST,NAME,PHYS,MATHS,HISTO,GEOGRA,
     +  FRENCH,INNAME,INSUBJ)
          INTEGER I,NMAX,INSUBJ
          INTEGER PHYS(50)
          INTEGER MATHS(50)
          INTEGER HISTO(50)
          INTEGER GEOGRA(50)
          INTEGER FRENCH(50)
          CHARACTER*10 INTEST(6)
          CHARACTER*20 NAME(50),INNAME
          LOGICAL BF
          BF=.FALSE.
C          PRINT *,'INSUBJ = ', INSUBJ
          DO 10 I=1,NMAX
           IF (NAME(I).EQ.INNAME) THEN
              IF (INSUBJ.EQ.2) THEN
                PRINT *,'The mark of ',NAME(I),'in ',INTEST(INSUBJ),
     +          ' is ',PHYS(I)
              ELSE IF (INSUBJ.EQ.3) THEN
                PRINT *,'The mark of ',NAME(I),'in ',INTEST(INSUBJ),
     +          ' is ',MATHS(I)
              ELSE IF (INSUBJ.EQ.4) THEN
                PRINT *,'The mark of ',NAME(I),'in ',INTEST(INSUBJ),
     +          ' is ',HISTO(I)
              ELSE IF (INSUBJ.EQ.5) THEN
                PRINT *,'The mark of ',NAME(I),'in ',INTEST(INSUBJ),
     +          ' is ',GEOGRA(I)
              ELSE IF (INSUBJ.EQ.6) THEN
                PRINT *,'The mark of ',NAME(I),'in ',INTEST(INSUBJ),
     +          ' is ',FRENCH(I)
              ELSE
                STOP
              END IF
              BF=.TRUE.
             END IF
10        CONTINUE
        IF(.NOT.BF) PRINT *,'No student ',INNAME,'found'
       END

C MAIN
      PROGRAM EXAMS
        INTEGER NMAX,INSUBJ
        INTEGER PHYS(50)
        INTEGER MATHS(50)
        INTEGER HISTO(50)
        INTEGER GEOGRA(50)
        INTEGER FRENCH(50)
        CHARACTER*10 INTEST(6)
        CHARACTER*20 NAME(50),INNAME
        NMAX=5
C        CALL PREXA(NMAX)
300     CALL RDEXA(NMAX,INTEST,NAME,PHYS,MATHS,HISTO,GEOGRA,FRENCH)
        PRINT *,'PLEASE type the name of the student in quotes '' '''
        PRINT *,'And the code of the subject (2-6)'
        PRINT *,'Physics=2,Maths=3,History=4,Geography=5,French=6'
        PRINT *,'<STUDENT>,<SUBJ.N.> and press enter <--'
        PRINT *,'A different subject code, stops the program'
        READ (*,*)INNAME,INSUBJ
        CALL SHOWM(NMAX,INTEST,NAME,PHYS,MATHS,HISTO,GEOGRA,
     +  FRENCH,INNAME,INSUBJ)
        GOTO 300
      END
