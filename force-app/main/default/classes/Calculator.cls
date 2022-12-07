/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 11-20-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class Calculator {
    public static decimal dynamicCalulationMethod(decimal a, decimal b, String c) {
        decimal result;
        if (c == 'Addition') {
            result = a + b;
            System.debug('a. Input →10, 67.5, ADDITION: ' + result);
        } else if (c == 'Subtraction'){
            result = a - b;
            System.debug('b. Input → 90, 60, SUBTRACTION: ' + result);
        } else if (c == 'Division'){
            result = a / b;
            System.debug('c. Input → 8, 2, DIVISION: ' + result);
        } else if(c == 'Multiplication'){
            result = a * b;
            System.debug('d. Input → 6,4, MULTIPLICATION: ' + result);
        } else {
            System.debug('Invalid data...');
        }
        return result;
    }
}
