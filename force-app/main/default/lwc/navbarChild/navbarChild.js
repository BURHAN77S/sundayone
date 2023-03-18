import { api, LightningElement } from 'lwc';

export default class NavbarChild extends LightningElement {
    @api navList;
    handleNavSelection(event){
        const selectEvent = new CustomEvent('selection', {
            detail: event.target.name
        });
        this.dispatchEvent(selectEvent);
    }
}