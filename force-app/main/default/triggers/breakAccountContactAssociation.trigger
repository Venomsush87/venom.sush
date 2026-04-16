trigger breakAccountContactAssociation on Account (before delete) 
{
	if(Trigger.isdelete && Trigger.isbefore)
    {
        List<Contact> lstAccountIds = [select accountid from contact where accountid In : Trigger.OldMap.KeySet()];
        
        if(! lstAccountIds.isEmpty())
        {
            for(Contact con : lstAccountIds)
            {
   				con.AccountId = null;
            }
            update lstAccountIds;
        }
    }   
}