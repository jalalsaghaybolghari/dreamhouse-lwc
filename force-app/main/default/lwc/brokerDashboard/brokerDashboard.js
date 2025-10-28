import { LightningElement, wire } from 'lwc';
import getBrokerStats from '@salesforce/apex/BrokerController.getBrokerStats';

export default class BrokerDashboard extends LightningElement {
    brokers;
    error;

    @wire(getBrokerStats)
    wiredBrokers({ error, data }) {
        if (data) {
            this.brokers = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.brokers = undefined;
        }
    }

    get hasBrokers() {
        return this.brokers && this.brokers.length > 0;
    }
}
