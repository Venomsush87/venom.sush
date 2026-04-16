public class CommonFunctions {

    Public void add(integer x, integer y)
    {
        system.debug('Result of addition is : '+ (x+y));
    }
    
     Public void subtract(integer x, integer y)
    {
        system.debug('Result of subtraction is : '+ (x-y));
    }
    
     Public void multiply(integer x, integer y)
    {
        system.debug('Result of multiplication is : '+ (x*y));
    }
    
     Public void div(integer x, integer y)
    {
        system.debug('Result of Multiplication is : '+ (x/y));
    }
    
    public void checkstring(string s1, string s2)
    {
        if(s1==s2)
        {
            system.debug('Both the strings are equal');
        }
        else 
            system.debug('Both the strings do not match with each other');
    }
    
    public void checkstring2(string s1, string s2)
    {
        if(s1.equals(s2))
        {
            system.debug('Both the strings are equal');
        }
        else 
            system.debug('Both the strings do not match with each other');
        }
    
}