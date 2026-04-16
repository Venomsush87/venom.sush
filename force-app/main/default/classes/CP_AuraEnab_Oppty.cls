public class CP_AuraEnab_Oppty {
	@AuraEnabled
    public static List<Opportunity> myData(String stage)
    {
        List<Opportunity> opty=[select Name, StageName,CloseDate,Amount from Opportunity where StageName=:stage limit 5];
        return opty;
        
    }
}