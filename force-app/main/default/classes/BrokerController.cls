public with sharing class BrokerController {
    
    /**
     * Wrapper class to hold broker statistics
     */
    public class BrokerStats {
        @AuraEnabled
        public String Id;
        @AuraEnabled
        public String Name;
        @AuraEnabled
        public String title;
        @AuraEnabled
        public String picture;
        @AuraEnabled
        public Integer propertyCount;
        @AuraEnabled
        public Decimal totalValue;
    }
    
    /**
     * Get broker statistics including property count and total value
     * @return List of BrokerStats
     */
    @AuraEnabled(cacheable=true)
    public static List<BrokerStats> getBrokerStats() {
        List<BrokerStats> results = new List<BrokerStats>();
        
        // Get all brokers
        List<Broker__c> brokers = [
            SELECT Id, Name, Title__c, Picture__c,
                   (SELECT Id, Price__c FROM Properties__r)
            FROM Broker__c
            WITH USER_MODE
            ORDER BY Name
        ];
        
        // Calculate statistics for each broker
        for (Broker__c broker : brokers) {
            BrokerStats stat = new BrokerStats();
            stat.Id = broker.Id;
            stat.Name = broker.Name;
            stat.title = broker.Title__c;
            stat.picture = broker.Picture__c;
            stat.propertyCount = broker.Properties__r.size();
            
            // Calculate total property value
            Decimal total = 0;
            for (Property__c prop : broker.Properties__r) {
                if (prop.Price__c != null) {
                    total += prop.Price__c;
                }
            }
            stat.totalValue = total;
            
            results.add(stat);
        }
        
        return results;
    }
}
