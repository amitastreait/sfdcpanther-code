import { api, LightningElement } from 'lwc';
import { CloseActionScreenEvent } from 'lightning/actions';
export default class QuickContact extends LightningElement {

    isSpinner = false;

    @api 
    invoke(){
        window.console.log('inside method');
    }

    closeAction(){
        this.dispatchEvent(new CloseActionScreenEvent());
    }
}