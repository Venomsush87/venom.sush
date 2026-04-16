trigger preventDuplicatePositionRecord on Position__c (before insert, before update) 
{
        if(Trigger.isbefore && (Trigger.isinsert || Trigger.isupdate))
        {
            for(Position__c pos : Trigger.New)
            {
                integer recordCount = [select count() from position__c where name =: pos.Name];
                if(recordCount>0)
                {
                    pos.adderror('We cannot create a Position record as already a Position record exists with "'+pos.Name+'" name');
                }
            }
        }
}