      PROGRAM LOAN
        IMPLICIT NONE
        REAL AMOUNT,PCRATE,REPAY,RATE
        INTEGER NYEARS
        WRITE(*,*) 'Enter amount, % rate, years'
        READ(*,*) AMOUNT,PCRATE,NYEARS
        RATE = PCRATE/100.0
        REPAY = RATE * AMOUNT /(1.0 - (1.0+RATE)**(-NYEARS))
        WRITE(*,100) 'MONTHLY REPAYEMENTS ARE ',REPAY/12.0
100     FORMAT(A,F7.3)
        STOP
      END
