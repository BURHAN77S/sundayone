/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 11-20-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class ValidateAddress {
    public void validateHomeAddress() {
        String houseName ='White House';
        String streetName ='White House Main Street';
        String cityName ='San Francisco';
        String stateName ='CA';
        String stateISOCode = '94178A';
        String countryName ='USA';
        String countryISOCode = '3166';
        System.debug('The number of characters in the street name. ' + streetName.length());
        Boolean varContainHouseName = streetName.contains(houseName);
        System.debug('The street name contains a house name in it or not.: ' + varContainHouseName);
        System.debug('If the street name contains the state iso code in it: ' + streetName.contains(stateISOCode));
        System.debug('We are converting upper case and lower case '+stateISOCode.toUpperCase() +' '+countryISOCode.toUpperCase() +' '+ countryName.toUpperCase() +' '+cityName.toLowerCase()+' '+ stateName.toLowerCase());
        String  fullAddress = houseName +' '+ streetName  +' '+ cityName  +' '+ stateName  +' '+ stateISOCode  +' '+ countryName +' '+  countryISOCode;
        System.debug('Full Address is: ' + fullAddress);
    }
}