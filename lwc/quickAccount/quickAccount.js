import { api, LightningElement } from 'lwc';
import { CloseActionScreenEvent } from 'lightning/actions';
import createAccount from '@salesforce/apex/QuickActionController.createAccount';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class QuickAccount extends LightningElement {

    @api recordId;

    name = '';
    phone = '';
    isSpinner = false;

    connectedCallback(){
        this.name = 'SFDCPanther';
        this.phone = '90987654321';
    }

    closeAction(){
        this.dispatchEvent(new CloseActionScreenEvent());
    }

    handleChange = event => {
        event.preventDefault();
        let name = event.target.name;
        let value = event.target.value;
        if(name === 'name'){
            this.name = value;
        }else{
            this.phone = value;
        }
    }

    handleSave = event => {
        this.isSpinner = true;
        event.preventDefault();
        createAccount({ 
            name : this.name,
            phone : this.phone,
            parentRecordId : this.recordId 
        })
        .then(result => {
            console.log('Result \n ', result);
            this.dispatchEvent(new ShowToastEvent({
                title: 'Success',
                message: 'Account Created',
                variant: 'success'
            }));
            this.closeAction();
        })
        .catch(error => {
            console.error('Error: \n ', error);
        })
        .finally(()=>{
            this.isSpinner = false;
        })
    }
}