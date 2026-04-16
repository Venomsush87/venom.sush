public class Demo1 {
    public static void sampleMethod(){
        List<ID> a1=new List<ID>();
        a1.add('0062x000004UBW2AAO');
        a1.add('0062x000004UBW5AAO');
        a1.add('0062x000004UBW1AAO');
        a1.add('0062x000004U3W2AAO');
        //system.debug('a1>>'+a1);
        
        List<ID> a2=new List<ID>();
        a2.add('0062x000004UBW2AAO');
        a2.add('0062x000004UBW5AAO');
        a2.add('0062x000004UBW1AAO');
        a2.add('0062x000004U3W2AAO');
        //system.debug('a2>>'+a2);
        
        Set<Integer> s1=new Set<Integer>();
        s1.add(53);
        s1.add(55);
        List<Integer> l1=new List<Integer>(s1);
        system.debug(l1);
        
        /*Map<String, String> mapfruitsColor=new Map<String, String>();
        mapfruitsColor.put('Red','Apple');
        mapfruitsColor.put('Yellow','Banana');
        mapfruitsColor.put('Pink','Strawberry');
        if(mapfruitsColor.containsKey('Red')){
            system.debug('Has the red fruit>>');
        }
        system.debug('colorsOfFruits>>'+mapfruitsColor);
        system.debug('mapfruitsColor.get() >>'+ mapfruitsColor.get('Yellow'));
        system.debug('mapfruitsColor.keyset()>>'+mapfruitsColor.keyset());
        system.debug('mapfruitsColor.values()>>'+mapfruitsColor.values());*/
    }
}