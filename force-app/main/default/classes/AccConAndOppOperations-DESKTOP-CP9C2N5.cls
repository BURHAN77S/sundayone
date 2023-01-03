/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-21-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class AccConAndOppOperations {
    public static List<Account> takeInfo() {
        List<Account> listAcc = new List<Account>();
        listAcc = [select id, name, AnnualRevenue,Type, AccountSource from account];
        return listAcc;
    }
    public static void oppWon(string leadSource, string stageName) {
        List<Opportunity> listOpp = [select id, name, LeadSource, StageName from Opportunity where LeadSource = :leadSource AND StageName = :stageName];
      System.debug(listOpp);
    }
    public static void annualRevenue() {
        List<Account> annualR = [select id,AnnualRevenue,  Name, (select id,name,Amount from Opportunities where StageName= 'Closed Won' ) from Account where Type ='Customer - Direct'];
        //System.debug(annualR);
        for (account eachAcc : annualR) {
            System.debug( '=====$================$========'  );
            System.debug(eachAcc.name+ ' ==================== ' + eachAcc.AnnualRevenue);
          
            //  System.debug(eachAcc.Opportunities);
         
            for (opportunity eachOpp : eachAcc.Opportunities) {
                System.debug(eachOpp.name+ '============' + eachOpp.Amount);
            }
        }
    }

    //Prepare a method that returns the sum of all the closed won opportunities Amount present in the org.

    public static Decimal sumOfClosedWon(){
        List<Opportunity> oppList = new List<Opportunity>();
        oppList = [select id,  Name, stagename, Amount from Opportunity where StageName = 'Closed Won' AND Amount != null];
        Decimal sum = 0;
        for (Opportunity eachOpp : oppList){
            sum += eachOpp.Amount;
        }
        return sum;
    }
    /*Prepare a method that will return all the Accounts for which at least a closed Won Opportunity is
present. Make it dynamic if we want to bring account for other opportunity stageNames.
a. Example
INPUTS OUTPUTS
stageName=’New’ List of accounts where at least one
opportunity stageName is ‘NEW’
stageName=’Closed Won’ List of accounts where at least one
opportunity stageName is ‘Closed Won’ */    
    public static List<Account> AccountWonOpp(string stageName){
        List<Account> accList = [select id, name from account where id in (select Accountid from opportunity where stageName = : stageName)];
        return accList;
    }

/*OPTIONAL
2. Updeeecnh fd  cpippso sf eldTone op 10 otportpeiriittAsO"TciuntsId  ew contatopeP0eoppnrttaicnas.
Plt’s morkisprly“*/
    public static void update10Top() {
        List<Opportunity> oppList = [select id,name from Opportunity where amount >0  order by amount desc LIMIT 10];
        for (opportunity eachOpp : oppList) {
            eachOpp.Description = 'This is one of the top 10 opportunities,Please work on this properly';
        }
        update oppList;
    }

/*3.
Write a logic to create and return the number of opportunities for a particular AccountId.
AccountId and n will be passed as parameters in the method.
Populate opportunity fields as follows:
Close date as 3 years from today
Stage name as Prospecting
Opportunity amount as Account’s annual revenue divided by n
and Opportunity name same as Account name
For Ex: if n=2, Then two new opportunities If n=0, Print the message as “Please tell us how many
opportunities needs to be created”*/

    public static List<Opportunity> oppCheck(integer n, Id accId) {
        Account accLimit1 = [select id, name, AnnualRevenue from Account WHERE id = : accId];
        for(Integer i =0 ; i < n ; i++ ){
            Opportunity opp1 = new Opportunity();
            opp1.StageName =''

        }
}