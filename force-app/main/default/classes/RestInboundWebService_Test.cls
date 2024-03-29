@isTest
public with sharing class RestInboundWebService_Test {
    @TestSetup
    public static void makeData(){
        // Creating a Test Case record
        Case testRec = New Case();
        testRec.Subject = ' Test Case';
        testRec.Description ='Test Description';
        testRec.Origin ='Phone';
        testRec.Status ='New';
        testRec.Priority ='High';
        insert testRec;
    }

    @isTest
    public static void getCaseByIdSuccessTest(){
        //Id caseId = [SELECT Id FROM Case][0].Id;
        Id caseId = [SELECT Id FROM Case LIMIT 1].Id;
        // Setup Mock test request
        RestRequest request = new RestRequest();
        request.requestURI = 'https://burhancelikco-dev-ed.develop.my.salesforce.com/services/apexrest/InboundCaseManager/' + caseId;
        request.httpMethod = 'GET';
        RestContext.Request = request;
        // Call  the Inbound Webservice Method
        Test.startTest();

        Case testRec = RestInboundWebService.getCaseById();

        Test.stopTest();
        // Verify Results
        System.assertEquals(testRec.Id, caseId, 'Test case Record Id should be matching with the Webservice method result');
    }

    @isTest
    public static void createCaseSuccessTest(){
        // Setup a Test request
        RestRequest request = New RestRequest();
        request.requestURI = 'https://burhancelikco-dev-ed.develop.my.salesforce.com/services/apexrest/InboundCaseManager/';
        request.httpMethod = 'POST';
        RestContext.Request = request;
        // Call Webservice method
        Test.startTest();

        RestInboundWebService.createCase('Test Case #2', 'Test Case Description', 'New', 'High', 'Web');

        Test.stopTest();

        Case testRec = [SELECT Id, Subject FROM Case WHERE Subject = 'Test Case #2'];
        System.assertEquals('Test Case #2', testRec.Subject, 'New Test record is Created!');
    }
    @IsTest
    public static void deleteCaseSuccessTest(){
        // Fetch case Record id
        Id caseId = [SELECT Id FROM Case LIMIT 1].Id;
        // Setup a test Request
        RestRequest request = new RestRequest();
        request.requestURI = 'https://abinash-panigrahi-0113-dev-ed.my.salesforce.com/services/apexrest/InboundCaseManager/' + caseId;
        request.httpMethod = 'DELETE';
        RestContext.Request = request;
        RestContext.Response = new RestResponse();
        //Call the WebService method
        Test.startTest();
        RestInboundWebService.deleteCase();
        Test.stopTest();
        // Verify Result
        List<Case> testRecList = [SELECT Id FROM Case];
        System.assertEquals(0, testRecList.size(), 'Not expecting any Case record to be present after Deletion!');
    }
}