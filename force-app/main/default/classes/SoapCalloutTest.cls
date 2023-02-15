@isTest
public with sharing class SoapCalloutTest {
    @IsTest
    static void parksCalloutTest(){
        ParksServicesMock mock = new ParksServicesMock();
        test.setMock(WebServiceMock.class, mock);

        String country = 'Turkey';
        String[] parks = SoapCallouts11.parksCallout(country);

        System.assertEquals(2, parks.size());
    }
}