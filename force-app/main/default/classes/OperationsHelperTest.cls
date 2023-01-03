/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-25-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
public class OperationsHelperTest {
    @isTest
    private static void largestOutOfTwoNumbersTest() {
        OperationsHelper opt= new OperationsHelper();
        decimal rtMax=opt.largestOutOfTwoNumbers(6.2,3);
        system.assertEquals(6.2,rtMax);
        rtMax=opt.largestOutOfTwoNumbers(4,8.1);
        system.assertEquals(8.1,rtMax);
        rtMax=opt.largestOutOfTwoNumbers(6,6);
        system.assertEquals(6,rtMax);
    }
    @isTest
    private static void smallestOutOfThreeNumbersTest(){
        OperationsHelper opt=new OperationsHelper();
        decimal min=opt.smallestOutOfThreeNumbers(1,2,3);
        System.assertEquals(1, min);
        min=opt.smallestOutOfThreeNumbers(4,5,2);
        System.assertEquals(2, min);
        min=opt.smallestOutOfThreeNumbers(4,4,4);
        System.assertEquals(4, min);
    }
    @isTest private static void sumOfPositiveIntegerTest(){
        integer sum= OperationsHelper.sumOfPositiveInteger(5);
        system.assertEquals(15,sum);
        sum= OperationsHelper.sumOfPositiveInteger(-5);
        system.assertEquals(null,sum);
        system.assertEquals(55,OperationsHelper.sumOfPositiveInteger(10));
    }
}










