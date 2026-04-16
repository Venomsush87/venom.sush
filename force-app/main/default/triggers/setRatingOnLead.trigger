trigger setRatingOnLead on Lead (before insert, before update, after insert) {
    if((Trigger.isinsert || Trigger.isupdate) && Trigger.isbefore)
    {
        for(Lead ld : Trigger.New)
        {
            if(ld.LeadSource == 'Purchased List')
            {
                ld.Rating ='Warm';
            }
        }
}
//=====================================================

   if((Trigger.isinsert || Trigger.isupdate) && Trigger.isbefore)
    {
        for(Lead led : Trigger.New)
        {
            if(led.LeadSource == 'Web' || led.LeadSource == 'Other' )
            {
                if(led.Email == '' || led.Email == null )
                {
                    led.addError('Enter Email ID');
                }
            }        
        }
    }
    //============================================================
    if(Trigger.isinsert && Trigger.isafter)
    {
    	List<Lead> leads=Trigger.New;
        Lead_Trigger_Handler.createContact(leads);
    }
}