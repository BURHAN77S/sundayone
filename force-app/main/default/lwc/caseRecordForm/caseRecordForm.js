import { LightningElement } from 'lwc';
import CASE from '@salesforce/schema/Case';
import ACCOUNTID from '@salesforce/schema/Case.AccountId';
import CONTACTID from '@salesforce/schema/Case.ContactId';
import SUBJECT from '@salesforce/schema/Case.Subject';
import DESCRIPTION from '@salesforce/schema/Case.Description';
import PRIORITY from '@salesforce/schema/Case.Priority';
import ORIGIN from '@salesforce/schema/Case.Origin';


export default class CaseRecordForm extends LightningElement {
    objectName = CASE;
    caseFields = [ACCOUNTID, CONTACTID, SUBJECT, DESCRIPTION, PRIORITY, ORIGIN];
    recordId = '5006S000027m2GOQAY';
}