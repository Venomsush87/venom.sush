public with sharing class wireMethod_AccountsList_lwc1 {

        @AuraEnabled(cacheable=true)
        public static List<Account> getAccountList(){
           return [Select Id,Name,AnnualRevenue from Account limit 5];
        }

        @AuraEnabled(cacheable=true)
        public static List<Contact> getContactList(){
           return [Select Id,FirstName,LastName,Phone,Email from Contact where Email like '%com' limit 5];
        }
    
}