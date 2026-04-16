// This is a test class for the AC_vfPageTestTask Visualforce page.
public class AC_vfPageTestTask {
    
    public String height{get;set;}
    public String weight{get;set;}
    
    public String bmi{get;set;}
        
    public void calBmi() 
    {
        	bmi=height +' '+weight;
        
            Apexpages.AddMessage(new apexpages.message(apexpages.severity.info,'Your Name has been saved succesfully'));   
}
}