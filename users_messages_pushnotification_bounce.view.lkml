# Push Bounce Events
view: users_messages_pushnotification_bounce {
  sql_table_name: PUBLIC.USERS_MESSAGES_PUSHNOTIFICATION_BOUNCE ;;

  dimension: id {
    primary_key: yes
    description: "unique id of this event"
    hidden: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: app_id {
    description: "id for the app on which the user action occurred"
    hidden: yes
    type: string
    sql: ${TABLE}."APP_ID" ;;
  }

  dimension: campaign_id {
    description: "id of the campaign if from a campaign"
    hidden: yes
    type: string
    sql: ${TABLE}."CAMPAIGN_ID" ;;
  }

  dimension: campaign_name {
    description: "name of the campaign"
    hidden: yes
    type: string
    sql: ${TABLE}."CAMPAIGN_NAME" ;;
  }

  dimension: canvas_id {
    description: "id of the Canvas if from a Canvas"
    hidden: yes
    type: string
    sql: ${TABLE}."CANVAS_ID" ;;
  }

  dimension: canvas_name {
    description: "name of the Canvas"
    hidden: yes
    type: string
    sql: ${TABLE}."CANVAS_NAME" ;;
  }

  dimension: canvas_step_id {
    description: "id of the step for this message if from a Canvas"
    hidden: yes
    type: string
    sql: ${TABLE}."CANVAS_STEP_ID" ;;
  }

  dimension: canvas_variation_id {
    description: "id of the Canvas variation the user is in if from a Canvas"
    hidden: yes
    type: string
    sql: ${TABLE}."CANVAS_VARIATION_ID" ;;
  }

  dimension: device_id {
    description: "id of the device that we made a delivery attempt to"
    hidden: yes
    type: string
    sql: ${TABLE}."DEVICE_ID" ;;
  }

  dimension: external_user_id {
    description: "External ID of the user"
    hidden: yes
    type: string
    sql: ${TABLE}."EXTERNAL_USER_ID" ;;
  }

  dimension: message_variation_id {
    description: "id of the message variation if from a campaign"
    hidden: yes
    type: string
    sql: ${TABLE}."MESSAGE_VARIATION_ID" ;;
  }

  dimension: platform {
    description: "platform of the device (iOS, Android, web, etc.)"
    hidden: yes
    type: string
    sql: ${TABLE}."PLATFORM" ;;
  }

  dimension: send_id {
    description: "id of the message if specified for the campaign"
    hidden: yes
    type: string
    sql: ${TABLE}."SEND_ID" ;;
  }

  dimension_group: push_bounced_time {
    description: "timestamp of the push bounce event"
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

  dimension: push_bounced_timezone {
    description: "IANA timezone of the user at the time of the push bounce event"
    hidden: yes
    type: string
    sql: ${TABLE}."TIMEZONE" ;;
  }

  dimension: user_id {
    description: "Braze user id"
    hidden: yes
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: bounced_recipients {
    description: "distinct count of intended push recipients whose push bounced"
    hidden: yes
    type: count_distinct
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: push_bounces {
    description: "distinct count of push bounce events"
    type: count_distinct
    sql: ${TABLE}."ID" ;;
  }

  measure: push_bounce_rate {
    description: "push bounces/push sent"
    type: number
    value_format_name: percent_2
    sql: ${push_bounces}/NULLIF(${users_messages_pushnotification_send.push_sent},0) ;;
  }
}
