Account acc = [select Id from Account where Id = '0016S00003GWPaxQAH'];
Map<String,Object> inputs = new Map<String,Object>();
Inputs.put('accId', acc.Id);
flow.Interview oppflow = new flow.Interview.Opportunity_Auto_Launch_Flow(inputs);
oppflow.start();
