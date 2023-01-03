/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-25-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class CaseTriggerHandler {
    public static void setStatus(List<Case> triggerNew){
        for(case eachCase : triggerNew){
            if(eachCase.Origin =='Email'){
                eachCase.Status ='New';
                eachCase.Priority ='Medium';
            }
        }
    }

    public static void checkCaseDescription(List<Case> triggerNew){
        set<id> caseIds = new set<id>();
        for(Case eachCase : triggerNew){
            if(eachCase.Description != null && eachCase.Description.containsIgnoreCase('password')){
                caseIds.add(eachCase.id);
            }
        }
        List<Case> listCase = new List<Case>();
        if(!caseIds.isEmpty()){
            for(Id eachId : caseIds){
                Case c1 = new case();
                c1.Subject = 'Parent Case may contain secret info, do something NOW';
                c1.ParentId = eachId;
                c1.Priority = 'High';
                c1.Description = 'Secret info not allowed in case';
                listCase.add(c1);
            }
        }
        insert listCase; 
    }
}