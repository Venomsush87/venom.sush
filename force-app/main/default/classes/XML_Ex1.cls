public class XML_Ex1 {
    public String result{set; get;}
    public XML_Ex1(){
        DOM.Document doc=new DOM.Document();
        Dom.XmlNode root=doc.createRootElement('Name',null,null);
        Dom.XmlNode lname=root.addChildElement('Last Name',null,null);
        lname.addTextNode('Bhiwandi');
        Dom.XmlNode fname=root.addChildElement('First Name',null,null);
        fname.addTextNode('Suraj');
        result=doc.toXmlString();
    }
}