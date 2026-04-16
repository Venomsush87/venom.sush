({
	invoke : function(component, event, helper) {
       
        
		var lname=component.find("lname").get("v.value");
        var fname=component.find("fname").get("v.value");
        var accountId=event.getParam("accountId");
        var action=component.get("c.conCreate");
        
        action.setParams({"lastname":lname,"firstname":fname ,"accountId":accountId});
        console.log('Parent Component 1st step');
        
        action.setCallback(this,function(response){
            var state=response.getState();
            console.log('Parent Component 2nd step');
            if(state==='SUCCESS'){
                alert(response.getReturnValue());
                console.log('Parent Component executed');
            }
            else{
                alert('Failed');
            }
            
        });
	    $A.enqueueAction(action);    
	}
})