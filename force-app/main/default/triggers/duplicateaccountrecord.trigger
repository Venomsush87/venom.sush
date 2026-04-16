trigger duplicateaccountrecord on Account(before update, before insert, after insert, after update)
{
    if(Trigger.isBefore && (Trigger.isupdate || Trigger.isInsert))
    {
        for(Account acc : trigger.new)
        {
            Integer recordCount=[select count() from account where name =:acc.name];
            
            if(recordCount >1)
            {
                acc.addError('We cannot create a duplicate account as already a record exists with '+acc.Name+' name');                 
            }                   
        }
    }
    
    //Trigger to create a new opp upon creation of a new account
    if(Trigger.isafter && Trigger.isinsert)
    {
        List<Account> accounts=Trigger.new; //list of new accounts which are saved in account obj
        Account_Trigger_Handler.createOpp(accounts);
        
    }
}