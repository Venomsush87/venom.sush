public class Account_Trigger_Handler {
    //method to create opp uopn creation of account with rating as 'Hot'
    public static void createOpp(List<Account> accounts){
        //Create a list of opportunities
        List<Opportunity> optyList=new List<Opportunity>();
        //iterate every account from the list
        for(Account a: accounts)
        {
            //putting the condition
            if(a.Rating=='Hot')
            {
                Opportunity op=new Opportunity();
                op.Name=a.Name;
                op.StageName='Prospecting';
                op.CloseDate=System.today()+15;
                op.AccountId=a.id;
                optyList.add(op);
            }
        }
        //insert the opp list for the corresponding account
        insert optyList;
    }
    
}