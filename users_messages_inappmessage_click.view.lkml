# In-App Message Click Events
view: users_messages_inappmessage_click {
  sql_table_name: PUBLIC.USERS_MESSAGES_INAPPMESSAGE_CLICK ;;

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

  dimension: button_id {
    description: "index of the button clicked, if it was a button that was clicked"
    type: string
    sql: ${TABLE}."BUTTON_ID" ;;
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

  dimension: card_id {
    description: "API ID of the card this in app message comes from"
    hidden: yes
    type: string
    sql: ${TABLE}."CARD_ID" ;;
  }

  dimension_group: click_time {
    description: "timestamp of the in-app-message click"
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

  dimension: click_timezone {
    description: "IANA timezone of the user at the time of the click event"
    hidden: yes
    type: string
    sql: ${TABLE}."TIMEZONE" ;;
  }

  dimension: device_id {
    description: "id of the device on which the event occurred"
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

  dimension: user_id {
    description: "Braze user id"
    hidden: yes
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: IAM_click_count {
    description: "distinct count of IAM click events"
    type: count_distinct
    sql: ${TABLE}."ID" ;;
  }

  measure: IAM_click_rate {
    description: "IAM click count/IAM impressions"
    type: number
    value_format_name: percent_2
    sql: ${IAM_click_count}/NULLIF(${users_messages_inappmessage_impression.IAM_impression_count},0) ;;
  }
}
