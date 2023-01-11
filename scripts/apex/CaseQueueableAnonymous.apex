CaseQueueable cq = new CaseQueueable();

Id jobId = System.enqueueJob(cq);
System.debug('jobID ' + jobID);