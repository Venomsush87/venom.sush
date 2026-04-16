public class Http_Ex_1 {
    public String endPoint {set;get;}
    public String body {set;get;}
    public String result {set;get;}
    public List<Map<String,String>> bookMap {set;get;}
    
    public void call(){
        result='';
        bookMap=new List<Map<String,String>>();
        Http p=new Http();
        //Creating the request object
        HttpRequest request=new HttpRequest();
        //set the endPoint URL
        request.setEndpoint(endPoint);
        //set the method type
        request.setMethod('GET');
        //send the request and get the response
        HttpResponse response=p.send(request);
        body=response.getBody();
        Dom.Document doc=new Dom.Document();
        doc.load(body); 
        Dom.XmlNode root=doc.getRootElement();
        List<Dom.XmlNode> books=root.getChildElements();
        for(Dom.XmlNode bk:books){
            Map<String,String> myMap=new Map<String,String>();
            List<Dom.XmlNode> childs=bk.getChildElements();
            for(Dom.XmlNode c:childs){
                myMap.put(c.getName(),c.getText());
            }
            bookMap.add(myMap);
        }
        System.debug('Status: '+response.getStatus());   
    }
    public class bookWrapper{
        public String author{set;get;}
        
    }
}