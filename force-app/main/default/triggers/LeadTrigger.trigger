/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-11-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

/*1. Whenever Lead is created with LeadSource as Web then show "Rating should be Cold"
message otherwise show "Rating should be hot".*/

trigger LeadTrigger on Lead (before insert, after insert) {
    if(trigger.isBefore && trigger.isInsert){
        for (lead eachLead : trigger.new) {
            if (eachLead.LeadSource =='Web') {
                system.debug('Rating should be Cold');
            }else{
                system.debug('Rating should be hot');
            }
        }
    }
}