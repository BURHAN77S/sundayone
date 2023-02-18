@isTest
public with sharing class OpportunityManagerTest {
    @isTest
    private static void postOpportunityTest() {
        test.startTest();
        id oppId = OpportunityManager.createOpportunity('Ayse', '2023-7-2', 'Prospecting', '333333');
        test.stopTest();
        System.assertNotEquals(null, oppId);
        Opportunity op = [select id, name, stageName, closeDate, amount from Opportunity where id =: oppId];
        System.assertEquals('Ayse', op.name);
    }
}