/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 11-20-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class PlayingWithDates {
    public void printDateOutput() {
        date today = date.today();
        date now = date.newInstance(2789, 11, 5);
        date march = date.newInstance(1459, 3, 4);
        Integer dayInt = 25;
        Integer monthInt = 7;
        Integer yearInt = 1966;
        date newVar = date.newInstance(yearInt,monthInt, dayInt);
        System.debug('Today date is: ' + today);
        System.debug('First date is: ' + now);
        System.debug('Second date is: ' + march);
        System.debug('New date is: ' + newVar);
    }
}
