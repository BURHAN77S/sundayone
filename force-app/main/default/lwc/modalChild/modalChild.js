import ACC_OBJECT from '@salesforce/schema/Account';
import { LightningElement } from 'lwc';

export default class ModalChild extends LightningElement {
    objectName = ACC_OBJECT;

    clickHandler(){
        //Basit event
        // const closeEvent = new CustomEvent('close');
        // this.dispatchEvent(closeEvent);
        
        //primitive bir data ile even gonderme
        // let message = 'Bir deneme mesaji event ile gonderiyoruz..';
        // const closeEvent = new CustomEvent('close', {detail:message});
        // this.dispatchEvent(closeEvent);
        
        //non-primitive bir datayi event ile gonderme
        let message = {
            Id:1,
            Name:'John Doe',
            Company: 'Softinnovas',
            Position: 'Manager'
        }
        
        const closeEvent = new CustomEvent('close', {detail:message});
        this.dispatchEvent(closeEvent);
    }
}