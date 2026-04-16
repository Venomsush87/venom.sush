public class SrchAcc_dataTable {
	@AuraEnabled
    public static List<Account> searchAcc(String industry)
    {
        List<Account> accounts=[Select Id,Name,Industry,Rating,Type from Account where Industry=:industry];
        return accounts;
    }
}