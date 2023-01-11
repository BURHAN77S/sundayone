@isTest
public class OpportunityBatch2Test {
    @TestSetup
    Public static void makeData1(){
        List<Opportunity> listOpp = new List<Opportunity>();
        for(integer i=0; i<200; i++){
        Opportunity opp = new Opportunity();
            Opp.Name = 'Test'+i;
            Opp.CloseDate = date.today();
            if(i<50){
                Opp.StageName = 'Closed Lost';
            }else{
                Opp.StageName = 'Closed Won';
            }
            listOpp.add(opp);
        }
        insert listOpp;
    }

    @isTest
    Public static void testExecute(){
        Test.startTest();
        OpportunityBatch2 op2 = new OpportunityBatch2();
        Database.executeBatch(op2);
        Test.stopTest();
        List<Opportunity> oppList =[select id, StageName from Opportunity];
        System.assertEquals(150, oppList.size());
        System.assert(oppList[0].StageName == 'Closed Won');
    }
    @isTest
    Public static void testschedulable1(){
        OpportunitySchedulable oppSch = new OpportunitySchedulable();
        Test.startTest();
        Id JobId = System.schedule('deleteClosedLost', '0 0 15 1/1 * ? *', oppSch);
        Test.stopTest();
        CronTrigger ct= [SELECT TimesTriggered, NextFireTime FROM CronTrigger WHERE Id = :jobID];
        System.assertEquals('2023-01-12 15:00:00', string.valueOf(ct.NextFireTime));

    } 
}
