      PROGRAM ES1
	IMPLICIT NONE
	 CHARACTER*1 VAL
	INTEGER I
	PRINT *,'this is an example'
	PRINT *,'PRESS A KEY AND THE ENTER <--'
	READ *, VAL	
	OPEN(11,FILE='test.txt')
	DO 10,I=1,20
   	          WRITE(11,'(I2)')I
10	CONTINUE
	CLOSE(11)
	STOP
      END
