list<account> ourList = DummyDataCreation.accountCreationMethod(5);
system.debug(ourList.size());

list<contact> ourConList = DummyDataCreation.contactCreationMethod(5, ourList);
system.debug(ourConList.size());

list<account> dummyList = [select id from account where createdDate = TODAY];
delete dummyList;