public class Http_Ex_2_Curncy_Covrtr {
    public String response {set;get;}
        
    public void invoke(){
        /*Fetch the key from the Custom Setting
			1. Fetch all the values from the custom settings
			2. Get the currency value from the Map
			3. Assign the key
		*/
        Map<String,APIKeys__c> myMap=APIKeys__c.getAll();
        APIKeys__c ak=myMap.get('Currency');
        String key=ak.key__c;
        String url='http://apilayer.net/api/live?access_key='+key;
        url=url+'&currencies=INR';
    	url=url+'&source=USD&format=1';
        //Create a request object
        Http p=new Http();
        HttpRequest req=new HttpRequest();
        req.setEndpoint(url);
        req.setMethod('GET');
        
        //Create a response Object
       	HttpResponse response=p.send(req);
        String body=response.getBody();
        
        //De-Serialize the body
        System.JSONParser jp=JSON.createParser(body);
        while(jp.nextToken()!=null){
            if(jp.getText()=='USDINR'){
                jp.nextToken();
                Decimal val=(Decimal)jp.getDecimalValue();
                System.debug('INR: '+val);
            }
        }    
    }
}