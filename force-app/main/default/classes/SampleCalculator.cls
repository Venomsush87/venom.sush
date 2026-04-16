public class SampleCalculator {
    public integer firstNumber{get;set;}
    public integer secondNumber{get;set;}
    
    public integer result{get;set;}    
    
    public void Addition()
    {
            result = firstnumber+secondnumber;
            Apexpages.AddMessage(new apexpages.message(apexpages.severity.confirm,'Operation completed successfully'));
    }
    public void Subtraction()
    {
            result=firstNumber-secondNumber;
            Apexpages.AddMessage(new apexpages.message(apexpages.severity.confirm,'Operation completed successfully'));
    }
    public void Multiplication()
    {
            result=firstNumber*secondNumber;
            Apexpages.AddMessage(new apexpages.message(apexpages.severity.confirm,'Operation completed successfully'));
    }
    
     public void Division()
    {
        if(secondNumber!=0)
        {
            result = firstNumber/secondNumber;
            Apexpages.AddMessage(new apexpages.message(apexpages.severity.confirm,'Operation completed successfully'));
        }
        else 
        {
            Apexpages.AddMessage(new apexpages.message(apexpages.severity.error,'Division opeation cannot be performed'));
        }
         
    }
 }