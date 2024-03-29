public class SalesforceProjectHandler {
    public static void createDefaultTicket(List<salesforce_project__c> spTriggerNew) {
        try{
        List<Salesforce_Ticket__c>  listST = new List<Salesforce_Ticket__c>();
        
        /*DefaultTicketInfo__c defaultValues = DefaultTicketInfo__c.getOrgDefaults();*/

        for (salesforce_project__c eachSP : spTriggerNew) {
            Salesforce_Ticket__c newST = new Salesforce_Ticket__c();
            /*newST.Subject__c = defaultValues.Subject__c;
            newST.Description__c=defaultValues.Description__c;*/
            newST.Salesforce_Project__c = eachSP.Id;
            newST.Priority__c = 'Medium';
            listST.add(newST);
        }
        if (!listST.isEmpty()) {
            //insert listST;
            list<database.SaveResult> results =Database.insert(listST,false);
            for(Database.SaveResult eachResult: results){
                if(eachResult.isSuccess()){
                 system.debug('inserted successfully record id is ' + eachResult.getId());
                }else{
                 system.debug('eroored out.eroors ar' + eachResult.getErrors());
                }
            }
        }
    }catch (Exception ex){
        for(Salesforce_Project__c sp : spTriggerNew){
            sp.addError('Error in inserting Default ticket. Please contact your dear administrador');
        }
    }
    }

    public static void completeSPvalidation(List<salesforce_project__c> spTriggerNew, List<salesforce_project__c> spTriggerOld, 
    Map<id,salesforce_project__c> spTriggerNewMap, Map<id,salesforce_project__c> spTriggerOldMap) {
        
        set<id> spCompletedIds = new set<id>();
        for (salesforce_project__c eachSP : spTriggerNew) {
            if (eachSP.Status__c == 'Completed' && eachSP.Status__c != SpTriggerOldMap.get(eachSP.id).Status__c) {
                spCompletedIds.add(eachSP.Id);
            }
        }

        //get all tickets which are not compelted.
        List<Salesforce_Ticket__c> listST = [select id, status__c, salesforce_project__c from Salesforce_Ticket__c
                                            where Salesforce_Project__c in :spCompletedIds
                                            and status__c != 'Completed'];
        for (salesforce_ticket__c eachST : listST) {
            Salesforce_Project__c spNew = spTriggerNewMap.get(eachST.Salesforce_Project__c);
            spNew.addError(
                'Cannot complete project because all tickets are not completed. Go away.'
            );
        }
    }

    @future
    public static void spUpdateDescription(Set<id> setSPId) {
        system.debug('inside future method. Huhuuu');
        List<Salesforce_Project__c> allSP = [select id, description__c from Salesforce_Project__c where id in :setSPId];
        for (salesforce_project__c eachSP : allSP) {
            eachSP.Description__c += '. Updated from future';
        }
        update allSP;
    }

    //a
    public static void spStatusCompleted(List<salesforce_project__c> spTriggerNew, List<salesforce_project__c> spTriggerOld, 
    Map<id,salesforce_project__c> spTriggerNewMap, Map<id,salesforce_project__c> spTriggerOldMap) {
        
        //get spIds whose status is changed to 'Completed'
        set<id> spCompleted = new set<id>();
        for (Salesforce_project__c sp : spTriggerNew) {
            //how to get if status is changed to completed?
            //compare old and new value
            if (sp.Status__c == 'Completed' && sp.Status__c != spTriggerOldMap.get(sp.id).Status__c) {
                spCompleted.add(sp.Id);
            }
        }
        //call future method to update tickets.
        if (!spCompleted.isEmpty()) {
            updateTicketStatus(spCompleted);
        }

    }

    //b
    @future
    public static void updateTicketStatus(set<id> ProjectIds) {
        //get all tickets
        List<salesforce_ticket__c> allTickets = [select id, status__c, salesforce_project__c from Salesforce_Ticket__c
        where Salesforce_Project__c in :ProjectIds and status__c != 'Completed'];

        //set status to completed
        for (salesforce_ticket__c eachST : allTickets) {
            eachST.Status__c = 'Completed';
        }
        update allTickets;
        //update tickets.
    }
}