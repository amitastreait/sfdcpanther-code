import { api, LightningElement } from 'lwc';
import ACCOUNT_NAME from '@salesforce/schema/Account.Name';
import ACCOUNT_TYPE from '@salesforce/schema/Account.Type';
import ACCOUNT_RATING from '@salesforce/schema/Account.Rating';
import ACCOUNT_INDUSTRY from '@salesforce/schema/Account.Industry';

export default class QuickOpportunity extends LightningElement {

    selectedFields = [ACCOUNT_NAME, ACCOUNT_TYPE, ACCOUNT_RATING, ACCOUNT_INDUSTRY];
    handleSubmit(event){
        event.preventDefault();       // stop the form from submitting
        //Check your custom validation
        /* const inputFields = this.template.querySelectorAll(
            'lightning-input-field'
        );
        if (inputFields) {
            inputFields.forEach(field => {
                if(field.fieldName == 'Name') {
                    
                }
            });
        }
        */
        const fields = event.detail.fields;
        this.template.querySelector('lightning-record-edit-form').submit(fields);
    }

    @api
    invoke(){
        alert('I am here ');
    }
}