public class SearchAccountsvf {

    public String searchText {get;set;}
    public List<Account> lstAcc {get;set;}
    
    public void searchMethod()
        {
            if(searchText!=null||searchtext!=''){
            lstAcc=new List<Account>();
            
            searchtext += '%';
            lstAcc=[select name,site,industry,phone,rating,type from account where name like : searchtext];
            
        }
}
}