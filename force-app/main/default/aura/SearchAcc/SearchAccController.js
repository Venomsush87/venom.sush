({
    searchData : function(component,event,helper){
        var industry=component.find("sindustry").get("v.value");
        var rating=component.find("srating").get("v.value");
        var action=component.get("c.search");
        
        action.setParams({"acc_Indus":industry,"acc_Rating":rating});
        
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS')
            {
                console.log('Method invoke successfully');
                component.set("v.accounts",response.getReturnValue());
            }
            else console.log('Method invoke failed');
        });
        
        $A.enqueueAction(action);
        
    }	
})