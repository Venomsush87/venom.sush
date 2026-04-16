trigger validateContactTrigger2 on Contact (before insert, Before update) {
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate) )
    {
        for(Contact con : Trigger.New)
        {
            if(con.PAN_Number__c==null || con.PAN_Number__c=='')
            {
                con.PAN_Number__c.adderror('Enter the Pan ID');
            }
        }
    }
}