trigger createCon_Acc on Account (after insert) {
    if(Trigger.isInsert && Trigger.isafter  )
    {
        for(Account acc : trigger.new)
        {
            List<Contact> lstCon=new List<Contact>();
            if(acc.Id != null || acc.Id != '')
            {
               Contact con =new Contact();
               con.LastName=acc.Name; 
               con.Phone=acc.Phone;
               con.AccountId=acc.Id;
               lstCon.add(con);                
            }
            insert lstCon;
        }
        
    }
    if(Trigger.isInsert && Trigger.isafter)
    {
        List<Account> accounts=Trigger.New; //list of new accounts which are saved to account
        Account_Trigger_Handler.createOpp(accounts);
    }
}