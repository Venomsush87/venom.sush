public class AuraEnab_2 {
	@AuraEnabled
    public static List<Account> getData()
    {
        List<Account> accounts=[Select industry,Name,Phone from Account limit 7 ];
        return accounts;
    }
}