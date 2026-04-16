public with sharing class refreshContactController {
    @AuraEnabled(cacheable=true)
    public static List<contact> getContactList() {
        return [select Id,FirstName,LastName,Email from Contact limit 10];
    }
}