public with sharing class SoapCallouts11 {
    public static String[] parksCallout(String country) {
        ParksServices.ParksImplPort parksService = new ParksServices.ParksImplPort();
        parksService.byCountry(country);
        String[] parks = parksService.byCountry(country);
        System.debug(country +' ulkesinin parkları => ' + parks);
        return parks;
    }
}