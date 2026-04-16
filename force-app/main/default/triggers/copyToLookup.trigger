trigger copyToLookup on Student__c (after insert, After update) 
{
	if((Trigger.isInsert || Trigger.isUpdate ) && Trigger.isAfter)
    {
        for(Student__c stu : Trigger.New)
        {
            String refAccName= stu.Test_Account_Name__c;
            List<Account> accId=[select id from account where name=:stu.Test_Account_Name__c];
        }
    }
}