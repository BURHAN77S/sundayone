public with sharing class PostCalloutEmployees {
    @Future(callout=true)
    public static void employeePost(Id eId) {
        Employee__c emp = [Select Id, Name, Username__c, Email__c, Gender__c, Designation__c, Phone_Number__c, Complete_Address__c, Integration_Status__c from Employee__c where Id =: eId];

        EmployeeWrapper empw = new EmployeeWrapper();
        empw.username = emp.Username__c;
        empw.name = emp.Name;
        empw.email = emp.Email__c;
        empw.gender = emp.Gender__c;
        empw.designation = emp.Designation__c;
        empw.phone_number = emp.Phone_Number__c;
        empw.complete_address = emp.Complete_Address__c;

        String responseJSON = (JSON.serialize(empw));

        HttpRequest Request = new HttpRequest();
        Http httpObject = new Http();
        Request.setEndpoint('https://api.onlinewebtutorblog.com/employees');
        Request.setMethod('POST');
        Request.setBody(responseJSON);
        request.setHeader('Content-Type', 'application/json');
        HttpResponse response = httpObject.send(request);
        String responseBody = response.getBody();

        emp.Integration_Status__c = responseBody;
        update emp;
    }

    public class EmployeeWrapper {
        public String username;
        public String name;
        public String email;
        public String gender;
        public String designation;
        public String phone_number;
        public String complete_address;
    }
}