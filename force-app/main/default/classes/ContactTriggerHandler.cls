public class ContactTriggerHandler {
    public static void updateAccountFax(List<Contact> triggerNew, Map<Id,Contact> triggerOldMap) {
        Set<Id> accIds = new Set<Id>();
        for (Contact eachCnt : triggerNew) {
            if(eachCnt.Main_Contact_Person__c != triggerOldMap.get(eachCnt.Id).Main_Contact_Person__c && eachCnt.Main_Contact_Person__c){
                accIds.add(eachCnt.AccountId);
            }
        }
        if(!accIds.isEmpty()){
            List<Account> listAcc = [select id, name, fax, (select id, fax from Contacts where Main_Contact_Person__c = true) from Account where id IN : accIds];
                List<Account> accLst = new List<Account>();
            for(Account eachAcc : listAcc){
                eachAcc.Fax = eachAcc.contacts[0].Fax;
                accLst.add(eachAcc);
            }
        update accLst;
        }
    }
}
