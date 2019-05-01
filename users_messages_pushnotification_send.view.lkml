# Push Send Events
view: users_messages_pushnotification_send {
  sql_table_name: PUBLIC.USERS_MESSAGES_PUSHNOTIFICATION_SEND ;;

  dimension: id {
    primary_key: yes
    description: "unique ID of the event"
    hidden: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: app_id {
    description: "id of the app on which the user action occurred"
    type: string
    sql: ${TABLE}."APP_ID" ;;
  }

  dimension: campaign_id {
    description: "id of the campaign if from a campaign"
    type: string
    sql: ${TABLE}."CAMPAIGN_ID" ;;
  }

  dimension: campaign_name {
    description: "name of the campaign"
    type: string
    sql: ${TABLE}."CAMPAIGN_NAME" ;;
  }

  dimension: canvas_id {
    description: "id of the Canvas if from a Canvas"
    type: string
    sql: ${TABLE}."CANVAS_ID" ;;
  }

  dimension: canvas_name {
    description: "canvas name"
    type: string
    sql: ${TABLE}."CANVAS_NAME" ;;
  }

  dimension: canvas_step_id {
    description: "id of the step for this message if from a Canvas"
    type: string
    sql: ${TABLE}."CANVAS_STEP_ID" ;;
  }

  dimension: canvas_variation_id {
    description: "id of the Canvas variation the user is in if from a Canvas"
    type: string
    sql: ${TABLE}."CANVAS_VARIATION_ID" ;;
  }

  dimension: device_id {
    description: "id of the device that we made a delivery attempt to"
    type: string
    sql: ${TABLE}."DEVICE_ID" ;;
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

  dimension: platform {
    description: "platform of the device (iOS, Android, web, etc.)"
    type: string
    sql: ${TABLE}."PLATFORM" ;;
  }

  dimension: send_id {
    description: "id of the message if specified for the campaign"
    hidden: yes
    type: string
    sql: ${TABLE}."SEND_ID" ;;
  }

  dimension_group: push_sent_time {
    description: "timestamp of the push sent event"
    type: time
    datatype: epoch
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      hour_of_day,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."TIME" ;;
  }

  dimension: push_sent_timezone {
    description: "IANA timezone of the user at the time of the push sent event"
    hidden: yes
    type: string
    sql: ${TABLE}."TIMEZONE" ;;
  }

  dimension: user_id {
    description: "Braze user id"
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: push_delivered {
    description: "push sent - push bounces"
    type: number
    sql: COALESCE(${push_sent},0)-COALESCE(${users_messages_pushnotification_bounce.push_bounces},0);;
  }

  measure: push_delivery_rate {
    description: "push delivered/push sent"
    type: number
    value_format_name: percent_2
    sql: ${push_delivered}/NULLIF(${users_messages_pushnotification_send.push_sent},0) ;;
  }

  measure: push_sent {
    description: "distinct count of push send events"
    type: count_distinct
    sql: ${TABLE}."ID" ;;
  }

  measure: sent_recipients {
    description: "distinct count of users that were sent a push"
    hidden: yes
    type: count_distinct
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: unique_recipients {
    description: "distinct count of users that received a push campaign (the campaign was not bounced)"
    type: number
    sql: COALESCE(${sent_recipients},0)-COALESCE(${users_messages_pushnotification_bounce.bounced_recipients},0) ;;
  }
}
