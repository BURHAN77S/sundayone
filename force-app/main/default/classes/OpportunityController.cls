public with sharing class OpportunityController {
    @AuraEnabled
    public static Decimal getStageOppCalculate(String stage) {
        List<Opportunity>  ListOpp = [Select Amount from Opportunity WHERE StageName =:stage AND Amount != NULL];

        decimal total = 0;
        for (Opportunity Opp : ListOpp) {
            total += opp.Amount;
        }
        return total;
    }
}