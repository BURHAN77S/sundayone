/**
* 1. Create an apex class and name it is - ContactManager
* 2. GET – Write a webservice to get contact details if we provide contact id in the URI. Return FirstName, LastName, Title, Email, Department
* 3. POST – Write a webservice which accepts FirstName, LastName, Title, Email, Department as request body and create a record in the system.
* 4. DELETE – Write a webservice to delete the asked contact. We will receive contact id in the URI
* 5. PUT – Write a webservice to upsert the contact record detail - FirstName, LastName, Title, Email, Department
* 6. PATCH – Write a webservice to update the given contact detail
 */

@RestResource(urlMapping='/Con/*')
global with sharing class ContactManager {
    @httpGet
    global static Contact getContact() {
        RestRequest Request = RestContext.Request;
        String uri = Request.requestURI;
        id conId = uri.substringAfterLast('/');
        Contact con = [Select Id, firstName, LastName, Title, Email, Department from Contact where Id =: conId with security_enforced];
        return con;
    }

    @httpPost
    global static Contact createContact(String firstname, String lastname, String title, String email, String department) {
        Contact Con = new Contact();
        Con.firstName = firstname;
        Con.LastName = lastname;
        Con.Title = title;
        Con.Email = email;
        Con.Department = department;
        insert Con;
        return Con;
    }

    @HttpDelete
    global static String deleteContact(){
        Id conId = RestContext.Request.requestURI.substringAfterLast('/');
        Contact Con = [select id from Contact where id =: conId];
        delete Con;
        System.debug(conId+' Contact başarıyla silindi.');
        return 'Contact başariyla silindi!';
    }

    @HttpPut
    global static Contact upsertContact(String id, String firstname, String lastname, String title, String email, String department){
        Contact Con = new Contact();
        Con.Id = Id;
        Con.firstName = firstname;
        Con.LastName = lastname;
        Con.Title = title;
        Con.Email = email;
        Con.Department = department;
        upsert Con;
        return Con;
    }

    @HttpPatch
    global static Contact updateContact(){
        RestRequest Request = RestContext.Request;
        System.debug(Request.requestBody);
        String jsonString = Request.requestBody.toString();
        System.debug(Request.requestBody.toString());
        Contact Con = (Contact)JSON.deserialize(jsonString, Contact.class);
        update Con;
        Contact conNew = [Select Id, firstName, LastName, Title, Email, Department from Contact where Id =: Con.Id];
        return conNew;
    }
}
