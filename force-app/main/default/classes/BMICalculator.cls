public class BMICalculator {

    public integer height{get;set;}
    public integer weight{get;set;}
    
    public integer bmi{get;set;}
        
    public void calBmi() 
    {
        bmi=(weight*10000)/(height*height);
        if(bmi<18.5)
        {
            Apexpages.AddMessage(new apexpages.message(apexpages.severity.info,'Underweight'));
        }
        else if(bmi>18.5 && bmi<24.5)
        {
            Apexpages.AddMessage(new apexpages.message(apexpages.severity.confirm,'Normal'));
        }
        else
        {
            Apexpages.AddMessage(new apexpages.message(apexpages.severity.fatal,'Overweight'));
        }
        
    }
    
}