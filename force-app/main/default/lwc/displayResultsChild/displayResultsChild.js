import { api, LightningElement } from 'lwc';

export default class DisplayResultsChild extends LightningElement {
    @api result;
    @api columns;
    @api error;
}