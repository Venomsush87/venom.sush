({
	invoke : function(component, event, helper) {
		var name=event.getParam('empName');
        var city=event.getParam('city');
        component.set("v.stdName",name);
        component.set("v.stdCity",city);
	}
})