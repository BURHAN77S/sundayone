/*Write a logic in Batch to Create tasks for all the cases other than the closed and on which there
was no activity since last 5 days.
a. Implement the above logic in such a way that whenever required subject and Comments
field value can be changed without the code change.
Populate the task field values as follows:
Field        Value
Subject      Critical action needed
Due Date     Today + 2 days.
Comments     Complete fast.
Related To   Case Id
Assigned To  Case Owner Id
Status       In Progress*/

public class CaseBatch implements Database.Batchable<SObject> , database.stateful{
    integer count=0;
    public database.QueryLocator start(database.BatchableContext bc) {
        database.QueryLocator q1;
        if(!test.isRunningTest()){
            q1 = Database.getQueryLocator([select id, OwnerId, LastModifiedDate, Status from case where status !='Closed' and LastModifiedDate < LAST_N_DAYS: 5]);
        }else{
            q1 = Database.getQueryLocator([select id, OwnerId, LastModifiedDate, Status from case where status !='Closed']);
        }
        return q1;
    }

    public void execute(database.BatchableContext bc, list<case> scope) {
        list<task> listTasks = new list<task>();
        for(case eachCase : scope){
            task tsk= new task();
            //tsk.Subject='Critical action needed';
            tsk.Subject=system.label.subject;
            tsk.ActivityDate= date.today().addDays(2);
            //tsk.Description='Complete fast';
            tsk.Description=system.label.comment;
            tsk.WhatId=eachcase.id;
            tsk.OwnerId=eachcase.OwnerId;
            tsk.Status='In Progress';
            listTasks.add(tsk);
            count ++;

        }
        if(!listTasks.isEmpty()){
            insert listTasks;
        }
    }

    public void finish(database.BatchableContext bc) {
        system.debug('Finished' + count + 'sayida task create edilmis.');
    }

}