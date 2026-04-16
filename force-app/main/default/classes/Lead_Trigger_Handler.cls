public class Lead_Trigger_Handler {
    public static void createContact(List<Lead> leads){
        List<Contact> contacts=new List<Contact>();
        for(Lead ld: leads){
            if(ld.Id!=null || ld.Id!='' )
            {
                Contact c=new Contact();    
                c.FirstName=ld.FirstName;
                c.LastName=ld.LastName;
                c.Phone=ld.Phone;
                c.Email=ld.Email;
                contacts.add(c);
            }
        }
        insert contacts;
    }
}