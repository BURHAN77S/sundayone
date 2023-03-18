import { LightningElement } from 'lwc';

export default class ModalParent extends LightningElement {
    
    showModal = false;
    message;

    newAccount(){
        this.showModal = true;
    }
    
    closeHandler(event){
        this.message = event.detail;
        this.showModal = false;
    }
}