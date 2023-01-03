/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-18-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger AccountTrigger on Account (before insert,after insert,before update, after update) {
    /*if(Trigger.isAfter && Trigger.isInsert){
      AccountTriggerHandler.accountCreateContact(trigger.new);
    }
    if(Trigger.isAfter && Trigger.isUpdate){
       AccountTriggerHandler.accountUpdatedOpp(trigger.new);
    }
    if(Trigger.isAfter && Trigger.isUpdate){
        AccountTriggerHandler.accountUpdatedCon(Trigger.new, Trigger.newMap, Trigger.oldMap);
    }
    if (Trigger.isBefore && Trigger.isUpdate) {
        AccountTriggerHandler.accAnnualRevenue(trigger.new, trigger.oldMap);
    }*/
}