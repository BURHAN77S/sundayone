/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-25-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@istest
public class RankHandlerTest {
    @isTest
    private static void rankPrizeTest() {
    RankHandler rh=new RankHandler();

    string prz=rh.rankPrize(1);
    system.assertEquals('Gold',prz);

    prz=rh.rankPrize(2);
    system.assertEquals('Silver',prz);

    prz=rh.rankPrize(3);
    system.assertEquals('Bronze',prz);

    prz=rh.rankPrize(5);
    system.assertEquals('Top 10',prz);

    prz=rh.rankPrize(15);
    system.assertEquals('Participation certificate',prz);
    }
    @isTest
    private static void rankPrizeSwitchTest(){
        RankHandler rh=new RankHandler();

    string prz=rh.rankPrizeSwitch(1);
    system.assertEquals('Gold',prz);

    prz=rh.rankPrizeSwitch(2);
    system.assertEquals('Silver',prz);

    prz=rh.rankPrizeSwitch(3);
    system.assertEquals('Bronze',prz);

    prz=rh.rankPrizeSwitch(5);
    system.assertEquals('Top 10',prz);

    prz=rh.rankPrizeSwitch(15);
    system.assertEquals('thank you for participating',prz);
    }
}