#!/bin/bash

echo "🔍 Verifying Broker Dashboard Tab..."
echo ""

# Check if tab file exists
if [ -f "force-app/main/default/tabs/Broker_Dashboard.tab-meta.xml" ]; then
    echo "✅ Tab file exists"
else
    echo "❌ Tab file missing"
fi

# Check if FlexiPage exists
if [ -f "force-app/main/default/flexipages/Broker_Dashboard.flexipage-meta.xml" ]; then
    echo "✅ FlexiPage exists"
else
    echo "❌ FlexiPage missing"
fi

# Check if tab is in app
if grep -q "Broker_Dashboard" force-app/main/default/applications/Dreamhouse.app-meta.xml; then
    echo "✅ Tab is in Dreamhouse app navigation"
else
    echo "❌ Tab NOT in Dreamhouse app navigation"
fi

echo ""
echo "📋 Next steps if tab is not visible:"
echo "1. Refresh your browser (Cmd+Shift+R on Mac)"
echo "2. Click the 'More' dropdown (▼) in the navigation bar"
echo "3. Check if you need to personalize your nav:"
echo "   Click the pencil icon ✏️  in nav bar → Add 'Broker Dashboard'"
echo ""
echo "Or run this to re-deploy:"
echo "sf project deploy start --source-dir force-app/main/default/tabs/Broker_Dashboard.tab-meta.xml --source-dir force-app/main/default/applications/Dreamhouse.app-meta.xml"
