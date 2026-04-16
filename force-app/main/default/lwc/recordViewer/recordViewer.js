import { LightningElement,track,wire } from 'lwc';
import getRecords from '@salesforce/apex/RecordViewerController.getRecords';
import { CurrentPageReference } from 'lightning/navigation';
export default class RecordViewer extends LightningElement {
    @track objectType = 'Account';
    @track records = [];
    @track error;
    @track expandedRecordId;

    @wire(CurrentPageReference)
    getPageRef(pageRef){
        if(pageRef && pageRef.state && pageRef.state.obj){
            this.objectType = pageRef.state.obj;
            this.handleSearch();
        }
    }

    get options() {
        return [
            { label: 'Account', value: 'Account' },
            { label: 'Contact', value: 'Contact' },
            { label: 'Opportunity', value: 'Opportunity' }
        ];
    }
        
    handleChange(event){
        this.objectType = event.target.value;
        console.log('Selected Object Type:', this.objectType);
    }
    handleSearch(){
        getRecords({ objectName: this.objectType })
            .then(data =>{
                this.records = data;
                this.error = undefined;
            })
            .catch(error =>{
                this.error= error;
                this.records = [];
            })
    }

    toggleRow(event){
        const recId = event.currentTarget.dataset.id;
        this.expandedRecordId = this.expandedRecordId === recId ? null : recId;
    }
}