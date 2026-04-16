({
	invoke : function(component, event, helper) {
        var stage=component.find("sname").get("v.value");
        var action=component.get("c.myData");
        action.setParams({"stage":stage})
        action.setCallback(this,function(response){
            var state =response.getState();
            if(state==='SUCCESS'){
                console.log('Operation Passed');
                component.set("v.optyList", response.getReturnValue());
                
            }
            else{
                console.log('Operation Failed');
            }
            
            
        });
        
        $A.enqueueAction(action);
	}
})