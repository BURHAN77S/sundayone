public class SPTriggerHandler {
    @future
        public static void spUpdateDescription(set<id> setSpId){
            system.debug('future method called.huhuuu');
             List<Salesforce_Project__c> allSP= [select id, description__c from Salesforce_Project__c where id in: setSpId];
             for(Salesforce_Project__c eachSP : allSP){
                eachSP.Description__c += '. Updated from future.';
             }
             update allSP;
        }
        //a
        public static void SPStatusCompleted(list<Salesforce_Project__c> spTriggerNew,list<Salesforce_Project__c> spTriggerOld,map<id,Salesforce_Project__c> spTriggerNewMap,map<id,Salesforce_Project__c> spTriggerOldMap){
            //get spIds whose status is changed to 'Completed'
             set<id> spCompleted = new set<id>();
             for(Salesforce_Project__c sp: spTriggerNew){
                if(sp.Status__c =='Completed' && sp.Status__c != spTriggerOldMap.get(sp.id).Status__c){
                    spCompleted.add(sp.Id);
                }
             }

            //call future method to update tickets.
                if(!spCompleted.isEmpty()){
                    updateTicketStatus(spCompleted);
                }
            //b
        }
        //b
        @future
        public static void updateTicketStatus(set<id> ProjectIds){
            List<Salesforce_Ticket__c> allTickets = [select id, status__c, salesforce_project__c from Salesforce_Ticket__c where Salesforce_Project__c in: ProjectIds];

            //set status to completed
            for(Salesforce_Ticket__c eachST : allTickets){
                eachST.Status__c='Completed';
            }
            update allTickets;
        }
}