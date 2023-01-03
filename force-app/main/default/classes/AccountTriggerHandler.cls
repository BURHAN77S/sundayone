/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-18-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class AccountTriggerHandler {
    public static void accountCreateContact(list<account> triggerNew) {
        list<contact> listCon= new list<contact>();
        for(account acc : triggerNew){
            contact c = new contact();
            c.AccountId = acc.id;
            c.LastName = acc.Name;
            c.Phone =acc.Phone;
            listCon.add(c);
        }
        insert listCon;
    }

    public static void accountUpdatedOpp(list<account> triggerNew ){
        set<id> accId = new set<id>();
        for(account eachacc: triggerNew){
            accId.add(eachacc.id);
        }
        //set<id> accId2 = triggerNewMap.keyset();
        list<Opportunity> listOpp = [select id, StageName from Opportunity where AccountId in: accId AND StageName!='Closed Won'];
        if(!listOpp.isEmpty()){
            List<Opportunity> listUpdate = new List<Opportunity>();

            for(Opportunity eachOpp : listOpp){
                eachOpp.StageName ='Closed Lost';
                listUpdate.add(eachOpp);
            }
            update listUpdate;
        }
    }
    public static void accountUpdatedCon(List<Account> triggerNew, map<id, account> TriggerNewMap, map<id, account> TriggerOldMap){
        set<id> accId = new set<id>();
        for(Account eachacc : TriggerNew){
            if(eachacc.Phone != TriggerOldMap.get(eachacc.id).Phone){
                accId.add(eachacc.id);
            }
        }
        List<Contact> listCon = [select id, OtherPhone,MobilePhone, AccountId from Contact where AccountId in : accId];
        List<Contact> listUpdate = new List<Contact>();
        for(contact con : listCon){
            con.OtherPhone = TriggerOldMap.get(con.AccountId).Phone;
            con.MobilePhone = TriggerNewMap.get(con.AccountId).Phone;
            listUpdate.add(con);
        }
        update listUpdate;
    }
    public static void AccAnnualRevenue(List<Account> triggerNew,  map<id, account> TriggerOldMap){
        for(Account eachAcc : triggerNew){
            if(eachAcc.AnnualRevenue < TriggerOldMap.get(eachAcc.id).AnnualRevenue || eachAcc.AnnualRevenue == null){
            eachAcc.AnnualRevenue.addError('Annual Revenue for an account cannot be reduced');
            }
        }
    }
}