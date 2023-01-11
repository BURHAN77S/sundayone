/*PART 2. Write a logic to Create tasks for all the opportunities other than the closed won or closed lost
and on which there was no activity since last 7 days. Implement using Batch APEX.
Populate the task field values as follows:
Field Value
Subject Other
Due Date Today if Opportunity close date is already passed otherwise
Opportunity Close Date – 2 days.
Comments Reminder – Please take action on the Opportunity
Related To Opportunity Id
Assigned To Opportunity Owner Id
Status In Progress*/

public class OpportunityBatch implements database.Batchable<SObject> {
    
    public database.QueryLocator start(database.BatchableContext bc) {
        
        database.QueryLocator q1 = Database.getQueryLocator([select id, OwnerId, CloseDate, StageName, LastModifiedDate,  description from Opportunity where StageName Not in ('Closed Won', 'Closed Lost') and LastModifiedDate < LAST_N_DAYS:7]);
        
        return q1;
    }

    public void execute(database.BatchableContext bc, list<Opportunity> scope) {
        List<task> tskList = new List<task>();
        for(Opportunity opp : scope ){
            task newTsk = new Task();
            newTsk.Subject = 'Other';
            newTsk.Description = 'Comments Reminder. Please take action on the Opportunity';
            newTsk.WhatId = opp.Id;
            newTsk.OwnerId = opp.OwnerId;
            newTsk.Status = 'In Progress';
            if (opp.CloseDate != date.today()) {
                newTsk.ActivityDate = date.today();
            } else {
                newTsk.ActivityDate = opp.CloseDate.addDays(-2);
            }
            tskList.add(newTsk);
        }
        if (!tskList.isEmpty()) {
            insert tskList;   
        }
    }
    

    public void finish(database.BatchableContext bc) {
        System.debug('İşlem Tamam...');
    }
}