public class Practice {
    
    public static void demo123()
    {
        List<Integer> lstInput=new List<Integer>{2,1,2,4,3,1,5};

		List<Integer> lstAlreadyChecked=new List<Integer>();
		List<String> results=new List<String>();

		for(Integer inp:lstInput){
			Boolean flag=false;
		for(Integer check:lstAlreadyChecked){
			if(inp == check){
			flag=true;
		}
	}
	Integer count=0;
	if(flag==false){
		for(Integer j=0;j<lstInput.size();j++){
		if(inp==j){
			count=count+1;
		}
	}
	}
		String strResult=inp+'='+count;
        lstAlreadyChecked.add(inp);
        system.debug('lstAlreadyChecked'+lstAlreadyChecked);
        results.add(strResult);  
    }
        system.debug('OUTPUT'+results);
    }   
    
    public static void getcontacts(integer lmt , integer ofst)
    {
        string contacts_query='select id, name, phone, fax from contact where accountid!=null order by lastname asc limit : lmt offset : ofst';
        
        List<Contact> lstCon= Database.query(contacts_query);
        
        system.debug('The size of Contact List is : '+lstcon.size());
        
        if(! lstcon.isEmpty()){
            for(contact temp : lstcon)
            {
            	system.debug(temp);
            }
        }
        
    }
    
    public static void getContactBySearchText(string srchtxt)
    {
        if(srchtxt!=null && srchtxt!=''){
            string con = 'select id, name, email,phone, fax from contact ';
            if(pattern.matches('^[a-zA-Z0-9._|\\\\%#~`=?&/$^*!}{+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}$', srchtxt))
            {
                system.debug('The string is an email');
                con +='where email=:srchtxt';
            }
            else 
            {
                system.debug('The string is not an email');
                srchtxt+= '% ';
                con += 'where lastname like :srchtxt';
            }
            // Execute the query
           List<Contact> lstcons = database.query(con);
            
            if(! lstcons.isempty())
            {
                for(Contact printcons : lstcons)
                {
                    system.debug(printcons);
                }
            }
        }        
    }
        
    public static void getposrecord(String location){
        List<Position__c> lstPos=[Select id,name, HR_Email__c from Position__c where Location__c=: location];
        
        system.debug(lstpos.size());
        
        if(lstpos!=null){
            for(Position__c pos : lstpos){
                system.debug(pos);
                system.debug('================================');
            }
        }
    }
    
}