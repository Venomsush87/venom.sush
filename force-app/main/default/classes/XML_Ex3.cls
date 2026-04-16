public class XML_Ex3 {
    public string result{set;get;}
    public String searchText{set;get;}
    public void invoke(){
        Account acc=[select id,Name,Phone,Industry,(select id,lastName,FirstName,Phone from Contacts) from Account where name like:searchText];
        Dom.Document doc=new Dom.Document();
        Dom.XmlNode root=doc.createRootElement('Company',null,null);
    	root.setAttribute('Name',acc.Name);
        root.setAttribute('Phone',acc.Phone);
        root.setAttribute('Industry',acc.Industry);
        
        Dom.XmlNode head=root.addChildElement('Header',null,null);
        head.setAttribute('Status', 'Success');
        head.setAttribute('Persons', ''+acc.contacts.size());
        
        if(acc.contacts.size()>0){
            for(Contact c:acc.Contacts){
				Dom.XmlNode person=root.addChildElement('Person',null,null);
        		Dom.XmlNode lName=person.addChildElement('LastName',null,null);
        		lname.addTextNode(c.LastName);
        		Dom.XmlNode fName=person.addChildElement('FirstName',null,null);
            	fname.addTextNode(c.FirstName);
        		Dom.XmlNode phone=person.addChildElement('Phone',null,null);
            	phone.addTextNode(c.phone);                
            }
        }
        result=doc.toXmlString();
    }
}