# Adding Broker Dashboard Page to Dreamhouse

This guide shows you how to add a new page to the Dreamhouse application.

## 📁 Files Created

### 1. Lightning Web Component
```
force-app/main/default/lwc/brokerDashboard/
├── brokerDashboard.js           # Component logic
├── brokerDashboard.html         # Component template
└── brokerDashboard.js-meta.xml  # Component metadata
```

### 2. Apex Controller
```
force-app/main/default/classes/
├── BrokerController.cls          # Backend logic
└── BrokerController.cls-meta.xml # Class metadata
```

### 3. Lightning Page
```
force-app/main/default/flexipages/
└── Broker_Dashboard.flexipage-meta.xml  # Page layout
```

### 4. Custom Tab
```
force-app/main/default/tabs/
└── Broker_Dashboard.tab-meta.xml  # Navigation tab
```

### 5. Updated Application
```
force-app/main/default/applications/
└── Dreamhouse.app-meta.xml  # Added new tab to navigation
```

---

## 🚀 Deployment Steps

### Option 1: Deploy All at Once
```bash
./deploy-broker-dashboard.sh
```

### Option 2: Deploy Manually
```bash
sf project deploy start \
  --source-dir force-app/main/default/lwc/brokerDashboard \
  --source-dir force-app/main/default/classes/BrokerController.cls \
  --source-dir force-app/main/default/classes/BrokerController.cls-meta.xml \
  --source-dir force-app/main/default/flexipages/Broker_Dashboard.flexipage-meta.xml \
  --source-dir force-app/main/default/tabs/Broker_Dashboard.tab-meta.xml \
  --source-dir force-app/main/default/applications/Dreamhouse.app-meta.xml
```

### Option 3: Deploy Everything
```bash
sf project deploy start
```

---

## 🎯 What the Page Does

The **Broker Dashboard** page displays:
- All brokers with their photos
- Number of properties per broker
- Total value of properties per broker
- Responsive grid layout (1/2/3 columns based on screen size)

---

## 📊 Component Architecture

```
┌──────────────────────────────────────┐
│   brokerDashboard (LWC)              │
│   ┌────────────────────────────┐     │
│   │  @wire(getBrokerStats)     │     │
│   │         ↓                   │     │
│   │  BrokerController.cls      │     │
│   │         ↓                   │     │
│   │  Query Broker__c + Props   │     │
│   │         ↓                   │     │
│   │  Calculate Statistics      │     │
│   │         ↓                   │     │
│   │  Return BrokerStats[]      │     │
│   └────────────────────────────┘     │
└──────────────────────────────────────┘
```

---

## 🧪 Testing

After deployment, test the page:

1. Open your Salesforce org:
   ```bash
   sf org open
   ```

2. Navigate to **Dreamhouse** app

3. Click on **Broker Dashboard** tab

4. You should see:
   - Cards for each broker
   - Property count badge
   - Total portfolio value
   - Broker photos and titles

---

## 🎨 Customization Examples

### Change Card Colors
Edit `brokerDashboard.html` line 8-9:
```html
<lightning-card class="slds-card_boundary custom-card">
```

### Add More Statistics
Edit `BrokerController.cls` to add fields:
```apex
@AuraEnabled
public Decimal averagePrice;
```

### Change Layout
Edit `Broker_Dashboard.flexipage-meta.xml` to use different template:
```xml
<template>
    <name>flexipage:availableForAllPageTypes</name>
</template>
```

### Modify Grid Layout
Edit `brokerDashboard.html` line 7:
```html
<!-- Change from 4 to 3 columns -->
<lightning-layout-item large-device-size="3">
```

---

## 📝 Step-by-Step Breakdown

### Step 1: Create LWC Component
- **JS**: Define properties, wire Apex method, handle data
- **HTML**: Display data in Lightning cards with responsive layout
- **Meta XML**: Expose component for App Builder

### Step 2: Create Apex Controller
- Define `@AuraEnabled(cacheable=true)` method
- Query Broker__c with related Properties__r
- Calculate statistics (count, sum)
- Return wrapper class with calculated data

### Step 3: Create Lightning Page
- Define FlexiPage with template
- Add component to page region
- Set page type to `AppPage`

### Step 4: Create Custom Tab
- Reference the FlexiPage
- Set icon and label
- Add description

### Step 5: Add to Application
- Edit Dreamhouse.app-meta.xml
- Add `<tabs>Broker_Dashboard</tabs>` to navigation

---

## 🔍 Key Concepts Used

1. **@wire Decorator**: Reactive data binding from Apex
2. **Lightning Data Service**: Automatic caching
3. **Lightning Message Service**: Not used here (single component)
4. **Apex SOQL**: Subquery to get related records
5. **Wrapper Class**: Custom data structure for frontend
6. **Lightning Base Components**: 
   - `lightning-card`
   - `lightning-avatar`
   - `lightning-badge`
   - `lightning-formatted-number`
   - `lightning-layout`

---

## 🛠️ Troubleshooting

### Component Not Showing in App Builder
- Check `brokerDashboard.js-meta.xml` has correct targets
- Ensure `isExposed` is `true`

### Apex Error
- Verify Broker__c relationship name is `Properties__r`
- Check field API names (Title__c, Picture__c, Price__c)

### Tab Not Appearing
- Refresh the app
- Check user has permission to see custom tabs
- Verify tab is added to `Dreamhouse.app-meta.xml`

### Data Not Loading
- Check if brokers exist in org
- Verify field-level security for custom fields
- Open browser console for JavaScript errors

---

## 📚 Learn More

- [Lightning Web Components Guide](https://developer.salesforce.com/docs/component-library/documentation/en/lwc)
- [Lightning App Builder](https://help.salesforce.com/s/articleView?id=sf.lightning_app_builder.htm)
- [Apex Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/)

---

## ✅ Summary

You've successfully added a new page to Dreamhouse! This same pattern can be used to add any custom page:

1. **Create LWC** (display logic)
2. **Create Apex** (data logic)  
3. **Create FlexiPage** (page layout)
4. **Create Tab** (navigation)
5. **Update App** (add to menu)
6. **Deploy** (push to org)

Happy coding! 🎉
