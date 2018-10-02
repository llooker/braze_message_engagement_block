# Campaign Conversions
view: users_campaigns_conversion {
  sql_table_name: PUBLIC.USERS_CAMPAIGNS_CONVERSION ;;

  dimension: id {
    primary_key: yes
    description: "unique id of this event"
    hidden: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: app_id {
    description: "id of the app"
    type: string
    sql: ${TABLE}."APP_ID" ;;
  }

  dimension: campaign_id {
    description: "id of the campaign"
    type: string
    sql: ${TABLE}."CAMPAIGN_ID" ;;
  }

  dimension: campaign_name {
    description: "name of the campaign"
    type: string
    sql: ${TABLE}."CAMPAIGN_NAME" ;;
  }

# the below dimensions use Snowflake syntax to turn a json string into code that can be queried.
# use the proper code for your SQL dialect.
  dimension: conversion_behavior {
    description: "JSON-encoded string describing the conversion behavior"
    hidden: yes
    type: string
    sql: parse_json(${TABLE}."CONVERSION_BEHAVIOR");;
  }

  dimension: conversion_behavior_index {
    description: "index of the conversion behavior"
    hidden: yes
    type: number
    sql: ${TABLE}."CONVERSION_BEHAVIOR_INDEX" ;;
  }

  dimension: conversion_behavior_type {
    description: "type of the conversion behavior"
    type: string
    sql: ${conversion_behavior}:type::STRING ;;
  }

  dimension: conversion_window {
    description: "window of time to perform the conversion behavior in seconds"
    type: number
    sql: ${conversion_behavior}:window::NUMBER ;;
  }

  dimension: conversion_custom_event_name {
    description: "if the conversion was a custom event, the name of custom event"
    type: string
    sql: ${conversion_behavior}:custom_event_name::STRING ;;
  }

  dimension_group: converted_time {
    description: "timestamp of the conversion"
    type: time
    datatype: epoch
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."TIME" ;;
  }

  dimension: converted_timezone {
    description: "IANA timezone of the user at the time of the event"
    hidden: yes
    type: string
    sql: ${TABLE}."TIMEZONE" ;;
  }

  dimension: external_user_id {
    description: "External ID of the user"
    type: string
    sql: ${TABLE}."EXTERNAL_USER_ID" ;;
  }

  dimension: message_variation_id {
    description: "id of the message variation if from a campaign"
    type: string
    sql: ${TABLE}."MESSAGE_VARIATION_ID" ;;
  }

  dimension: send_id {
    description: "id of the message if specified for the campaign"
    hidden: yes
    type: string
    sql: ${TABLE}."SEND_ID" ;;
  }

  dimension: user_id {
    description: "Braze user ID"
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  dimension: user_in_control {
    description: "is this user in the control group for this campaign"
    type: yesno
    sql: ${users_campaigns_enrollincontrol.user_id}=${user_id}
         AND
         ${users_campaigns_enrollincontrol.message_variation_id}=${message_variation_id};;
  }

  measure: campaign_conversion_event_count {
    description: "distinct count of campaign conversion behavior event IDs"
    type: count_distinct
    sql: ${TABLE}."ID" ;;
  }

  measure: unique_users_that_converted_on_a_campaign {
    description: "distinct count of Braze user IDs who converted on a campaign"
    type: count_distinct
    sql: ${TABLE}."USER_ID" ;;
  }
}
