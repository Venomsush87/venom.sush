({
    search : function(component, event, helper) {
        var phone=component.find("phone").get("v.value");
        var action=component.get("c.mySearch");
        action.setParams({"phone":phone});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
                var accId=response.getReturnValue();
                var evt=component.getEvent("accName");
                evt.setParams({"accountId":accId});
                evt.fire();
                console.log('Child Component executed');
            }
            else {}
            
        });
        
        $A.enqueueAction(action);
    }
    
    
})