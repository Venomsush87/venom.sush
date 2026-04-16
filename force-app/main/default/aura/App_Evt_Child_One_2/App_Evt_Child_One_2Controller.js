({
	callMe : function(component, event, helper) {
		var evt= $A.get("e.c:App_Evt_2");
        evt.setParams({"empName":"Satish","city":"Hyd"});
        evt.fire();
	}
})