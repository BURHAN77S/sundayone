List<Account> var1 =  AccConAndOppOperations.takeInfo();
System.debug(var1);
AccConAndOppOperations.oppWon('Web', 'Closed Won');
AccConAndOppOperations.annualRevenue();

decimal sum = AccConAndOppOperations.sumOfClosedWon();
System.debug(sum);

List<Account> var2 = AccConAndOppOperations.AccountWonOpp('Value Proposition');
System.debug(var2);