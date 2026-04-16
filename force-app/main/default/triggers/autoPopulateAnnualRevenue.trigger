trigger autoPopulateAnnualRevenue on Account (before insert, before update, before delete) {
    if(Trigger.isbefore && (Trigger.isupdate || Trigger.isInsert ))
    {
        for(Account acc : Trigger.New)
        {
            if(acc.AnnualRevenue==null)
            {
                if(acc.Industry=='Banking'){acc.AnnualRevenue=1000000;}
                else if(acc.Industry=='Finance'){acc.AnnualRevenue=900000;}
                else if(acc.Industry=='Healthcare'){acc.AnnualRevenue=800000;}
                else if(acc.Industry=='Insurance'){acc.AnnualRevenue=700000;}
                else if(acc.Industry=='Manufacturing'){acc.AnnualRevenue=600000;}
            }
        }
    }
    
    //Not delete the account if linked with 
    if(Trigger.isbefore && Trigger.isdelete)
    {
        for(Account acc : Trigger.Old)
        {
            integer countContacts = [select count() from Contact where accountid=: acc.Id];
            if(countcontacts>0)
            {
                acc.adderror('The account cannot be deleted as it is associated with few Contact(s)');
            }
        }
    }
    
    if(Trigger.isbefore && Trigger.isdelete)
    {
        for(Account acc : Trigger.old)
        {
            if(acc.Active__c == 'Yes')
            {
                acc.adderror('You are not authorized to delete an active account record.');
            }
        }    
    }
}