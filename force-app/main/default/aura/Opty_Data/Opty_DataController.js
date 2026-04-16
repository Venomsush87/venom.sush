({
	invoke : function(component, event, helper) {
        var stage=component.find("sname").get("v.value");
		var action=component.get("c.myData");
        action.setParams({"stage":stage});
        action.setCallback(this,function(response){
            var state=response.getState();
            console.log('Method executed successfully');
            
            if(state==='SUCCESS')
            {        
                component.set("v.optyList",response.getReturnValue());
                console.log('Operation invoked successfully');
            }
            else 
                console.log('Method invoke failed');                       
        });		       
        $A.enqueueAction(action);
	}
})