public class Schedulable_Example_Opp implements Schedulable{
    public void execute(SchedulableContext sc) {
        List<Opportunity> lstOpp=[Select id,StageName,CreatedDate,CloseDate from Opportunity  where CreatedDate=TODAY];

        for(Opportunity op:lstOpp)
        {
            op.CloseDate=System.Today()+14;
            op.StageName='Prospecting';
        }
        update lstOpp;
    } 

}