public class auraEnabled_1 {
  @AuraEnabled   
   public static List<Account> getData(){   
       return [select id,name,Phone, industry from account limit 3];
   }    
}