# Braze Currents Message Engagement Block
This Currents Message Engagement Looker Block provides easy to set-up dashboards for common use cases with Braze's [Currents](https://www.braze.com/product/data-agility-management/currents/) Data Streaming product. This Block works with the [Message Engagement](https://www.braze.com/documentation/Partner_Integrations/#braze-currents) category of events only. For Blocks on User Behavior events only or User Behavior and Message Engagement, please refer to our other Blocks.

## Pre-requisites
This block assumes:

1. Your Braze integration is appropriately configured to capture and send the necessary data.
2. Currents is provisioned and set up for your account.
3. The data is being loaded into a Looker compatible [Data Warehouse](https://looker.com/solutions/other-databases).

## Data and Block Structure
* This Block is built on the Message Engagement category within [Braze's Currents Product](https://www.braze.com/documentation/Partner_Integrations/#customer-behavior-events)
* The current verson of this Block includes includes funnel analysis, email performance, message engagement, email messaging cadence, email messaging frequency, push messaging cadence, and push messaging frequency. There are multiple visualizations housed in the Dashboards: an email funnel, a push funnel, an email performance dashboard, a message engagement dashboard, an email marketing pressure dashboard, and a push marketing pressure dashboard.
* Each event type is represented as its own View in Looker. The Model file joins the underlying Views into Explores. Dashboards are based on the most relevant data combinations, as well as core metrics.
  * While we have purposefully chosen these Explores and Dashboards, they are not the only possible options; they provide stepping stones for additional custom data analytics and exploration.
* The documentation for Currents can be found in the [Braze Documentation](https://www.braze.com/documentation/Partner_Integrations/#braze-currents). Please be aware of naming conventions.

## Additional Notes

#### SQL Dialect
* We built this Block using [Snowflake](https://www.snowflake.com/) as the data warehouse. While we aim for this block to be data warehouse agnostic, some SQL functions may differ in availability, syntax, or behavior across dialects. This is particularly relevant for our marketing pressure dashboards and explores (see below in V2 notes).

#### Content
* This Block only includes Currents Message Engagement Events, not User Behavior Events.

#### Commented-out code
* We've done the legwork to create the views for every event type in this Currents category but commented out views that are not used in Dashboards in the model. We encourage you to uncomment and build on our block for your own use cases. Please give us feedback!

#### Marketing Pressure Notes and Use Cases (Version 2 additions)
* If you do not have Snowflake, the marketing pressure dashboards _will not populate_ and the corresponding explores and views (namely, email_messaging_cadence, email_messaging_frequency, push_messaging_frequency, and push_messaging_cadence) will error out, as they are built off derived tables, which use custom SQL queries in Snowflake dialect. Comment them out to avoid these errors.
* When grouped by values that correspond to sends or deliveries (for example, delivery rank or send time), the calculated fields in these explores (opens or clicks), may sum up to be around 1 or 2% higher than expected. That's because there isn't a good way to link specific instances of a campaign or canvas message send to exactly when it was opened or clicked, causing some duplicates in those fields. For that reason, the dashboards are good _approximations_ of marketing pressure but won't give exact numbers.
* **Use Cases**:
  * **Messaging Cadence**: the email and push messaging cadence views are meant to give an approximation of the timeline on which your users are receiving email or push messages and how they are interacting with those messages. Some examples include: testing how a user responds to their first email vs. their second by using the rank dimension, seeing what the optimal amount of time between push messages might be using the days_since_last_received dimension, checking out the average amount of days between emails sent to any email address for a specific campaign, etc. If you would like to see the intended uses of one of these explores in action, go to one of the marketing pressure dashboards and click "Explore from here" on a tile classified under the "Email Cadence" header.
  * **Messaging Frequency**: the email and push messaging frequency views are meant to give an approximation of how a user interacts with your campaign or canvas if you send it x amount of times within a certain time period (we have daily, weekly, and monthly granularity). Group on frequency, set a date granularity, and see how often your users want to connect.

## Implementation

#### Looker User
Once you have loaded your Currents data into your data warehouse, you will need to create a Looker user for your database and grant it access to your Currents tables.

#### Connection Setup
Create a new [connection](https://docs.looker.com/setup-and-management/connecting-to-db) to the database that houses your Currents data. Alter the ```connection:``` parameter in the Looker Model accordingly. Be sure to specify the proper timezones for your database and queries.

#### Naming
Be aware of different naming conventions. If you've customized any View/table or model names, rename each in the LookML to the name you've selected. You can use a global Find & Replace for this (top right corner search bar that says "Find & Replace in Project").
