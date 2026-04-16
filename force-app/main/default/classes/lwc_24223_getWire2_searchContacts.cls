public with sharing class lwc_24223_getWire2_searchContacts {
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> findContacts(String searchText) {
        String key='%'+searchText+'%';
        return [select Id, Name, Phone, Email from Contact where 
                FirstName like:key or LastName like:key limit 10];
    } 
}