public class Contact_Insert_Aura {
@AuraEnabled
    public static String create(Contact con){
        String status;
        try{
            insert con;
            status = 'Insert Successful';
        }        
        catch(Exception e){
            status='Insert Failed : '+e.getMessage();
        }
        
        return status;
        
    }
}