public class CaseSchedulable implements schedulable {
    public void execute(SchedulableContext sc) {
        Database.executeBatch(new CaseBatch());
    }
}