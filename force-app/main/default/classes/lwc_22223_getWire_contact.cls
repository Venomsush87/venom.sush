public with sharing class lwc_22223_getWire_contact {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getConList()
    {
        return [select Id,FirstName,LastName,Phone,Email from Contact limit 5];
    }

}