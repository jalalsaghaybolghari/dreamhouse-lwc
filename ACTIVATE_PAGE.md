# 🔧 Activate Broker Dashboard Page

The page was deployed but needs to be **activated** in Salesforce. Follow these steps:

## Option 1: Activate via Lightning App Builder (Recommended)

1. **Open Setup**
   - Click the ⚙️ gear icon (top right)
   - Click **Setup**

2. **Open Lightning App Builder**
   - In Quick Find box, type: `Lightning App Builder`
   - Click **Lightning App Builder**

3. **Find and Open Your Page**
   - Look for **"Broker Dashboard"** in the list
   - Click on it to open in App Builder

4. **Activate the Page**
   - Click **Activation...** button (top right)
   - Click **Activate**
   - Under "Lightning Experience", click **Add Page to App**
   - Select **Dreamhouse** app
   - Click **Add** then **Save**

5. **Refresh and Test**
   - Go back to Dreamhouse app
   - You should now see the Broker Dashboard tab

---

## Option 2: Use Existing Working Page as Template

Since the deployment shows "Page does not exist", let's verify the page is correctly set up.

Run this command to check what pages exist:

```bash
sf org open --path /lightning/setup/FlexiPageList/home
```

This opens the Lightning Pages list. Look for "Broker Dashboard" - if it's there but not working, we may need to recreate it.

---

## Option 3: Alternative - Create Page in UI

If the above doesn't work, create the page manually:

1. **Setup → Lightning App Builder → New**
2. Choose **App Page**
3. Label: `Broker Dashboard`
4. Click **Next**
5. Choose a template (e.g., "One Region")
6. Click **Finish**
7. **Drag the `brokerDashboard` component** from the left panel onto the page
8. Click **Save**
9. Click **Activation...**
10. Add to **Dreamhouse** app as a tab
11. Save and activate

---

## Quick Test Command

Try opening the page directly with this command:

```bash
sf org open --path /lightning/app/Dreamhouse/Broker_Dashboard
```

Or this one:

```bash
sf org open --path /lightning/setup/FlexiPageList/home
```

---

## 🐛 Debug: Check What Was Deployed

```bash
# List all FlexiPages in org
sf data query --query "SELECT Id, MasterLabel, DeveloperName FROM FlexiPage WHERE DeveloperName = 'Broker_Dashboard'" --use-tooling-api

# List all Custom Tabs
sf data query --query "SELECT Id, Name, Label FROM CustomTab WHERE Name = 'Broker_Dashboard'" --use-tooling-api
```

---

Let me know what you see and I can help further! 🎯
