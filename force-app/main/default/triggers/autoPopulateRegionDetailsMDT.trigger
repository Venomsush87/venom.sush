trigger autoPopulateRegionDetailsMDT on Customer__c (before insert, Before Update) 
{
	if(Trigger.isbefore && (Trigger.isinsert || Trigger.isupdate))
    {
        for(Customer__c cust : Trigger.New)
        {
            
        }
    }
    
}