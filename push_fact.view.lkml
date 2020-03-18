# Push Fact
view: push_fact {
  view_label: "Push Events"
  sql_table_name: PROD_ANALYTICS.ANALYTICS_PROCESSED.TBL_BRAZE_PUSH_FACT ;;

  #########################################
  #             SEND
  #########################################

  dimension: send_id {
    primary_key: yes
    description: "unique ID of the event"
    hidden: yes
    type: string
    sql: ${TABLE}."SEND_ID" ;;
  }

  dimension: send_app_id {
    description: "id of the app on which the user action occurred"
    type: string
    sql: ${TABLE}."SEND_APP_ID" ;;
  }

  dimension: send_campaign_id {
    description: "id of the campaign if from a campaign"
    type: string
    sql: ${TABLE}."SEND_CAMPAIGN_ID" ;;
  }

  dimension: send_campaign_name {
    description: "name of the campaign"
    type: string
    sql: ${TABLE}."SEND_CAMPAIGN_NAME" ;;
  }

  dimension: send_canvas_id {
    description: "id of the Canvas if from a Canvas"
    type: string
    sql: ${TABLE}."SEND_CANVAS_ID" ;;
  }

  dimension: send_canvas_name {
    description: "canvas name"
    type: string
    sql: ${TABLE}."SEND_CANVAS_NAME" ;;
  }

  dimension: send_canvas_step_id {
    description: "id of the step for this message if from a Canvas"
    type: string
    sql: ${TABLE}."SEND_CANVAS_STEP_ID" ;;
  }

  dimension: send_canvas_variation_id {
    description: "id of the Canvas variation the user is in if from a Canvas"
    type: string
    sql: ${TABLE}."SEND_CANVAS_VARIATION_ID" ;;
  }

  dimension: send_device_id {
    description: "id of the device that we made a delivery attempt to"
    type: string
    sql: ${TABLE}."SEND_DEVICE_ID" ;;
  }

  dimension: send_external_user_id {
    description: "External ID of the user"
    hidden: yes
    type: string
    sql: ${TABLE}."SEND_EXTERNAL_USER_ID" ;;
  }

  dimension: send_message_variation_id {
    description: "id of the message variation if from a campaign"
    type: string
    sql: ${TABLE}."SEND_MESSAGE_VARIATION_ID" ;;
  }

  dimension: send_platform {
    description: "platform of the device (iOS, Android, web, etc.)"
    type: string
    sql: ${TABLE}."SEND_PLATFORM" ;;
  }

  dimension: send_send_id {
    description: "id of the message if specified for the campaign"
    hidden: yes
    type: string
    sql: ${TABLE}."SEND_SEND_ID" ;;
  }

  dimension_group: push_sent_time {
    description: "timestamp of the push sent event"
    type: time
     
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
    sql: ${TABLE}."SEND_TIME" ;;
  }

  dimension: send_push_sent_timezone {
    description: "IANA timezone of the user at the time of the push sent event"
    hidden: yes
    type: string
    sql: ${TABLE}."SEND_TIMEZONE" ;;
  }

  dimension: send_user_id {
    description: "Braze user id"
    type: string
    sql: ${TABLE}."SEND_USER_ID" ;;
  }

  measure: push_delivered {
    description: "push sent - push bounces"
    type: number
    sql: COALESCE(${push_sent},0)-COALESCE(${push_bounces},0);;
  }

  measure: push_delivery_rate {
    description: "push delivered/push sent"
    type: number
    value_format_name: percent_2
    sql: ${push_delivered}/NULLIF(${push_sent},0) ;;
  }

  measure: push_sent {
    description: "distinct count of push send events"
    type: count_distinct
    sql: ${TABLE}."SEND_ID" ;;
  }

  measure: sent_recipients {
    description: "distinct count of users that were sent a push"
    hidden: yes
    type: count_distinct
    sql: ${TABLE}."SEND_USER_ID" ;;
  }

  measure: unique_recipients {
    description: "distinct count of users that received a push campaign (the campaign was not bounced)"
    type: number
    sql: COALESCE(${sent_recipients},0)-COALESCE(${bounced_recipients},0) ;;
  }

  #########################################
  #             OPEN
  #########################################
  
  dimension: open_id {
    description: "unique ID of the event"
    hidden: yes
    type: string
    sql: ${TABLE}."OPEN_ID" ;;
  }

  dimension: open_app_id {
    description: "id for the app on which the user action occurred"
    hidden: yes
    type: string
    sql: ${TABLE}."OPEN_APP_ID" ;;
  }

  dimension: open_button_action_type {
    description: "Action type of the push notification button. One of [URI, DEEP_LINK, NONE, CLOSE, SHARE]. null if not from a button click"
    type: string
    sql: ${TABLE}."OPEN_BUTTON_ACTION_TYPE" ;;
  }

  dimension: open_button_string {
    description: "identifier (button_string) of the push notification button clicked. null if not from a button click"
    type: string
    sql: ${TABLE}."OPEN_BUTTON_STRING" ;;
  }

  dimension: open_campaign_id {
    description: "id of the campaign if from a campaign"
    hidden: yes
    type: string
    sql: ${TABLE}."OPEN_CAMPAIGN_ID" ;;
  }

  dimension: open_campaign_name {
    description: "name of the campaign"
    hidden: yes
    type: string
    sql: ${TABLE}."OPEN_CAMPAIGN_NAME" ;;
  }

  dimension: open_canvas_id {
    description: "id of the Canvas if from a Canvas"
    hidden: yes
    type: string
    sql: ${TABLE}."OPEN_CANVAS_ID" ;;
  }

  dimension: open_canvas_name {
    description: "name of the Canvas"
    hidden: yes
    type: string
    sql: ${TABLE}."OPEN_CANVAS_NAME" ;;
  }

  dimension: open_canvas_step_id {
    description: "id of the step for this message if from a Canvas"
    hidden: yes
    type: string
    sql: ${TABLE}."OPEN_CANVAS_STEP_ID" ;;
  }

  dimension: open_canvas_variation_id {
    description: "id of the Canvas variation the user is in if from a Canvas"
    hidden: yes
    type: string
    sql: ${TABLE}."OPEN_CANVAS_VARIATION_ID" ;;
  }

  dimension: open_device_id {
    description: "id of the device that we made a delivery attempt to"
    hidden: yes
    type: string
    sql: ${TABLE}."OPEN_DEVICE_ID" ;;
  }

  dimension: open_device_model {
    description: "hardware model of the device"
    hidden: yes
    type: string
    sql: ${TABLE}."OPEN_DEVICE_MODEL" ;;
  }

  dimension: open_external_user_id {
    description: "external ID of the user"
    hidden: yes
    type: string
    sql: ${TABLE}."OPEN_EXTERNAL_USER_ID" ;;
  }

  dimension: open_message_variation_id {
    description: "id of the message variation if from a campaign"
    hidden: yes
    type: string
    sql: ${TABLE}."OPEN_MESSAGE_VARIATION_ID" ;;
  }

  dimension: open_os_version {
    description: "os version of device used for the action"
    hidden: yes
    type: string
    sql: ${TABLE}."OPEN_OS_VERSION" ;;
  }

  dimension: open_platform {
    description: "platform of the device (iOS, Android, web, etc.)"
    hidden: yes
    type: string
    sql: ${TABLE}."OPEN_PLATFORM" ;;
  }

  dimension: open_send_id {
    description: "id of the message if specified for the campaign"
    hidden: yes
    type: string
    sql: ${TABLE}."OPEN_SEND_ID" ;;
  }

  dimension_group: push_opened_time {
    description: "timestamp of the push open event"
    type: time
     
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
    sql: ${TABLE}."OPEN_TIME" ;;
  }

  dimension: open_push_opened_timezone {
    description: "IANA timezone of the user at the time of the push open event"
    hidden: yes
    type: string
    sql: ${TABLE}."OPEN_TIMEZONE" ;;
  }

  dimension: open_user_id {
    description: "Braze user id"
    hidden: yes
    type: string
    sql: ${TABLE}."OPEN_USER_ID" ;;
  }

  measure: push_opens {
    description: "distinct count of push open events"
    type: count_distinct
    sql: ${TABLE}."OPEN_ID" ;;
  }

  measure: push_open_rate {
    description: "push opens/push delivered"
    type: number
    value_format_name: percent_2
    sql: ${push_opens}/NULLIF(${push_delivered},0) ;;
  }

  #########################################
  #             BOUNCE
  #########################################

  dimension: bounce_id {
    description: "unique id of this event"
    hidden: yes
    type: string
    sql: ${TABLE}."BOUNCE_ID" ;;
  }

  dimension: bounce_app_id {
    description: "id for the app on which the user action occurred"
    hidden: yes
    type: string
    sql: ${TABLE}."BOUNCE_APP_ID" ;;
  }

  dimension: bounce_campaign_id {
    description: "id of the campaign if from a campaign"
    hidden: yes
    type: string
    sql: ${TABLE}."BOUNCE_CAMPAIGN_ID" ;;
  }

  dimension: bounce_campaign_name {
    description: "name of the campaign"
    hidden: yes
    type: string
    sql: ${TABLE}."BOUNCE_CAMPAIGN_NAME" ;;
  }

  dimension: bounce_canvas_id {
    description: "id of the Canvas if from a Canvas"
    hidden: yes
    type: string
    sql: ${TABLE}."BOUNCE_CANVAS_ID" ;;
  }

  dimension: bounce_canvas_name {
    description: "name of the Canvas"
    hidden: yes
    type: string
    sql: ${TABLE}."BOUNCE_CANVAS_NAME" ;;
  }

  dimension: bounce_canvas_step_id {
    description: "id of the step for this message if from a Canvas"
    hidden: yes
    type: string
    sql: ${TABLE}."BOUNCE_CANVAS_STEP_ID" ;;
  }

  dimension: bounce_canvas_variation_id {
    description: "id of the Canvas variation the user is in if from a Canvas"
    hidden: yes
    type: string
    sql: ${TABLE}."BOUNCE_CANVAS_VARIATION_ID" ;;
  }

  dimension: bounce_device_id {
    description: "id of the device that we made a delivery attempt to"
    hidden: yes
    type: string
    sql: ${TABLE}."BOUNCE_DEVICE_ID" ;;
  }

  dimension: bounce_external_user_id {
    description: "External ID of the user"
    hidden: yes
    type: string
    sql: ${TABLE}."BOUNCE_EXTERNAL_USER_ID" ;;
  }

  dimension: bounce_message_variation_id {
    description: "id of the message variation if from a campaign"
    hidden: yes
    type: string
    sql: ${TABLE}."BOUNCE_MESSAGE_VARIATION_ID" ;;
  }

  dimension: bounce_platform {
    description: "platform of the device (iOS, Android, web, etc.)"
    hidden: yes
    type: string
    sql: ${TABLE}."BOUNCE_PLATFORM" ;;
  }

  dimension: bounce_send_id {
    description: "id of the message if specified for the campaign"
    hidden: yes
    type: string
    sql: ${TABLE}."BOUNCE_SEND_ID" ;;
  }

  dimension_group: push_bounced_time {
    description: "timestamp of the push bounce event"
    type: time
     
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
    sql: ${TABLE}."BOUNCE_TIME" ;;
  }

  dimension: bounce_push_bounced_timezone {
    description: "IANA timezone of the user at the time of the push bounce event"
    hidden: yes
    type: string
    sql: ${TABLE}."BOUNCE_TIMEZONE" ;;
  }

  dimension: bounce_user_id {
    description: "Braze user id"
    hidden: yes
    type: string
    sql: ${TABLE}."BOUNCE_USER_ID" ;;
  }

  measure: bounced_recipients {
    description: "distinct count of intended push recipients whose push bounced"
    hidden: yes
    type: count_distinct
    sql: ${TABLE}."BOUNCE_USER_ID" ;;
  }

  measure: push_bounces {
    description: "distinct count of push bounce events"
    type: count_distinct
    sql: ${TABLE}."BOUNCE_ID" ;;
  }

  measure: push_bounce_rate {
    description: "push bounces/push sent"
    type: number
    value_format_name: percent_2
    sql: ${push_bounces}/NULLIF(${push_sent},0) ;;
  }
}
