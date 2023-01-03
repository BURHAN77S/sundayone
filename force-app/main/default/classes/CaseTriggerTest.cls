/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-25-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
public class CaseTriggerTest {
    @isTest
    private static void csTriggerTest(){
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
        List<Case> listCase1 = new List<Case>();
        for(case c : listCase){
            c.Priority = 'High';
            listCase1.add(c);
        }   
        update listCase1;
    }
}
