public with sharing class StudentCtrl {
    @AuraEnabled
    public static List<Student__c> searchStudentsByPostalCode(String postalCode) { 
        postalCode = '%'+ postalCode +'%';
        return [Select Postal_Code__c, Student_Name__c, Class__c, Mobile__c, Email__c  from Student__c where Postal_Code__c LIKE: postalCode];
    }
}