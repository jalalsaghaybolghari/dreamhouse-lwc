#!/bin/bash

echo "🚀 Deploying Broker Dashboard to Salesforce..."

# Deploy the new components
sf project deploy start \
  --source-dir force-app/main/default/lwc/brokerDashboard \
  --source-dir force-app/main/default/classes/BrokerController.cls \
  --source-dir force-app/main/default/classes/BrokerController.cls-meta.xml \
  --source-dir force-app/main/default/flexipages/Broker_Dashboard.flexipage-meta.xml \
  --source-dir force-app/main/default/tabs/Broker_Dashboard.tab-meta.xml \
  --source-dir force-app/main/default/applications/Dreamhouse.app-meta.xml

echo "✅ Deployment complete! Open your org to see the new Broker Dashboard tab."
echo ""
echo "Run this command to open your org:"
echo "sf org open"
