public class xmlEx_5 {
    public String xmlStr{set;get;}
    public xmlEx_5(){
       	DOM.Document doc = new DOM.Document();
        DOM.XmlNode root = doc.createRootElement('Institute', null, null);
        
        DOM.XmlNode name = root.addChildElement('name',null,null);
        name.addTextNode('CapitalInfo Solutions');
        
        DOM.XmlNode place = root.addChildElement('place',null,null);
        place.addTextNode('Telangana');
        place.setAttribute('city', 'Hyderabad');
        
        DOM.XmlNode phone = root.addChildElement('phone',null,null);
        phone.addTextNode('23040324');
        
        xmlStr=doc.toXmlString();
    }
}