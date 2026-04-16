public class Schedulable_Ex_Lead_Msg implements Schedulable{ 
        public void execute(SchedulableContext sc){ 
            List<Lead> leads=[select id, email from lead where createdDate=THIS_WEEK]; 
            List<String> emails =new List<String>(); 
            for (Lead l:leads) { 
                emails.add(l.email);
            }
                    
            Messaging.SingleEmailMessage msg =new Messaging.SingleEmailMessage(); 
            msg.setToAddresses (emails);
            msg.setSubject('Test Mail');
            String body='Dear Customer<br/> Update your contact details <br/>Thanks<br/>'; 
            body=body+ 'Sales Team'; 
            msg.setHtmlBody (body); 
            Messaging.Email[] mymails =new Messaging.Email[]{msg}; 
            Messaging.sendEmail (mymails);
}
    }