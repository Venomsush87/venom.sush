public class Opp_Trigger_Handler {
    public static void recordSharing(List<Opportunity> optyList) {
        //Create a list of OpportunityShare sObject to be shared with manager
        List<OpportunityShare> share=new List<OpportunityShare>();
        //iterate one by one record from optyList
        for(Opportunity op:optyList)
        {
            //check the condition
            if(op.StageName=='Closed Won')
            {
                OpportunityShare os=new OpportunityShare();
                os.Opportunityid=op.id;
                os.UserorGroupid=op.manager__c;
                os.OpportunityAccessLevel='Read';
                os.RowCause='Manual';
                share.add(os);
            }
        }
        insert share;

    }
}