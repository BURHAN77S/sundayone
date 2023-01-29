Order_Event__e newEvent = new Order_Event__e();
newEvent.Has_Shipped__c =true;
newEvent.Order_Number__c ='J4ASD';
Eventbus.publish(newEvent);