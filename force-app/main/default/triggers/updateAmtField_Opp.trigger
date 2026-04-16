trigger updateAmtField_Opp on Opportunity (after insert, after update, before insert, before update) {  
    /*if(Trigger.isupdate && Trigger.isafter)
    {
        List<Account> accList = new List<Account>();
        Set<Id> acctSet = new Set<ID>();
        
        for(Opportunity opp : Trigger.new)
        {
            acctSet.add(opp.AccountId);
        }
        Map<Id, Account> mapAccounts = new Map<Id, Account>([SELECT Id FROM Account where Id IN :acctSet]);
        for(Opportunity opp : Trigger.new)
        {
            Account acc = mapAccounts.get(opp.AccountId);
            acc.Description = opp.Description;
            accList.add(acc);
        }
        Update accList;
        
          
    }
    //================================================================================
    
    if(Trigger.isupdate && Trigger.isinsert)
    {
        for(Opportunity opp : Trigger.New)
        {
            if( opp.CloseDate <= System.today()+14 && opp.Type=='New Customer')
            {
                opp.StageName = 'Prospecting';
            }
        }
    }
    //================================================================================
    if((Trigger.isinsert || Trigger.isupdate) && Trigger.isafter)
    {
        List<Opportunity> optyList=Trigger.new;
        Opp_Trigger_Handler.recordSharing(optyList);
    }*/
    //================================================================================

              if((Trigger.isinsert || Trigger.isupdate) && Trigger.isafter){
                  List<Opportunity> lstopps=Trigger.New;
        updateAccountRating.updaterecords(lstopps);
    }
}