@RestResource(urlmapping='/Opp/*')
global with sharing class OpportunityManager {
    @httpGet
    global static Id getOpportunity() {
        RestRequest Request = RestContext.Request;
        String uri = Request.requestURI;
        id oppId = uri.substringAfterLast('/');
        Opportunity op = [Select Id, name, closedate, stageName, Amount from Opportunity where Id =: oppId];
        return op.Id;
    }

    @HttpPost
    global static Id createOpportunity(String name, String closeDate, String stagename, String amount){
        Opportunity opp = new Opportunity();
        opp.Name = name;
        opp.CloseDate = Date.valueOf(closeDate);
        opp.StageName = stagename;
        opp.Amount = Decimal.valueOf(amount);
        insert opp;
        return opp.id;
    }

    @HttpDelete
    global static String deleteOpportunity(){
        RestRequest Request = RestContext.Request;
        String uri = Request.requestURI;
        Id oppId = uri.substringAfterLast('/');
        Opportunity op = [select id from Opportunity where id=:oppId];
        delete op;
        return 'Recordunuz başariyla silindi!';
    }
    @HttpPut
    global static Id upsertOpportunity(String Id, String name, String closeDate, String stagename, String amount){
        Opportunity opp = new Opportunity();
        opp.Id = Id;
        opp.Name = name;
        opp.CloseDate = Date.valueOf(closeDate);
        opp.StageName = stagename;
        opp.Amount = Decimal.valueOf(amount);
        upsert opp;
        return opp.Id;
    }
    @HttpPatch
    global static Opportunity updateOpportunity(){
        RestRequest Request = RestContext.Request;
        String jsonString = Request.requestBody.toString();
        Opportunity op = (Opportunity)JSON.deserialize(jsonString, Opportunity.class);
        update op;
        Opportunity opNew = [select id, name, stageName, closeDate, amount from Opportunity where id =: op.Id];
        return opNew;
    }
}