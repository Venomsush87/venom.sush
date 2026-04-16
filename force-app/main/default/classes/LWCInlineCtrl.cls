public class LWCInlineCtrl {
    @AuraEnabled(Cacheable = true)
    public static List<Contact> getContacts() {
        return [SELECT Id, Name, FirstName, LastName, Phone, Email 
                FROM Contact 
                WHERE Email != null
                AND Phone != null
                ORDER BY CreatedDate limit 20];
    }
}