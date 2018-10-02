# Braze Currents Message Engagement Block
This Currents Message Engagement Looker Block provides easy to set-up dashboards for common use cases with Braze's [Currents](https://www.braze.com/product/data-agility-management/currents/) Data Streaming product. This Block is works with the [Message Engagement](https://www.braze.com/documentation/Partner_Integrations/#braze-currents) category of events only. For Blocks on User Behavior events only or User Behavior and Message Engagement, please refer to our other Blocks.

## Pre-requisites
This block assumes:

1. Your Braze integration is appropriately configured to capture and send the necessary data.
2. Currents is provisioned and set up for your account.
3. The data is being loaded into a Looker compatible [Data Warehouse](https://looker.com/solutions/other-databases).

## Data and Block Structure
* This Block is built on the User Behavior category within [Braze's Currents Product](https://www.braze.com/documentation/Partner_Integrations/#customer-behavior-events)
* The first release of this Block includes funnel analysis, email performance, and message engagement. There are four visualizations housed in the Dashboards: an email funnel, a push funnel, an email performance dashboard, and a message engagement dashboard.
* Each event type is represented as its own View in Looker. The Model file joins the underlying Views into Explores. Dashboards are based on the most relevant data combinations, as well as core metrics.
  * While we have purposefully chosen these Explores and Dashboards, they are not the only possible options; they provide stepping stones for additional custom data analytics and exploration.
* The documentation for Currents can be found in the [Braze Documentation](https://www.braze.com/documentation/Partner_Integrations/#braze-currents). Please be aware of naming conventions.

## Additional Notes

#### SQL Dialect
* We built this Block using [Snowflake](https://www.snowflake.com/) as the data warehouse. While we aim for this block to be data warehouse agnostic, some SQL functions may differ in availability, syntax, or behavior across dialects.

#### Content
* This Block only includes Currents Message Engagement Events, not User Behavior Events.

#### Commented-out code
* We've done the legwork to create the views for every event type in this Currents category but commented out views that are not used in Dashboards in the model. We encourage you to uncomment and build on our block for your own use cases. Please give us feedback!

## Implementation

#### Looker User
Once you have loaded your Currents data into your data warehouse, you will need to create a Looker user for your database and grant it access to your Currents tables.

#### Connection Setup
Create a new [connection](https://docs.looker.com/setup-and-management/connecting-to-db) to the database that houses your Currents data. Alter the ```connection:``` parameter in the Looker Model accordingly.

#### Naming
Be aware of different naming conventions. If you've customized any View/table or model names, rename each in the LookML to the name you've selected. You can use a global Find & Replace for this (top right corner search bar that says "Find & Replace in Project").
