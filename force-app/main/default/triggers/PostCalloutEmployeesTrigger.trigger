trigger PostCalloutEmployeesTrigger on Employee__c (before insert, after insert,before update, after update) {
    if(trigger.isAfter && trigger.isInsert){
        PostCalloutEmployeesTriggerHandler.postEmployee(trigger.New);
    }
}