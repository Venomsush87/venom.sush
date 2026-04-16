trigger uniqueEmail on Candidate__c (before insert, before update) 
{
   if(Trigger.isBefore && (Trigger.isupdate || Trigger.isInsert))
    {
        for(Candidate__c can : trigger.new)
        {
            List<Candidate__c> lstCan=[select id,name from Candidate__c where Email_ID__c =: can.Email_ID__c]; 
            if(lstCan.size()>0)
            {
                can.Email_ID__c.adderror('The email already exists in the system ');
            }
        }
    }
}