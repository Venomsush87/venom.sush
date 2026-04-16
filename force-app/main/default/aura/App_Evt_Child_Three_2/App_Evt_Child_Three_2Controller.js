({
	invoke : function(component, event, helper) {
		var name=event.getParam('empName');
        var city=event.getParam('city');
        component.set("v.name",name);
        component.set("v.city",city);
	}
})