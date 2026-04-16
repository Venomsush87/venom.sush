public class ShowAllLeadsController 
{
    public list<Lead> lstleads{get;set;}
    
    public ShowAllLeadsController()
    {
        lstleads = new List<Lead>(); 
        lstLeads=[select id,firstname,lastname ,email,company,status,phone,fax,annualrevenue from lead where isconverted=false ];
    } 

}