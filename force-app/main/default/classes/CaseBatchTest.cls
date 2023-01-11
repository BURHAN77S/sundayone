@isTest
public class CaseBatchTest {
    @TestSetup
    public static void makeData() {
        List<Case> caseList = new List<Case>();
        for(Integer i = 0; i<200; i++){
            Case cs = new Case();
            cs.Origin = 'Web';
            if(i<150){
            cs.Status = 'New';
            }else{
            cs.Status ='Closed';
            }
            caseList.add(cs);
        }
        insert caseList;
    }
    @isTest
    Public static void testCase(){
        test.startTest();
        CaseBatch cb = new CaseBatch();
        Database.executeBatch(cb);
        test.stopTest();
        List<Task> listTask =[Select Id, Subject, Description from task];
        System.assertEquals(150, listTask.size());
        System.assertEquals('Critical action needed', listTask[140].Subject);
        System.assertEquals('Complete fast.', listTask[140].Description);
    }
}
