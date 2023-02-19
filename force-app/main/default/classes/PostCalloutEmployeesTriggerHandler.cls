public with sharing class PostCalloutEmployeesTriggerHandler {
    public static void postEmployee(List<Employee__c> TriggerNew) {
        for(Employee__c eachEmp : TriggerNew) {
            PostCalloutEmployees.employeePost(eachEmp.Id);
        }
    }
}