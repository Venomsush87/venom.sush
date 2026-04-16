import { LightningElement } from 'lwc';

export default class Lwc_2323_event_declaratively_empDetails_display2 extends LightningElement 
{
    empName;
    empPhone;
    empCity;

    handleevent(event)
    {
        this.empName=event.detail.enm;
        this.empPhone=event.detail.eph;
        this.empCity=event.detail.ect;
    }
}