({
	call : function(component, event, helper) {
		var action=component.get("c.getData");
        action.setCallback(this,function(response){
            var state=response.getState();
            console.log('Method Executed successfully');
            
            if(state==='SUCCESS'){
                var result=response.getReturnValue();
                component.set("v.accounts",result);
                console.log('Operation SUCCESSFULL');
            }
            else if(state==='ERROR')
            {
                console.log('Operation FAILED');
            }                    
        });
                                   
       $A.enqueueAction(action);
	}
}) 
/*({
    init: function(cmp) {
        var list = cmp.get('v.groceries');
        // Some logic
        cmp.set('v.groceries', list); // Performance warning trigger
    }
})*/