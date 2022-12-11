/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-11-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

/*1. Write a logic to create N number of Accounts, and return all the accounts created.
Populate - Account Name, Rating, Phone, Shipping Address, and Billing Address.
Example - parameter -> 5. Method returns 5 newly created accounts.
a. Call this method from anonymous apex file*/

public class DummyDataCreation {
    public static list<account> accountCreationMethod(Integer n) {
        list<account> accList = new list<account>();
        if(n > 0 && n < 150 ) {
            for (Integer i = 1; i<=n; i++ ){
                account acc= new account();
                acc.name = 'Acc Name '+ i;
                acc.rating = 'Hot';
                acc.phone = '132154';
                acc.ShippingStreet = '172 Bares Run Dr';
                acc.ShippingCity = 'Loveland';
                acc.ShippingState = 'OH';
                acc.ShippingCountry = 'USA';
                acc.ShippingPostalCode = '45140';
                acc.BillingStreet = '172 Bares Run Dr';
                acc.BillingCity = 'Loveland';
                acc.BillingState = 'OH';
                acc.BillingCountry = 'USA';
                acc.BillingPostalCode = '45140';
                accList.add(acc);
            }
            insert accList;
        }
        return accList;
    }

    /*2. Write a logic to create N number of Contacts for each account (pass List of account in
    parameter), and return all Contacts created.
    Populate - contact first name, last name, accountid, phone, mailing address, other address.
    Example - parameters - (3, listAcc). Method creates 3 contacts for each account passed in list.
    a. Call this method from anonymous file, pass the list of account returned from (1.a)*/

    public static list<contact> contactCreationMethod(integer n, list<account> listAcc){
        list<contact> conList = new list<contact>();
        if(n > 0 && n < 150) {
            for(account eachAcc : listAcc){
                for(integer i = 1; i<=n; i++){
                    contact con = new contact();
                    con.FirstName = 'Con Name ' +i;
                    con.LastName = 'Con LastName ';
                    con.AccountId = eachAcc.Id;
                    con.Phone = '315461221';
                    con.MailingStreet = '172 Bares Run Drive';
                    con.MailingCity = 'Loveland';
                    con.MailingState = 'Ohio';
                    con.MailingCountry='Usa';
                    con.MailingPostalCode='45140';
                    conList.add(con);
                }
            }
            insert conList;
        }
        return conList;
    }
}