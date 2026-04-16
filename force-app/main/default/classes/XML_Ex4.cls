public class XML_Ex4 {
    public string xmlString{set;get;}
    public string result{set;get;}

    public void convert(){
        Dom.Document doc= new Dom.Document();
        doc.load(xmlString);
        Dom.XmlNode root=doc.getRootElement();
        //getName() : Returns the name of the element
        //getText() : Returns the text of the element
        //getChildElements : List of child elements for the given node
        result=root.getName();
        List<Dom.XmlNode> childs=root.getChildElements();
        for(Dom.XmlNode c:childs){
            result=result+'\n'+c.getName()+' :'+c.getText();
        }
    }
}