public class CommonHelper
{
    public void BulkinsertHiringManager(Integer noOfRcords)
    {
       List<Hiring_Manager__c> lstManagers= new List<Hiring_Manager__c>();  	//List for Hiring Manager
       
        if(noOfRcords > 0 && noOfRcords !=null)
        {
            for(integer i=1;i<=noOfRcords; i++)
            {
                Hiring_Manager__c hm=new Hiring_Manager__c();	//object hiring manager 
                
                hm.Name='Recruiter'+i;
                hm.Contact_Number__c='9876543'+i;
                hm.Email_ID__c='test'+i+'@gmail.com';  
                
                lstManagers.add(hm);
            }    
            
        }
        system.debug(lstManagers.size());
        
        if(! lstManagers.isEmpty())
        {
            insert lstManagers;
            for(Hiring_manager__c hm : lstManagers)
            {
                system.debug(hm);
            }
        }
    }
   
    public void getContactAndAssociatedParentDetails(string contactlastname)
    {
        string contacts = 'select id, firstname, lastname, email, phone, fax, account.name, account.industry, account.rating, account.active__c, account.owner.firstname, account.owner.lastname, account.owner.email from contact where lastname =: contactlastname';
    	List<Contact> lstcontacts = Database.query(contacts);
        
        if(! lstcontacts.isempty())
        {
            for(Contact temp : lstcontacts)
            {
                system.debug('The record details are : '+temp);
                system.debug('The Parent details are : '+ temp.Account);
                system.debug('The Parent details are : '+ temp.Account.owner);
            }
        }
        
        
    }
    
    public void getaccountRecordsUsingID()
    {
        List<Account> accRecords = [select id, name, industry from account where industry in ('Finance')];
        system.debug('The count of records is : '+ accrecords.size());
        for(Account temp : accrecords)
        {
        	system.debug(temp.id);
            system.debug(temp.name);
            system.debug(temp.Industry);
            system.debug('------------------------------------------------------');
        }
    }
    
    public void getCountPerIndustry()
    {
   		AggregateResult[] countAcc=[select industry, count(id) from account group by industry];
        
        if(! countAcc.isEmpty())
        {
            for(AggregateResult agg : countAcc)
            {
                system.debug(agg);
            }
            
        }
        
    }
    
    public void getCountofAccounts()
    {
    	// Static Method
    	integer accCount = [select count() from account];
        system.debug('The count of acc records is :' + accCount );
        
        //Dynamic Method
        string count = 'select count() from contact';
        integer temp = Database.countQuery(count);
        system.debug('The count of contacts is : '+temp);
        
    }
        
    public void getUnassociatedContacts()
    {
        string contactsQuery = 'Select id, firstname, lastname, email, phone, fax from contacts where accountid = null order by lastname asc';
        
        List<Contact> lstcontacts= Database.query(contactsQuery);
        
        system.debug('The collection size is : '+ lstcontacts.size());
        
        if(! lstcontacts.isempty())
        {
            for(Contact temp : lstcontacts)
            {
                system.debug('The record details are : '+ temp);
            }
        }
    }
    
    public void getcontactsbysearchtext(string searchtext)
    {
        if(searchtext != null && searchtext != '')
        {
            string contactsquery = 'select id, firstname, lastname, email, phone, fax from contact';
            
            if(Pattern.matches('[a-zA-Z0-9._-]+@[a-zA-Z]+.[a-zA-Z]{2,4}', searchtext))
            {
                system.debug('The search text is in email format...');
            }
            else
            {
                system.debug('The search text is in string format...');
            }
        }
        
        
    }
    
    public void getPositionRecordsDynamically(string city)
    {
        List<Position__c> lstpos=[select id, name, Location__c from Position__c where Location__c =: city];
        
        system.debug('The count seems to be : '+lstpos.size());
        
        if(! lstpos.isempty())
        {
            for(Position__c pos : lstpos)
            {
                system.debug('position record is : '+pos);
            }
        }
        
    }
    
    public void getAllClassRecords()
    {
        Map<id, Class__c> mapClass=new Map<id, Class__c>(); // defining the map
        
		List<Class__c> lstClass=[select ID,name,Teacher__c,CurrencyIsoCode from Class__c];//defining the list
        //copying class records to map
        if(! lstClass.isEmpty())
        {
            for(Class__c clas : lstclass)
            {
                Mapclass.put(clas.id, clas);
            }
        }
        
        
            }       
            
	public void getAllCandidateRecords()
	{
        map<id, Candidate__c> mapcandidates = new map<id, Candidate__c>();
        List<Candidate__c> lstcandidate=[select id, Name, Candidate_ID__c, Contact_Number__c, 
                                         Current_CTC__c, Expected_CTC__c, Email_ID__c, Location__c from Candidate__c];
        
        system.debug('The count of Candidates is : '+ lstcandidate.size());
        
        if(! lstcandidate.isEmpty())
        {
            for(Candidate__c temp : lstcandidate)
            {
                mapcandidates.put(temp.id, temp);
                system.debug('Record ID ' + temp.id);
                system.debug('Record Name : '+temp.name);
                system.debug('Record Candidate ID : '+temp.candidate_id__c);
                system.debug('Record Contact : '+temp.contact_number__c);
                system.debug('Current CTC : '+temp.current_CTC__c);
                system.debug('Expected CTC : '+temp.Expected_CTC__C);
                system.debug('Email : '+temp.Email_ID__c);
                system.debug('Location : '+temp.Location__c);
                system.debug('------------------------------------------------------------------------------');
            }
        } 
    }
    
    public void GetAllLeadRecords()
    {
        List<Lead> lstLeads=[select id, firstname, Lastname, Rating, ProductInterest__c, Status, Industry, Phone, Email from Lead];
        
        system.debug('The Lead collection size is : '+ lstleads.size());
        
        if(! lstleads.isempty())
        {
            for(Lead leadsList : lstleads)
            {
                system.debug('The Lead records are : '+ leadslist);
            }
        }
    }
    
    public void GetAllHiringManagers()
    {
    	List<Hiring_Manager__c> hm = [select id, name, Contact_Number__c, Email_ID__c, Location__c from Hiring_Manager__c];
        
        system.debug('The size of Hiring Manager collection is : '+ hm.size());
        
        if(! hm.isEmpty())
        {
           for(Hiring_Manager__c hmc : hm)
           {
               system.debug('The records in Hiring Manager object are : '+ hmc);
           }
        }
        
    } 
    
    public void GetAllPositionRecords()
    {
        List<Position__c> pos= [select id, Name, Candidates_Count__c, Close_Date__c, Open_Date__c, Location__c, 
                                Passport_Required_del__c, Travel_Required__c from Position__c];
    	
    	System.debug('The number of records in Position Obj : '+ pos.size());
        
        if(! pos.isempty())
        {
            for(Position__c temp : pos)
            {
                system.debug('The Position Details are : '+temp);
            }
        }
    
    }
    
    public void getAccountsByStartingchar(String startingchar)
    {
        if(startingchar !=null && startingchar !='')
        {
            startingchar+='%';
            List<Account> lstaccs=[Select Id,name,phone from account where name like : startingchar];
            
            if(! lstaccs.isEmpty())
            {
                for(Account acc : lstaccs)
                {
                    system.debug('Account record is : '+acc);
                }
            }
        }     
    }
    
    public void getContactsByAccountName(String accountName)
    {
        if(accountName != null && accountName!='')
        {
    		List<Account> lstacc=[select id, Name, Industry from Account where Name =: accountName];
        
       	 	Id lstAccId= lstacc.get(0).id;
        
        	List<Contact> lstCon=[Select id,Name,Phone,Email from Contact where Accountid =: lstAccId];
        
        	for(Contact con : lstCon)
       	 	{
            	system.debug(con);
        	}
    	}
    }
    
    public void getPositionByStatus(String status)
    {
        if(status!='' && status !=null)
        {
        	String PosQuery='select id, name,Location__c, position_status__c from Position__C where position_status__c =: status';
        	
            List<Position__c> lstpos=Database.query(PosQuery); 
                
            system.debug(lstPos.size());
            
            if(! lstPos.isEmpty())
            {
                for(Position__c pos : lstPos)
                {
                    system.debug(pos);
                }
            }
            
        }    
    }
	   
    public void getContactsAndOppFromAcc()
    {
        List<Account> lstAcc= [select id,name, 
                              (select id,phone from contacts),
                              (select id,name from opportunities) 
                              from account where name = 'Burlington Textiles Corp of America'];
    	
        system.debug(lstAcc);
        system.debug(lstAcc.size());
    }
 	
    
}