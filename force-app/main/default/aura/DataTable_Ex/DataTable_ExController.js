({
    show : function(component, event, helper) {
        var industry=component.find("indus").get("v.value");
        component.set("v.columns",[
            {label:"Name", fieldname:"Name", type:"text"},
            {label:"Industry", fieldname:"Industry", type:"text"},
            {label:"Rating", fieldname:"Rating", type:"text"},
            {label:"Type", fieldname:"Type", type:"text"}
        ]);
        console.log('Function Executed');
        var action=component.get("c.searchAcc");
        action.setParams({"industry":industry});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
                component.set("v.accounts",response.getReturnValue());
                console.log('Pass');
            }
            else{console.log('Error');}
            
        });
        
        $A.enqueueAction(action);
    }
})