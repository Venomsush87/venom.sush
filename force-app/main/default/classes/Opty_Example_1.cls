public class Opty_Example_1 {
@AuraEnabled
    public static List<Opportunity> myData(String stage)
    {
        
        return [select Name,StageName,CloseDate,Amount from Opportunity where stageName=:stage limit 5];
    }
}