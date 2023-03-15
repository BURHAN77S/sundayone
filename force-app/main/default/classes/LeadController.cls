public with sharing class LeadController {
    @AuraEnabled
    public static Lead[] getRecentLeads() {
        return [Select FirstName, LastName, Title, Company FROM lead WHERE Title != Null With SECURITY_ENFORCED ORDER By CreatedDate DESC limit 5];
    }
}