import { LightningElement, wire } from 'lwc';
import getClosedCases from '@salesforce/apex/CloseCaseController.getClosedCases';

import claseSelectedCases from '@salesforce/apex/CloseCaseController.claseSelectedCases';

export default class CloseCases extends LightningElement {


    _errors;
    _cases;

    @wire(getClosedCases)
    wiredData({ error, data }) {
        if (data) {
            console.log('Data \n ', data);
            this._cases = JSON.parse( JSON.stringify(data) );
        } else if (error) {
            console.error('Error:', error);
        }
    }

    handleClick = event =>{
        event.preventDefault();
        
        claseSelectedCases({ 
            caseString : JSON.stringify(this._cases) 
        })
        .then(result => {
            console.log('Result \n ', result);
            window.location.reload();
        })
        .catch(error => {
            console.error('Error: \n ', error);
        });
    }

    handleCheckbox = event =>{
        // data- => dataset.id
        // dataset.recordIdCase
        event.preventDefault();
        let name = event.target.name; // isSelected
        let checked = event.target.checked;
        let index = event.target.dataset.recordId;
        
        let caseWrapper = this._cases[index];
        console.log(caseWrapper);
        console.log(name);

        this._cases[index][name] = checked;

        // [{},{}]
        // let caseWrapper = [index]
        // caseWrapper.[name] = checked

        // object1
        // object2 = object1
        // object.prop1 ='some value'
        // log object.prop1 = some value'
    }
}