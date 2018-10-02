# Push Open Events
view: users_messages_pushnotification_open {
  sql_table_name: PUBLIC.USERS_MESSAGES_PUSHNOTIFICATION_OPEN ;;

  dimension: id {
    primary_key: yes
    description: "unique ID of the event"
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

  dimension: button_action_type {
    description: "Action type of the push notification button. One of [URI, DEEP_LINK, NONE, CLOSE, SHARE]. null if not from a button click"
    type: string
    sql: ${TABLE}."BUTTON_ACTION_TYPE" ;;
  }

  dimension: button_string {
    description: "identifier (button_string) of the push notification button clicked. null if not from a button click"
    type: string
    sql: ${TABLE}."BUTTON_STRING" ;;
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

  dimension: device_model {
    description: "hardware model of the device"
    hidden: yes
    type: string
    sql: ${TABLE}."DEVICE_MODEL" ;;
  }

  dimension: external_user_id {
    description: "external ID of the user"
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

  dimension: os_version {
    description: "os version of device used for the action"
    hidden: yes
    type: string
    sql: ${TABLE}."OS_VERSION" ;;
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

  dimension_group: push_opened_time {
    description: "timestamp of the push open event"
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

  dimension: push_opened_timezone {
    description: "IANA timezone of the user at the time of the push open event"
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

  measure: push_opens {
    description: "distinct count of push open events"
    type: count_distinct
    sql: ${TABLE}."ID" ;;
  }

  measure: push_open_rate {
    description: "push opens/push delivered"
    type: number
    value_format_name: percent_2
    sql: ${push_opens}/NULLIF(${users_messages_pushnotification_send.push_delivered},0) ;;
  }
}
