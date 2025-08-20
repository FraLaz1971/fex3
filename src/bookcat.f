C program that handle a book catalog (MAX 50 items)
C #Author Title Publisher
C Carrol L.    Alice through the looking Glass Penguin
C Knuth D.     Semi-numerical Algorithms       Addison-Wesley
C Steinbeck.J  Sweet Thursday                  Penguin
C WiederholdG. Database Design                 McGraw-Hill
C THIS ROUTINE WRITE THE BOOK CATALOG FILE
      SUBROUTINE PRBKC(NMAX)
        INTEGER I,NMAX
        CHARACTER*16 AUTHOR(50)
        CHARACTER*32 TITLE(50)
        CHARACTER*16 PUBLIS(50)
        OPEN(11,FILE='books.txt')
          WRITE(11,'(A13,A32,A14)')'#AUTHOR','TITLE','PUBLISHER'
          I=1
          AUTHOR(I)='Carrol L.'
          TITLE(I)='Alice through the looking Glass'
          PUBLIS(I)='Penguin'
          WRITE(11,'(A13,A32,A14)')AUTHOR(I),TITLE(I),PUBLIS(I)
          I=2
          AUTHOR(I)='Knuth D.'
          TITLE(I)='Semi-numerical Algorithms'
          PUBLIS(I)='Addison-Wesley'
          WRITE(11,'(A13,A32,A14)')AUTHOR(I),TITLE(I),PUBLIS(I)
          I=3
          AUTHOR(I)='Steinbeck.J'
          TITLE(I)='Sweet Thursday'
          PUBLIS(I)='Penguin'
          WRITE(11,'(A13,A32,A14)')AUTHOR(I),TITLE(I),PUBLIS(I)
          I=4
          AUTHOR(I)='WiederholdG.'
          TITLE(I)='Database Design'
          PUBLIS(I)='McGraw-Hill'
          WRITE(11,'(A13,A32,A14)')AUTHOR(I),TITLE(I),PUBLIS(I)
        CLOSE(11)
      END
C read book catalog
        SUBROUTINE RDBKC(NMAX,AUTHOR,TITLE,PUBLIS)
          INTEGER I,NMAX, IOS
          CHARACTER*16 AUTHOR(50)
          CHARACTER*32 TITLE(50)
          CHARACTER*16 PUBLIS(50)
          I=1
          OPEN(11,FILE='books.txt',IOSTAT=IOS,ERR=999)
            READ(11,'(A13,A32,A14)',END=200)AUTHOR(I),TITLE(I),PUBLIS(I)
          DO 10 I=1,50
            READ(11,'(A13,A32,A14)',END=200)AUTHOR(I),TITLE(I),PUBLIS(I)
10        CONTINUE
200       CONTINUE
          CLOSE(11)
          PRINT *,'The file contained ', I-1,' records'
          NMAX=I-1
          DO 20 I=1,NMAX
            WRITE(*,'(A13,A32,A14)')AUTHOR(I),TITLE(I),PUBLIS(I)
20        CONTINUE
          GOTO 100
999       PRINT*,'ERROR OPENING THE FILE'
100       CONTINUE
      END
C if present, shows the book for a given author
      SUBROUTINE PKBOOK(NMAX,GAUTHR,AUTHOR,TITLE,PUBLIS)
        INTEGER I,NMAX
        CHARACTER*16 GAUTHR
        CHARACTER*16 AUTHOR(50)
        CHARACTER*32 TITLE(50)
        CHARACTER*16 PUBLIS(50)
        LOGICAL BF
        BF=.FALSE.
        DO 10 I=1,NMAX
          IF (AUTHOR(I).EQ.GAUTHR) THEN
            PRINT *,AUTHOR(I),TITLE(I),PUBLIS(I)
            BF=.TRUE.
          END IF
10      CONTINUE
      IF(.NOT.BF) PRINT *,'No book by',GAUTHR,'found'
      END
C MAIN
      PROGRAM MBKCAT
        INTEGER NMAX
        CHARACTER*16 AUTHOR(50),GAUTHR
        CHARACTER*32 TITLE(50)
        CHARACTER*16 PUBLIS(50)
        NMAX=4
C        CALL PRBKC(NMAX)
        CALL RDBKC(NMAX,AUTHOR,TITLE,PUBLIS)
20      PRINT *,'Enter an Author to search for books (NULL to end)'
        READ(*,'(A16)') GAUTHR
        IF(GAUTHR.EQ.'NULL') GOTO 40
        CALL PKBOOK(NMAX,GAUTHR,AUTHOR,TITLE,PUBLIS)
        GOTO 20
40      STOP
      END
