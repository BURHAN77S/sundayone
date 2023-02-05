public with sharing class CovidInfoCallout {
    public static void CovidCallout() {

        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.covidtracking.com/v1/us/current.json');
        request.setMethod('GET');

        Http http = new Http();
        HttpResponse response = http.send(request);

        System.debug('Resposnse Status '+ response.getStatus());
        System.debug('Resposnse Status Code '+ response.getStatusCode());
        System.debug('Resposnse Content/Body '+ response.getBody());

        if(response.getStatusCode() == 200 ) {
            String jsonData = response.getBody();
            List<covidWrapper> covidInfo = (List<covidWrapper>) JSON.deserialize(jsonData, List<covidWrapper>.class);
                covidWrapper co = covidInfo[0];
                System.debug(co);

            List<Covid_Info__c> updateCovidList = [Select Id, Received_Date__c, Positive__c, Negative__c, Pending__c, Name from Covid_Info__c where Received_Date__c = TODAY];
            if(!updateCovidList.isEmpty()){
                updateCovidList[0].Name = String.valueOf(co.State);
                updateCovidList[0].Positive__c = co.Positive;
                updateCovidList[0].Negative__c = co.Negative;
                updateCovidList[0].Pending__c = co.Pending;

                update updateCovidList[0];
            }else{
                Covid_Info__c cvdInf = new Covid_Info__c();
                cvdInf.Name = String.valueOf(co.State);
                cvdInf.Positive__c = co.Positive;
                cvdInf.Negative__c = co.Negative;
                cvdInf.Pending__c = co.Pending;
                cvdInf.Received_Date__c = date.today();
                Insert cvdInf;
            }
        }
    }

    Public class covidWrapper {
        public Integer State;
        public Integer Positive;
        public Integer Negative;
        public Integer Pending;
    }
}