Trigger candidateNotificationTrigger on Candidate__c(After Insert, After Update)
{
    /*if(Trigger.isinsert && Trigger.Isafter)
    {
        for(Candidate__c can : Trigger.New)
        {
            String emailSub='Congratulations, '+can.Name+' Your form has been submited successfully';
            MessagingUtility.sendEmailToCandidate(can, emailSub);
        }
        
    }
    //Update email
    if(Trigger.isupdate && Trigger.Isafter)
    {
        for(Candidate__c can : Trigger.New)
        {
            if(Trigger.OldMap.get(can.id).Candidature_Status__c != Trigger.NewMap.get(can.id).Candidature_Status__c)
            {
                String emailSub='Congratulations, '+can.Name+', your form has been updated successfully';
                MessagingUtility.sendEmailToCandidate(can, emailSub);
            }
        }
        
    } */
    
    if(Trigger.isAfter && (trigger.isInsert || Trigger.isUpdate))
  {
      for(Candidate__c can : Trigger.New )
      {
          if(can.Are_you_a_Veteran__c=='Yes'){ can.If_Veteran_Type__c='Appreciated'; }
          
          else if(can.Are_you_a_Veteran__c=='No') {can.If_Veteran_Type__c='NA';}
          
          else {can.If_Veteran_Type__c='Why bitch?? ' ;}
      }
  }
    
  
}