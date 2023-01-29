trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert,after insert,before update,after update) {
    if(trigger.isAfter && Trigger.isInsert){
        
        SalesforceProjectHandler.createDefaultTicket(Trigger.New);

        //call future method
        system.debug('callling future methode NOW');
        map<id,Salesforce_Project__c> spNewMap =trigger.newMap;
        set<id> spIds = spNewMap.keyset();
        SPTriggerHandler.spUpdateDescription(spNewMap.keyset());
        system.debug('called future method.DONE.');
    }
/*if(Trigger.isBefore&& Trigger.isUpdate){
        //call validation
        SalesforceProjectHandler.completeSPvalidation(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }

    if(Trigger.isAfter && Trigger.isUpdate){
        SPTriggerHandler.spStatusCompleted(trigger.new,trigger.old,trigger.newMap,trigger.oldMap);
    }*/
}