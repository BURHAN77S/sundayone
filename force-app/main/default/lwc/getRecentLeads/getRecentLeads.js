import { LightningElement, wire } from 'lwc';
import getRecentLeads from '@salesforce/apex/LeadController.getRecentLeads';

const COLUMNS = [
    {label : 'First Name', fieldName: 'FirstName', type: "text"},
    {label : 'Last Name', fieldName: 'LastName', type: "text"},
    {label : 'Title', fieldName: 'Title', type: "text"},
    {label : 'Company', fieldName: 'Company', type: "text"}
]

export default class GetRecentLeads extends LightningElement {
    columns = COLUMNS;
    leads;
    error;
    button=false;

    handlerClick(){
        if(this.leads || this.error){
            this.leads = undefined;
            this.error = undefined;
        }else{
            getRecentLeads()
            .then(result=>{
                this.leads = result;
            }) 
            .catch(error=>{
                this.error = error;
            })
        }
        
        //this.button = !this.button;
        //this.error = undefined;


    }
}