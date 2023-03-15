import { LightningElement } from 'lwc';

export default class ColorSelectorParent extends LightningElement {
    selectedColor;
    changeHandler(event){
        this.selectedColor = event.target.value;
    }

    clickHandler(){
        this.template.querySelector("c-color-selector-child").changeSize();
    }
}