/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-11-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

/*3. Whenever Contact is created with ‘Account’ then print ‘[Contact Name] contact created
WITH Account’. If contact is created without ‘Account’ then print ‘[Contact Name]
contact create WITHOUT Account’*/

trigger ContactTrigger on Contact (before insert, after insert,before update, after update) {
    if(trigger.isBefore && trigger.isInsert){
        for (Contact eachCon : trigger.new) {
            if(eachCon.AccountId !=null){
                system.debug(eachCon.LastName+' Contact created WITH Account');
            }else{
                system.debug(eachCon.LastName+' Contact created WITHOUT Account');
            }
        }
    }
}