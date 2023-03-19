@isTest
public with sharing class StudentCtrlTest {
    @isTest
    public static void searchStudentsByPostalCodeTest() {
        List<Student__c> ListST = new List<Student__c>();

        for (Integer i = 0; i < 200; i++) {
            Student__c Stu = new Student__c();

            Stu.Student_Name__c = 'Student' +i;
            Stu.Postal_Code__c = '123'+i;
            ListST.add(Stu);
        }
        insert ListST;

        test.startTest();

        List<Student__c> ListST1 = StudentCtrl.searchStudentsByPostalCode('123');
        assert.areEqual(200, ListST1.size());

        List<Student__c> ListST2 = StudentCtrl.searchStudentsByPostalCode('123199');
        assert.areEqual('Student199', ListST2[0].Student_Name__c);

        test.stopTest();
    }
}