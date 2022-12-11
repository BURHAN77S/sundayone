/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-11-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

/*2. When an opportunity is created show a debug message ([OpportunityName] –
[CloseDate] – [Amount]) for each opportunity and print the total number of
opportunities created in the transaction. For example: Demo Opportunity – 20/10/2022
– 40000.*/

trigger OpportunityTrigger on Opportunity (before insert, after insert,before update, after update) {
    /*if(trigger.isBefore && trigger.isInsert){
        for (Opportunity eachOpp : trigger.new) {
            system.debug(eachOpp.Name+' '+eachOpp.CloseDate+' '+eachOpp.Amount);
            system.debug(trigger.new.size());
        }
    }
}*/

/*4. When opportunity is created print the StageName, value of description field and
opportunity name.*/

    if(trigger.isBefore && trigger.isInsert){
        for (Opportunity eachOpp : trigger.new) {
            system.debug(eachOpp.StageName+' '+eachOpp.Name+' '+eachOpp.Description);
        }
    }
}