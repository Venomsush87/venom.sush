trigger preventActiveAccountDeletion on Account (before delete) 
{
        if(Trigger.isbefore && Trigger.isdelete)
    {
        for(Account acc : trigger.old)
        {
            if(acc.Active__c=='Yes')
            {
                acc.adderror('You are not authorized to Delete an active account record');
            }
        }
    }  
}