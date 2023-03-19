import searchStudentsByPostalCode from '@salesforce/apex/StudentCtrl.searchStudentsByPostalCode';
import { LightningElement } from 'lwc';

const COLUMNS = [
    {label: "Student Name", fieldName: "Student_Name__c", type:"text"},
    {label: "Class", fieldName: "Class__c", type:"number"},
    {label: "Mobile", fieldName: "Mobile__c", type:"phone"},
    {label: "Email", fieldName: "Email__c", type:"email"},
    {label: "Postal Code", fieldName: "Postal_Code__c", type:"text"}
];

export default class DisplayResultsParent extends LightningElement {
    student;
    columns = COLUMNS;
    error;

    changeHandler(event){
        const pCode = event.target.value;
        if(pCode.length == 0){
            console.log("pCode.length", pCode.length);
            this.student = undefined;
            this.error = undefined;
        }else if(pCode.length > 0){
            searchStudentsByPostalCode({postalCode:pCode})
                .then(result =>{
                    if(result.length > 0 && pCode.length > 0){
                        this.student = result;
                        this.error = undefined;
                    }else if(result.length == 0){
                        this.student = undefined;
                        this.error = "Doğru bir değer girebilirsiniz.";
                    }
                })

                .catch(error=>{
                    this.student = undefined;
                    this.error = error.body.message;
                })
        }
    }
}