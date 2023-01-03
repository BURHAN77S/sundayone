/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-25-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

/*1. [Trigger you did in last week]
When a case is created, check the description field of the newly created case - if the description
field contains the word ‘password’, then create a child case with the following field values
- subject = ‘Parent Case may contain secret info, do something NOW’
- parentId = _______ (newly create case id)
- priority = ‘High’
- Description = ‘Secret info not allowed in case’*/

@isTest
public class CaseTriggerHandlerTest {
    @isTest
    private static void checkCaseDescriptionTest(){
        List<Case> listCase = new List<Case>();
        for (Integer i = 0; i < 200; i++) {
            Case cs1 = new case();
            cs1.Origin = 'Email';
            cs1.Status = 'New';
            if(i < 100) {
                cs1.Description = 'password';
            }else{
                cs1.Description = 'Yüzden büyük';
            }
            listCase.add(cs1);
        }
        insert listCase;

        Test.startTest();

        List<Case> listCs = [select id from Case];
        System.assertEquals(300, listCs.size());
        List<Case> listCs1 = [select id from Case where Subject='Parent Case may contain secret info, do something NOW'];
        System.assertEquals(100, listCs1.size());
        Test.stopTest();
    }
}
