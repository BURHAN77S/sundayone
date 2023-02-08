@istest
public class RestApiOutboundCalloutTest {
   @istest
    private static void getFlagsCountryTest() {
        //1. Bir mock create edelim..
        GetFlagCountryCalloutMock mock = new GetFlagCountryCalloutMock();
        Test.setMock(HttpCalloutMock.class, mock);

        //2. metodu cagirma start test
        HttpResponse response = FlagsCountry.getCountry();

        //3. asserts kontrolleri..
        system.assertEquals(200, response.getStatusCode());
        System.assertEquals('OK', response.getStatus());
   } 
}