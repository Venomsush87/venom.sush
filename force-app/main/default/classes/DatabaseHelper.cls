public class DatabaseHelper {
    
    //Inserting the contacts using Database.Insert() class.......
    public void InsertNewContacts()
    {
        //creating a list to store 100 records
        List<Contact> lstcon = new List<Contact>();
                
        for(integer counter=1; counter<=100; counter++)
        {
            Contact con = new contact();
            
            con.FirstName = 'Database';
            con.LastName = 'Insert - '+counter;
            con.Title = 'Vice President';
            con.Email = 'dbcontact'+counter+'@gmail.com';
            
            if(counter != 97)
            {
                con.PAN_Number__c='KNP0012J'+Counter;
        	}
            con.Phone='82930323002';
            con.Birthdate=Date.newInstance(1998, 10, 13);
            con.Fax='09423094032403';
            con.Department='IT';
            con.MobilePhone = '999923888';
            
            lstcon.Add(con);
        }
        
        //Insert records to the object
        if(! lstcon.isempty())
        {
         Database.SaveResult[] results =  Database.insert(lstcon, False);
            
            //Get the result of each record
            if(! results.isempty())
            {
                for(Database.SaveResult res : results) 
                {
                    if(res.isSuccess())  //Operation successfull
                    {
                        system.debug('The record has been inserted successfully : '+res.id);
                    }
                    else
                    {
                        for(Database.Error err : res.getErrors()) //Operation failed
                        {
                            system.debug('The error message is : '+ err.getMessage());
                            system.debug('The status code is :'+err.getStatusCode());
                            system.debug('Affected fields are : '+ err.getFields());
                            
                        }
                    }
                }
            }
        }
    }
    
    public void getAllUnassociatedContacts(string accName)
    {
       List<Contact> lstContacts = [select id, firstname, lastname, email from contact where accountid =: null];
    }
        
    public void deactivateAccountRecord(string userID)
    {
        User userToDeactivate = [select id, username, isactive from User where username =: userID and isactive = false];
        
        if(userToDeactivate != null)
        {
            userToDeactivate.IsActive = true;
            update userToDeactivate;
        }
        
    }
    
    public void deleteHR_ManagerRecords(string searchString)
    {
        if(searchString != null && searchString != '')
        {
            searchString += '%';
            List<Hiring_Manager__c> lsthm = [select id, name from Hiring_Manager__c where name like : searchString];
            
            if(! lsthm.isempty())
            {
                Delete lsthm;
            }
        }
    }
    
	public void insertBulkHR_ManagerRecords(Integer noOfRecords)
    {
        List<Hiring_Manager__c> lsthm = new List<Hiring_Manager__c>();
        
        for(integer counter= 1; counter <=noOfRecords; counter++)
        	{
                Hiring_Manager__c obj = new Hiring_Manager__c();
                
        		obj.Name = 'Recruiter - '+ counter;
                obj.Contact_Number__c= '+91 8147418'+counter;
                obj.Location__c = 'Chennai';
                obj.Email_ID__c = 'bulkrecords'+counter+'@gmail.com';
                
                
                lsthm.Add(obj);
            }
         if(! lsthm.Isempty())
            {
               insert lsthm;
               
            }
    }
        
    public void insertContact()
    {
        Contact con = new contact();
        
        con.firstname = 'Gurav';
        con.LastName = 'Namdev';
        con.Title = 'Sales Manager';
        con.Birthdate = Date.newInstance(2001, 11, 14);
        con.Phone = '8202920289';
        con.Fax = '12829128921';
        con.Email = 'dbhelper@gmail.com';
        con.PAN_Number__c = 'GSH2929JJ';
        con.Department = 'Development';
        
        insert con;
        
        if(con.id != null)
        {
            system.debug('The record has been inserted successfully' + con.Id);
        }
        
    }
    
}