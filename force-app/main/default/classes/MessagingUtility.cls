public class MessagingUtility 
{
    /*public static void sendEmailToCandidate(Candidate__c cnd, String emailSubject)
    {
        if(cnd != null)
        {
            Messaging.SingleEmailMessage email=new Messaging.SingleEmailMessage();

            String[] setAddress= new String[]{cnd.Email_ID__c,'sns131094@gmail.com'};
            email.setToAddresses(setAddress);

            String[] ccaddress=new String[]{'sushantsaunkhe87@gmail.com'};
            email.setccaddresses(ccaddress);

            String[] bccaddress=new String[]{'shanu.akshata@gmail.com'};
            email.setbccaddresses(bccaddress);

            email.setreplyto('salunkhen203@gmail.com');

            email.SetSenderdisplayName('Accenture Recruitment Team');

            email.setsubject(emailSubject);
            
            String emailBody='Dear '+cnd.Name+', Thanks for showing interest in our organizations open positions.'+
            ' Your candidature has been submitted succesfully for the '+cnd.Position_Name__c+' position';
            
           // email.Setplaintextbody(emailBody);

            String htmlemailBody='Dear '+cnd.Name+',<br/><br/>'+
            'Thanks for showing interest in our organizations open positions.<br/><br/>'+
            'Your candidature has been submitted succesfully for the '+cnd.Position_Name__c+' position. Below are the details :<br/>'+
            '<br/>Candidate ID       :'+Cnd.Candidate_ID__c+
            '<br/>Candidate Name     :'+ Cnd.Name+
            '<br/>Phone              :'+cnd.Contact_Number__c+
            '<br/>Location           :'+cnd.Location__c+'<br/>'+
            '<br/><br/>Regards,<br/>'+
            'Talent Aquisition Team,<br/> Accenture Inc';
                        
            email.Sethtmlbody(htmlemailBody);

            Messaging.SendEmail(new Messaging.SingleEmailMessage[] {email});
        }

    }*/
    
    public static void sendEmailToMass()
    {
        Map<id,contact> mapContactsToSend=new Map<id,contact>([select id,firstname,lastname,email,PAN_Number__c 
                                                               from contact where email!= null and PAN_Number__c!= null]);
        if(! mapContactsToSend.isEmpty())
        {
            Messaging.MassEmailMessage massEmail=new Messaging.MassEmailMessage();
            Messaging.reserveSingleEmailCapacity(2);
            
            List<ID> contactIDs=new List<ID>();
            contactIDs.addall(mapContactsToSend.keyset());
            
            massEmail.setTargetObjectIds(contactIDs);
            
            EmailTemplate emailTemp=[select id,name from EmailTemplate where name='ApexMassEmail_Contact_UpdatePAN' limit 1];
            if(emailtemp!=null)
            {
                massEmail.setTemplateId(emailTemp.id);
                
                Messaging.sendEmail(new Messaging.MassEmailMessage[] {massEmail});
            }          
        }
    }
}