/*Write an Queueable apex class which should create a simple case record. Call the Queueable class in
Anonymous apex and print the Job ID.
Validate the created case in your salesforce org and verify the status of Queueable class in the Apex Job
page.*/

public class CaseQueueable implements Queueable{
    //class variable



    public void execute(QueueableContext qc){
        Case cs = new case();
        cs.Origin = 'Web' ;
        cs.Status = 'New';
        cs.Subject= 'queueable';
        insert cs;
    }
}

