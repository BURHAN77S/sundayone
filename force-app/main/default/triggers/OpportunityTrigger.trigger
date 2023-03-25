trigger OpportunityTrigger on Opportunity (before insert, after insert, before update,after update, after delete, after undelete) {
    /*Create future methods which takes in the set of Account Ids and do the following tasks:
A. Update the "Highest Amount Opportunity Name" field at Account level with the
opportunity Name which have the Highest amount among the opportunities related to
the account.
B. Update the 'Target Amount Achieved Opportunity Name' at Account level with the
Closed Won Opportunity Name. Populate the opportunity name which have highest
value in Amount field, and it should be more than 'Target Amount' field value at account.
C. Update the 'Total Amount Generated' at Account with the total of Amount for all the
closed Won Opportunities related to an Account.
Please Note: Above updates should happen whenever any of the following event occurs:
i. Amount field is Updated at Opportunity level.
ii. Opportunity stageName is changed.
iii. Opportunity is reparented i.e AccountId field value is changed.
iv. A new Opportunity is created and tagged to an account.
v. An Opportunity is deleted or undeleted */

    set<id> accIds = new set<id>();
    if(trigger.isAfter){
        
        if(trigger.isInsert || trigger.isUndelete){
           for(Opportunity eachOpp : trigger.new){
              if(eachOpp.AccountId !=null){
                 accIds.add(eachOpp.AccountId);
              }
           }
        }


        if(trigger.isUpdate){
           for(Opportunity eachOpp : trigger.new){
                
                Opportunity oldRecord = trigger.oldMap.get(eachOpp.id);
               
                if(eachOpp.Amount != oldRecord.Amount || eachOpp.StageName != oldRecord.StageName || eachOpp.AccountId != oldRecord.AccountId){
                    accIds.add(eachOpp.AccountId);
                }
           }



        }   

        if(trigger.isDelete){
            for(Opportunity eachOpp: trigger.old){
                if(eachOpp.AccountId !=null){
                    accIds.add(eachOpp.AccountId);
                }
            }
        }
    }
    if(!accIds.isEmpty()){
        OpportunityTriggerHandler.updateHighestAmountOppName(accIds);
        OpportunityTriggerHandler.updateTargetAchievedOpportunityName(accIds);
        OpportunityTriggerHandler.updateTotalAmountGen(accIds);
    }

/*Part 1 – Debugs in Triggers
1. Print the new and old field values for (Opportunity Name and Amount) fields whenever
an opportunity is updated.
2. Show the message as 'Case origin is changed for [Case Number]' whenever case origin
field value is changed.
3. When the StageName of an opportunity is updated, then print the value of description
field and opportunity name. [OPTIONAL]

    if(trigger.isBefore && trigger.isUpdate){
        for(Opportunity eachOpp : trigger.new){
            if(eachOpp.stageName != trigger.oldMap.get(eachOpp.Id).stageName){
                system.debug('Description is '+eachOpp.Description+', Opportunity name is '+eachOpp.Name);
            }
        }
    }*/

    /*if(trigger.isBefore && trigger.isUpdate){
    List<Opportunity> oppNew = Trigger.new;
    Map<id, Opportunity> oppOldMap = Trigger.oldMap;
    for(Opportunity eachOpp : oppNew){
        system.debug('New name is '+ eachOpp.Name + ' New amount ='+eachOpp.Amount);

        system.debug('Old name is ' + oppOldMap.get(eachOpp.Id).Name+' Old amount is = '+oppOldMap.get(eachOpp.Id).Amount);
        }
    }*/

/*2. When an opportunity is created show a debug message ([OpportunityName] –
[CloseDate] – [Amount]) for each opportunity and print the total number of
opportunities created in the transaction. For example: Demo Opportunity – 20/10/2022
– 40000.*/

/*trigger OpportunityTrigger on Opportunity (before insert, after insert,before update, after update) {
    /*if(trigger.isBefore && trigger.isInsert){
        for (Opportunity eachOpp : trigger.new) {
            system.debug(eachOpp.Name+' '+eachOpp.CloseDate+' '+eachOpp.Amount);
            system.debug(trigger.new.size());
        }
    }
}*/

/*4. When opportunity is created print the StageName, value of description field and
opportunity name.*/

    /*if(trigger.isBefore && trigger.isInsert){
        for (Opportunity eachOpp : trigger.new) {
            system.debug(eachOpp.StageName+' '+eachOpp.Name+' '+eachOpp.Description);
        }
    }*/
}