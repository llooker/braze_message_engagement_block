# iOS Foreground Events
view: users_messages_pushnotification_iosforeground {
  sql_table_name: PUBLIC.USERS_MESSAGES_PUSHNOTIFICATION_IOSFOREGROUND ;;

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
    description: "id of the canvas if from a canvas"
    hidden: yes
    type: string
    sql: ${TABLE}."CANVAS_ID" ;;
  }

  dimension: canvas_name {
    description: "name of the canvas"
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

  dimension_group: ios_foreground_time {
    description: "timestamp of the iOS foreground open event"
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

  dimension: ios_foreground_timezone {
    description: "IANA timezone of the user at the time of the iOS foreground open event"
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

  measure: ios_foreground_opens {
    description: "distinct count of iOS foregound open events"
    type: count_distinct
    sql: ${TABLE}."ID" ;;
  }
}
