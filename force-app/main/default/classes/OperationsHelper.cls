/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 11-27-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public  class OperationsHelper {
    public decimal largestOutOfTwoNumbers(decimal d1, Decimal d2){
 if (d1>d2) {
     return d1;
 } else {
     return d2;
 }
    }
    public decimal smallestOutOfThreeNumbers(decimal n1,decimal n2, Decimal n3){
     if (n1<=n2 && n1<=n3){
         return n1;
     } else if (n2<=n1 && n2<=n3) {
         return n2;
     } else {
     return n3;
 }
    }
    public integer sumofPositiveIntegers(integer n){
     integer sum;
     if (n<0 ){
         System.debug('We are not calculating the sum for negative numbers ');
     } else {
         sum=0;
      for (integer i=0; i<=n; i++) {
         sum=sum+i; // sum+=i
      }
     }
     return sum;

/*List – Iteration
a. We want to do some calculations by passing a List of decimal as parameters.
Create four different methods in the OperationsHelper class to do the following:
i. Sum
ii. Average
iii. Highest
iv. Lowest
Every method must have an input parameter of type List of decimal.
If the provided list is empty, then show a message like “Please provide values to do
the operation” and return null otherwise return the calculated value.
6*/
    public static list<decimal> sum(list<decimal> opsList){
        decimal total = 0;
        if(!opsList.isEmpty()){
            for (decimal eachList : opsList){
                total += eachList;
            }else {
                System.debug('Please provide values to do the operation');
            }
        }
    }
}