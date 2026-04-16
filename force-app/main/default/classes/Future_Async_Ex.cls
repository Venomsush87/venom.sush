public class Future_Async_Ex {
    @future
    public static void callMe()
    {
        system.debug('callMe 1');
        system.debug('callMe 2');
        system.debug('callMe 3');
    }
    @future
    public static void invoke()
    {
        system.debug('invoke one');
        system.debug('invoke two');
    }
    
    public void show()
    {
        system.debug('show 1');
        system.debug('show 2');
        callMe();
        system.debug('show 3');
        system.debug('show 4');
        invoke();
        system.debug('show 5');
        system.debug('show 6');
    }
}