global class Http_Ex_2_Curncy_Covrtr_Batch implements Database.Batchable<sObject>, Database.AllowsCallouts{
    global Database.QueryLocator start(Database.BatchableContext bc){
        String query='select id,Amount,INR_Value__c from Opportunity where stageName=\'Prospect\'';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext bc,List<Opportunity> scope){
        Decimal val;
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
                val=(Decimal)jp.getDecimalValue();
                System.debug('INR: '+val);
            } 
        }
        for(Opportunity op: scope){
            op.INR_Value__c='Rs.'+op.amount*val;
        }
        update scope; 
    }
    
    global void finish(Database.BatchableContext bc){
        	ID jobid=bc.getJobId();
        	AsyncApexJob job= [select id, status from AsyncApexJob where id=:jobId];
        	Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();
        	String[] emailAd=new String[]{'sushantsalunkhe87@gmail.com'};
            msg.setToAddresses(emailAd);
        	msg.setSubject('Batch Ack');
        	msg.setPlainTextBody('Batch Job : '+jobId+' Completed with status: '+job.Status);
        	Messaging.Email[] emails=new Messaging.Email[]{msg};
            Messaging.sendEmail(emails);
    }
}