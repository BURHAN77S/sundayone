/*2. Write a logic to delete all the opportunities which were updated as closed Lost using BATCH
apex, also print total number of opportunities DELETED.*/

public class OpportunityBatch2 implements database.Batchable<SObject>, Database.stateful{
    
    public integer count = 0;
    public database.QueryLocator start(database.BatchableContext bc) {
        
        database.QueryLocator q1 = Database.getQueryLocator([select id, StageName from Opportunity where StageName = 'Closed Lost']);
        
        return q1;
    }

    public void execute(database.BatchableContext bc, list<Opportunity> scope) {
        if(!scope.isEmpty()){
            count += scope.size();
            delete scope;
        }
    }
    

    public void finish(database.BatchableContext bc) {
        System.debug(count +' Silme işlem tamamlandı.');
        
    }
}
