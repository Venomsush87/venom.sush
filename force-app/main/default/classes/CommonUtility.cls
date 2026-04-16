public class CommonUtility {
	
    String hm_id;
    
    public void insertHiringManagerRecord()
    {
        //Creating hiring manager object
        Hiring_Manager__c hm=new Hiring_Manager__c();
        
        //Assigining the values
        hm.Name = 'Ashwini Gawade';
        hm.Contact_Number__c='8923231293';
        hm.Email_ID__c='ss1510@gmail.com';
        hm.Location__c ='Belagavi';
        
        insert hm;

		if(hm.id!= null)
        {
            system.debug('The Hiring Manager record has been successfully inserted. Record ID is.... '+hm.id);
        }
        hm_id=hm.Id;
     }
    
    public void createNewPositionRecord()
    {
        //creating a object 
        Position__c pos = new Position__c();
        
        //Assigning the values
        pos.name ='TrackWise Digital Admin';
        pos.Close_Date__c= system.today().Adddays(26);
        pos.Open_Date__c= system.today();
        pos.HR_Email__c= 'kish@gmail.com';
        pos.Location__c='Kochi';
        pos.Number_of_Positions__c=14;
        pos.Passport_Required_del__c=true;
        pos.Position_Description__c='This position will be dynamic and challenging and we are looking for the right individual that can think on their feet and really embrace new challenges as they come along.';
        pos.Skills_Required__c='Work closely with Site NC lead for management for NC / CAPA process for SGTC & R&D test lab.';
    	pos.Position_Status__c='Opened';
        pos.Max_Pay__c=1200000;
        pos.RecordTypeId=schema.sobjecttype.position__c.getrecordtypeinfosbyname().get('IT Position Record Type').Getrecordtypeid();
        
        pos.Hiring_Manager__c=hm_id;
        
        insert pos;
        
        if(pos.id!=null)
        {
            system.debug('The position record has been successfully inserted. Record ID is....'+pos.Id);
        }
        
    }
    
    public void GetStringlength(String str)
    {
        system.debug('The length of the String is : '+str.length());
    }
    
}