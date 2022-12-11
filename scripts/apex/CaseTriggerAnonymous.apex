list<case> caseList = new list<case>();
for (Integer i = 3; i >= 1; i--) {
    case cas = new case();
    cas.Origin = 'Phone';
    cas.Status = 'New';
    cas.Subject = 'Subject ' +i;
    caseList.add(cas);
}
insert caseList;
list<case> caseList1 = new list<case>();
/*for (Integer i = 3; i >= 1; i--) {
    case cas = new case();
    cas.Origin = 'Email';
    cas.Status = 'Working';
    caseList.add(cas);
    
}
update caseList2;*/
for(case cas1 : caseList){
    cas1.Origin='Email';
    caseList1.add(cas1);
}
update caseList1;