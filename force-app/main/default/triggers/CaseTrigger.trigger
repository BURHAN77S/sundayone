/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-25-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

trigger CaseTrigger on Case (before insert, before update, after insert, after update) {

    // 1. Whenever a case is created with origin as email then set status as new and Priority as Medium.

    
    /*if(trigger.isBefore && trigger.isUpdate){
        CaseTriggerHandler.setStatus(trigger.New);
        
        for(case eachCase : trigger.new){
            if(eachCase.Origin =='Email'){
                eachCase.Status ='New';
                eachCase.Priority ='Medium';
            }
        }
    } 

    if(trigger.isAfter && trigger.isInsert){
        CaseTriggerHandler.checkCaseDescription(trigger.New);
    }
}

    /* 2. Show the message as 'Case origin is changed for [Case Number]' whenever case origin
field value is changed 

    if(trigger.isBefore && trigger.isUpdate){
        for (case eachCase : trigger.new){
            if(eachCase.Origin != trigger.oldMap.get(eachCase.id).origin){
                system.debug('Case origin is changed for '+eachCase.caseNumber);
            }
        }
    }
}*/

/**
1. Create a trigger on a Case object named “CaseTrigger”. Show the debug messages as follows:
a. Triggers - "We are in the triggers"
b. after triggers - "We are in the after triggers"
c. before triggers - "We are in the before triggers"
d. before Update - "We are in the before-Update triggers"
e. before Insert - "We are in the before-Insert triggers"
f. after update - "We are in the after-Update triggers"
g. after Insert - "We are in the after-Insert triggers".
**/


    /*System.debug('We are in the triggers');
    if(trigger.isAfter){
        System.debug('We are in the after triggers"');
    }
    if(trigger.isBefore){
        System.debug('We are in the before triggers');
    }
    if(trigger.isUpdate && trigger.isBefore){
        System.debug('We are in the before-Update triggers');
    }
    if(trigger.isUpdate && trigger.isAfter){
        System.debug('We are in the before-Update triggers');
    }
    if(trigger.isInsert && trigger.isBefore){
        System.debug('We are in the before-Insert triggers');
    }
    if(trigger.isInsert && trigger.isAfter){
        System.debug('We are in the After-Insert triggers');
    }*/

    /*2. Try to print this message (Case# [caseNumber] was created with id [recordId] on [createdDate].)
in all the events where Id is not null.
For example: when a case with Id as ‘5005j00000C7CRJAA3’ and with case number as ‘11234’
created on 12/7/2021. then the message should be printed as –
Case# 11234 was created with id 5005j00000C7CRJAA3 on 12/7/2021.
- Please check the triggers for Bulk DML scenarios as well.*/

/* list<case> listCase = trigger.new;
    if(trigger.isAfter && trigger.isInsert){
        for (case cs : listCase) {
            system.debug(cs.CaseNumber + ' '+cs.id+' '+cs.CreatedDate);
        }
    }*/
}