public class Acc_Event1 {
	@AuraEnabled
    public static Id mySearch(String phone){
        Contact con=[select id, accountId from contact where phone=:phone];
        return con.accountId;
    }
    
   @AuraEnabled
    public static String conCreate(String lastname, String firstname, ID accountId)
    {
        String status;
        try{
            Contact con=new Contact();
            con.lastname=lastname;
            con.FirstName=firstname;
            con.AccountId=accountId;
            insert con;
            status='Record Created';
        }
            catch(Exception e){
                status='DML Failed';
            }
        return status;
    }
    
    
}