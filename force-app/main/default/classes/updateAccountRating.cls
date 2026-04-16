public class updateAccountRating {
	public static void updaterecords(List<Opportunity> lstopps){
		Set<ID> ids=new Set<ID>();
        for(Opportunity opp : lstopps){
            ids.add(opp.accountid);
        }
		
		List<Account> lstacc=[select id,rating,(select id,stagename from Opportunities) from Account where id=:ids];
		
            
		for(Account acc : lstacc){
            system.debug('inside 1st for loop');
			for(Opportunity opp : acc.opportunities){
				if(opp.stagename=='Closed Won'){
					acc.rating='Hot';
                    system.debug('inside 2nd for loop');  
				}
			}
		}
		update lstacc;
	}
}