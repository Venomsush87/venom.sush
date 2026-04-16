public class Http_Ex_2_SMS {
    public String status{get;set;}
    public void send(){
        String url='https://api.textlocal.in/send/';
        String body='sender=TXTLCL&';
        body=body+'message=TestSMS&';
        body=body+'apiKey=NzMzNTU1NjI3NTQ5NjI1NDYyNzU3MTc4NmEzMTMxMzc=&';
        body=body+'numbers=8147418410';
        
        Http p=new Http();
        HttpRequest req=new HttpRequest();
        req.setEndpoint(url);
        req.setMethod('POST');
        req.setBody(body);
        HttpResponse response=p.send(req);
        String result=response.getBody();
        status=response.getStatus();
        System.debug('Status :'+ status);
        System.debug('Result :'+result);  
    }
}