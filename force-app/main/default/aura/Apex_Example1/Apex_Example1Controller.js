({
    show : function(component,event,helper){
        var action=component.get("c.demoTestClass");
            action.setCallback(this,function(response){
            console.log('Method executed');
                
            var state=response.getState();
            if(state==='SUCCESS')
            {
                console.log('Operation perfomed succesfully');
            }
            else if(state==='ERROR')
            {
        		console.log('Operation Failed');
            }            
        });
        
        $A.enqueueAction(action);
    }
})