({
	search : function(component, event, helper) {
		var phone=component.find("phone").get("v.value");
        var action=component.get("mySearch");
        action.setParams({"phone":phone});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==="SUCCESS"){
                var accountId= repsonse.getReturnValue();
                var evt= component.getEvent();
                evt.setParams({"accountId":accId});
                evt.fire();
            }
            else{
                console.log('Failed');
            }
            
        });
        
        $A.enqueueAction(action);
        
	}
})