public class XML_Ex2 {
    public String result{set;get;}
    
    public XML_Ex2(){
        Dom.Document doc=new Dom.Document();
        Dom.XmlNode root=doc.createRootElement('College',null,null);
        Dom.XMLNode name=root.addChildElement('Name',null,null);
        name.addTextNode('Sushant Salunkhe');
        Dom.XMLNode Phone=root.addChildElement('Phone', null,null);
        phone.addTextNode('65656565');
        Dom.XMLNode address=root.addChildElement('Address', null,null);
        	Dom.XmlNode city=address.addChildElement('City',null,null);
        	city.addTextNode('Belagavi');
        	Dom.XmlNode state=address.addChildElement('State',null,null);
        	state.addTextNode('Karnataka');
        result=doc.toXmlString();
    }
}