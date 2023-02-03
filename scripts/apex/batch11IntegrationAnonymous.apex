List<Account> accList = new List<Account>();

Account acc1 = new Account();
acc1.Name = 'Integration Test 1';
acc1.AnnualRevenue = 100000;
accList.add(acc1);

Account acc2 = new Account();
acc2.Name = 'Integration Test 2';
acc2.AnnualRevenue = 100000;
accList.add(acc2);

System.debug(accList);

String acclistJson = JSON.serialize(accList);

System.debug('Listenin JSON formatı '+acclistJson);

List<Account> accListNew = (List<Account>) JSON.deserializeStrict(acclistJson, List<Account>.class);

System.debug('New List '+accListNew);

Opportunity Opp = [Select Id, name, Amount, StageName from Opportunity where amount > 10000 limit 1];
System.debug(Opp);
String oppJson = JSON.serialize(opp);
System.debug(oppJson);

//Case objesinden 2 tane case recordu getirelim. Case Number, Subject, Description, Contact firstName + lastname + account name bilgileri ile beraber gelsin. ve bu record bilgilerini json formatına çevirelim.

List<Case> caseList = [Select Id, CaseNumber, Subject, Description, Contact.firstName, Contact.LastName, Account.Name from Case limit 2];

System.debug(caseList);
String caseJson = JSON.serialize(caseList);
System.debug(caseJson);

String jsonAcc = '{"Name":"JSONToApex","Type":"Prospect","AnnualRevenue":500}';
Account acc3 = (Account) JSON.deserialize(JsonAcc, Account.class);
insert acc3;
System.Debug(acc3);
