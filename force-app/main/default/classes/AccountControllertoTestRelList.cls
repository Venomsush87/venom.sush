public class AccountControllertoTestRelList {
 
    @AuraEnabled(cacheable=true)
    public static List < Account > fetchAccounts() {

        return [
            SELECT Id, Name, Industry
            FROM Account LIMIT 5
        ];
        
    }
  
}