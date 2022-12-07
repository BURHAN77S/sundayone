map <string, decimal> currISOCodeAndExchangeRateMap = new  map <string, decimal> {'AUD' => 0.73, 'CAD' => 0.78, 'EUR' => 1.13, 'NZD' => 0.68, 'INR' => 0.013};
System.debug(currISOCodeAndExchangeRateMap);

decimal iso1 = currISOCodeAndExchangeRateMap.get('AUD');
System.debug(iso1);

boolean checkIfSad = currISOCodeAndExchangeRateMap.containsKey('SAD');
System.debug(checkIfSad);

Set <string> Set1 = new Set <string>();
Set <string> Set2 = new Set <string>();

for (string eachIsoCode : currISOCodeAndExchangeRateMap.keySet()){
    decimal value1 = currISOCodeAndExchangeRateMap.get(eachIsoCode);
    //System.debug(eachIsoCode + ' ' + value1);
    if(value1 >= 1){
        Set1.add(eachIsoCode);
    }else{
        Set2.add(eachIsoCode);
    }
}
System.debug('Değeri 1 den büyük olanlar '+ Set1 +'/ değeri birden küçük olanlar '+Set2);