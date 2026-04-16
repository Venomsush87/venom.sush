public class Http_Ex_2_PinCodeAsgnmnt {
    public Account acc{get;set;}
    public String url;
    public Http_Ex_2_PinCodeAsgnmnt(){
        acc=new Account();
        url='https://api.postalpincode.in/pincode/';
    }
    
    public void invoke(){
        try{
			Http p=new Http();
			HttpRequest req=new HttpRequest();
			url=url+acc.Pin_Code__c;
			req.setEndpoint(url);
			req.setMethod('GET');
			HttpResponse res=p.send(req);
			String jsonString=res.getBody();
			System.JSONParser jp=JSON.createParser(jsonString);
			String places='';
			
			while(jp.nextToken()!=null){
				if(jp.getText()=='Name'){
					jp.nextToken();
					places=places+', '+jp.getText();
					}
				}
				acc.Places__c=places;
				insert acc; 
        }catch(Exception e){
            //Database.rollback
            ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.ERROR, e.getMessage());
            ApexPages.addMessage(msg);
        }
    }
}