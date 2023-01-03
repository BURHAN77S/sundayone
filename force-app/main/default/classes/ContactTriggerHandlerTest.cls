@isTest
public class ContactTriggerHandlerTest {
    Account acc1 = new Account(Name = 'test', Fax = '1234567');
    insert acc1;
    @isTest
    public static void updateAccountFaxTest() {
        
        List<Contact> lstC = List<Contact>();
        
        for (Integer i = 0; i < 10; i++){
        Contact c = new Contact();
        c.LastName = 'LastName ' + i;
        c.AccountId = acc1.id;
        if(i< 8){
            c.Fax = '1234567';
        }else {
            c.Fax = '98765';
        }
        lstC.add(c);
        }
        
        Contact cnt1 = new Contact(LastName = 'Test2', Fax = '67890', AccountId = acc1.id);

        
        insert lstC;

        for(Integer i = 0; i < lstC.size() ; i++){
            cnt1.Main_Contact_Person__c = true;
        }

        update lstC;
            
            Test.startTest();

            List<Account> checkAcc = [select id, fax from Account where fax = '67890'];
            System.debug(checkAcc);
            System.assertEquals(1, checkAcc.size());

            Test.stopTest();
    }
}