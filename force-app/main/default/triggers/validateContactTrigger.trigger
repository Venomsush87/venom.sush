trigger validateContactTrigger on Contact (before insert, before update, after update, after insert, after delete) 
{
    if((Trigger.isInsert || Trigger.isUpdate || Trigger.isDelete) && Trigger.isAfter){
        Id accId;
        for(Contact c : Trigger.New){
            accId=c.AccountId;
        }
        Integer getCount=[SELECT Count() from Contact where accountId=: accId];
        Account acc=[Select id,Count__c from Account where Id=:accId];
        acc.SLASerialNumber__c=String.Valueof(getCount);
        Update acc;
    }
    if(Trigger.isDelete && Trigger.isAfter){
        Id accId;
        for(Contact c : Trigger.Old){
            accId=c.AccountId;
        }
        Integer getCount=[SELECT Count() from Contact where accountId=: accId];
        Account acc=[Select id,Count__c from Account where Id=:accId];
        acc.SLASerialNumber__c=String.Valueof(getCount);
        Update acc;
    }
    
    //=======================================
    /*
    if(Trigger.isBefore && Trigger.isInsert)
    {
        for(Contact con : Trigger.New )
        {
            if(Con.Phone == null || con.phone =='')
            {
                con.phone.adderror('Please enter the Phone');
            }
            else if(con.Email==null || con.Email=='')
            {   
                con.Email.Adderror('Please enter the Email');
            }
        }
    }
        
    if(Trigger.isBefore && Trigger.isUpdate)
    {
        for(Contact con : Trigger.New )
        {
            if(Con.Phone == null || con.phone =='')
            {
                con.phone.adderror('Please enter the Phone');
            }
            else if(con.Email==null || con.Email=='')
            {   
                con.Email.Adderror('Please enter the Email');
            }
        }
    }
    
    if(Trigger.isBefore && Trigger.isupdate)
    {
    if(!checkRecursive.firstcall) {
       checkRecursive.firstcall = true;
       Id conId;
       for(contact c:trigger.new){
           conId=c.Id;
       }
       Contact con=[select id, name from contact where id!=:conId limit 1];
       con.Email ='test@gmail.com';
       Update con;
}
    }
*/
    //=======================================
    /*if(Trigger.isBefore && (Trigger.isupdate || Trigger.isinsert))
    {
        Set<Id> accountIds = new Set<Id>();
  for(Contact record: Trigger.new) {
    accountIds.add(record.AccountId);
  }
  accountIds.remove(null);
  Set<Id> morethan2Contacts = new Map<Id, AggregateResult>([SELECT AccountId Id FROM Contact WHERE AccountId = :accountIds
                                                            GROUP BY AccountId HAVING COUNT(Id) > 2]).keySet();
  for(Contact record: Trigger.new) {
    if(moreThan2Contacts.contains(record.AccountId)) {
      record.AccountId.addError('You may not have more than 2 contacts per account.');
    }
  }
    }*/
}