# Push Messaging Cadence
view: push_messaging_cadence {
  sql_table_name: PROD_ANALYTICS.ANALYTICS_PROCESSED.TBL_BRAZE_PUSH_CADENCE ;;
  }

  dimension_group: send {
    description: "UTC time timestamp the push was sent"
    type: time
    timeframes: [date, time]
    sql: ${TABLE}."SEND_TIMESTAMP" ;;
  }

  dimension: user_id {
    description: "Braze id of the user"
    type: string
    sql: ${TABLE}."SEND_USER_ID" ;;
  }

  dimension: message_variation_id {
    description: "message variation id if from a campaign"
    type: string
    sql: ${TABLE}."S_MESSAGE_VARIATION_ID" ;;
  }

  dimension: canvas_step_id {
    description: "canvas step id if from a canvas"
    type: string
    sql: ${TABLE}."S_CANVAS_STEP_ID" ;;
  }

  dimension: campaign_name {
    description: "campaign name if from a campaign"
    type: string
    sql: ${TABLE}."S_CAMPAIGN_NAME" ;;
  }

  dimension: canvas_name {
    description: "canvas name if from a canvas"
    type: string
    sql: ${TABLE}."S_CANVAS_NAME" ;;
  }

  dimension: send_id {
    description: "id of the message if specified for the campaign"
    hidden: yes
    type: string
    sql: ${TABLE}."SEND_ID" ;;
  }

  dimension: send_event {
    description: "time-based ranking (1st, 2nd, 3rd, etc.) of message variations/canvas steps sent to a user"
    type: number
    sql: ${TABLE}."SEND_EVENT" ;;
  }

  dimension_group: first_sent {
    description: "UTC time timestamp the first push was sent to this user"
    type: time
    timeframes: [date, time]
    sql: ${TABLE}."FIRST_SENT" ;;
  }

  dimension: days_since_last_sent {
    description: "amount of time (days) between each push message variation/canvas step sent to an push address (null if campaign/canvas only has one send per user id)"
    type: number
    sql: ${TABLE}."DIFF_DAYS" ;;
  }

  dimension: days_since_last_sent_tier {
    description: "time ranges (days) between each push message variation/canvas step sent to an push address (null if campaign/canvas only has one send per user id)"
    type: tier
    hidden: yes
    sql: COALESCE(${TABLE}."DIFF_DAYS",0) ;;
    tiers: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,28]
    style: integer
  }

  dimension: platform {
    description: "platform of the device (iOS, Android, web, etc.)"
    type: string
    sql: ${TABLE}."S_PLATFORM" ;;
  }

  dimension: weeks_since_last_sent {
    description: "amount of time (weeeks) between each push message variation/canvas step sent to a user (null if campaign/canvas only has one send per user)"
    type: number
    sql: ${TABLE}."DIFF_WEEKS" ;;
  }

  dimension: weeks_since_last_sent_tier {
    description: "time ranges (weeks) between each push message variation/canvas step sent to a user (null if campaign/canvas only has one send per user)"
    type: tier
    hidden: yes
    sql: COALESCE(${TABLE}."DIFF_WEEKS",0) ;;
    tiers: [1,2,3,4,5,6,7,8,9,10,11,12,13,23,33,52]
    style: integer
  }

  measure: average_number_of_days_since_last_sent {
    description: "average amount of time (days) between each push message variation/canvas step sent to a user id (null if campaign/canvas only has one send per user)"
    type: average
    value_format_name: decimal_0
    sql: ${TABLE}."DIFF_DAYS";;
  }

  measure: bounced_recipients {
    description: "distinct count of users whose message was bounced"
    hidden: yes
    type: count_distinct
    sql: ${TABLE}."BOUNCE_USER_ID";;
  }

  measure: push_bounces {
    description: "distinct count of campaigns/canvases bounced per email address; calculated sum may differ from expected (higher is expected) by less than 1% due to limitations on linking specific send instances to bounce instances"
    type: count_distinct
    sql: CASE WHEN ${TABLE}."MIN_BOUNCE_DIFFERENCE"=TRUE THEN ${TABLE}."BOUNCE_ID" ELSE NULL END ;;
  }

  measure: push_delivered {
    description: "push sent-push bounces; calculated sum may be differ from expected (lower is expected) by less than 1% due to limitations on linking specific send instances to bounce instances"
    type: number
    sql: COALESCE(${push_sent},0)-COALESCE(${push_bounces},0) ;;
  }

  measure: push_open_rate {
    description: "push opens/push delivered"
    type: number
    value_format_name: percent_2
    sql: ${push_opens}/NULLIF(${push_delivered},0) ;;
  }

  measure: push_opens {
    description: "distinct count of campaigns/canvases opened per email address; calculated sum may differ from expected (higher is expected) by less than 1% due to limitations on linking specific send instances to bounce instances"
    type: count_distinct
    sql: CASE WHEN ${TABLE}."MIN_OPEN_DIFFERENCE"=TRUE THEN ${TABLE}."OPEN_ID" ELSE NULL END ;;
  }

  measure: push_sent {
    description: "total number of push messages sent; should not differ from expected"
    type: count_distinct
    sql: ${TABLE}."SEND_ID" ;;
  }

  measure: sent_recipients {
    description: "distinct count of users that were sent a campaign"
    hidden: yes
    type: count_distinct
    sql: ${TABLE}."SEND_USER_ID" ;;
  }

  measure: unique_recipients {
    description: "distinct count of users that received a push campaign (the campaign was not bounced)"
    type: number
    sql: COALESCE(${sent_recipients},0)-COALESCE(${bounced_recipients},0) ;;
  }
}
