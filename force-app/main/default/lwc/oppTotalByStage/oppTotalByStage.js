import { LightningElement, wire } from 'lwc';
import OPPORTUNTY_OBJECT from '@salesforce/schema/Opportunity';
import STAGENAME_FIELD from '@salesforce/schema/Opportunity.StageName';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import getStageOppCalculate from '@salesforce/apex/OpportunityController.getStageOppCalculate';

export default class OppTotalByStage extends LightningElement {
    stageOptions=[];
    error;
    oppTotal

    @wire (getObjectInfo, {objectApiName:OPPORTUNTY_OBJECT})
    oppInfo;

    @wire(getPicklistValues, {fieldApiName:STAGENAME_FIELD, recordTypeId:"$oppInfo.data.defaultRecordTypeId"})
    picklistHandler({data, error}){
        if(data){
            this.stageOptions = data.values;
        }
        if(error){
            this.error = error;
        }
    }
    changeHandler(event){
        const selectedStage=event.target.value;
        getStageOppCalculate({stage:selectedStage})
        .then(result=>{
            if(result>0){
                this.oppTotal = result;
                this.error = undefined;
            }else{
                this.error = 'There are no matching opportunities for the selected stage. Please select another'
                this.oppTotal = undefined;
            }
        })
        .catch(error =>{
            this.error = error.body.message
            this.oppTotal = undefined;
        });
    }
}