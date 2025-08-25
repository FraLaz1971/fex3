      PROGRAM REDUCE
        IMPLICIT NONE
        REAL AMOUNT,PCRATE,REPAY,RATE
        INTEGER NYEARS,IYEAR
        WRITE(*,*) 'Enter amount, % rate, years'
        READ(*,*) AMOUNT,PCRATE,NYEARS
        RATE = PCRATE/100.0
        REPAY = RATE * AMOUNT /(1.0 - (1.0+RATE)**(-NYEARS))
        WRITE(*,100) 'MONTHLY REPAYEMENTS ARE ',REPAY/12.0
        WRITE(*,*)'End of the Year       Balancee'
        DO 10,IYEAR=1,NYEARS
          AMOUNT = AMOUNT + (AMOUNT*RATE) - REPAY
          IF (AMOUNT.LT.0) AMOUNT=0
          WRITE(*,'(1X,I2,A,F10.3)') IYEAR,'                  ',AMOUNT
10      CONTINUE
100     FORMAT(A,F7.3)
        STOP
      END
