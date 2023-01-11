public class OpportunitySchedulable implements schedulable {
    public void execute(SchedulableContext sc) {
        Database.executeBatch(new OpportunityBatch());
    }
}