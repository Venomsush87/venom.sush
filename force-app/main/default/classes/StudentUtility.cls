public class StudentUtility {
	public integer studentid;
    public string studentName, address; 
    public boolean isactive;
    public decimal feeAmount;
    
    public void assignValues()
    {
        studentID=10001;
    	studentName='Akash Singh';
    	address ='Kalyan Nagar, Hubli';
        isactive = true;
        feeAmount = 17203;	
    }
    
    public void showStudentDetails()
    {
        system.debug('Student ID : ' + studentid);
        system.debug('Student Name : ' + studentName);
        system.debug('Student Address : ' + address);
        system.debug('Student isActive : ' + isactive);
        system.debug('Student Fee Amount : ' + feeAmount);
    }
    
}