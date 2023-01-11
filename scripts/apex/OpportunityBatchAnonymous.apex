OpportunityBatch opb = new OpportunityBatch();
Id JobId = Database.executeBatch(opb, 10);
System.debug(JobId);

OpportunityBatch2 opb2 = new OpportunityBatch2();
Id JobId2 = Database.executeBatch(opb2, 1);
System.debug(JobId2);

OpportunityBatch3 opb3 = new OpportunityBatch3();
Id JobId3 = Database.executeBatch(opb3, 1);
System.debug(JobId3);