import { api, LightningElement } from 'lwc';

export default class ColorSelectorChild extends LightningElement {
    @api pickColor

    get chooseColor(){
        return "background-color:" + this.pickColor
    }
    @api changeSize(){
        this.template.querySelector("p").style.fontSize="25px";
        this.template.querySelector("p").style.fontWeight="bold";
    }
}