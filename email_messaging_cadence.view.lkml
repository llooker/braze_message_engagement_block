# Email Messaging Cadence
view: email_messaging_cadence {
  sql_table_name: PROD_ANALYTICS.ANALYTICS_PROCESSED.TBL_BRAZE_EMAIL_CADENCE ;;

  dimension: campaign_name {
    description: "campaign name if from a campaign"
    type: string
    sql: ${TABLE}."D_CAMPAIGN_NAME" ;;
  }

  dimension: canvas_name {
    description: "canvas name if from a canvas"
    type: string
    sql: ${TABLE}."D_CANVAS_NAME" ;;
  }

  dimension: canvas_step_id {
    description: "canvas step ID if from a canvas"
    type: string
    sql: ${TABLE}."D_CANVAS_STEP_ID" ;;
  }

  dimension: days_since_last_received {
    description: "amount of time (days) between each email message variation/canvas step delivered to an email address (null if campaign/canvas only has one send per email address)"
    type: number
    sql: ${TABLE}."DIFF_DAYS" ;;
  }

  dimension: days_since_last_received_tier {
    description: "time ranges (days) between each email message variation/canvas step delivered to an email address (null if campaign/canvas only has one send per email address)"
    type: tier
    hidden: yes
    sql: COALESCE(${TABLE}."DIFF_DAYS",0) ;;
    tiers: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,28]
    style: integer
  }

  dimension: email_address {
    description: "email address of the user"
    type: string
    sql: ${TABLE}."delivered_ADDRESS" ;;
  }

  dimension_group: first_delivered {
    description: "UTC time timestamp the first push was delivered to this user"
    type: time
    timeframes: [date, time]
    sql: ${TABLE}."FIRST_DELIVERED" ;;
  }

  dimension: message_variation_id {
    description: "message variation ID if from a campaign"
    type: string
    sql: ${TABLE}."D_MESSAGE_VARIATION_ID" ;;
  }

  dimension_group: delivery {
    description: "UTC time timestamp the email was delivered"
    type: time
    timeframes: [date, time, hour_of_day]
    sql: ${TABLE}."DELIVERED_TIMESTAMP" ;;
  }

  dimension: delivery_event {
    description: "time-based ranking (1st, 2nd, 3rd, etc.) of message variations/canvas steps delivered to an email address"
    type: number
    sql: ${TABLE}."DELIVERY_EVENT" ;;
  }

  dimension: weeks_since_last_received {
    description: "amount of time (weeeks) between each email message variation/canvas step delivered to an email address (null if campaign/canvas only has one send per email address)"
    type: number
    sql: ${TABLE}."DIFF_WEEKS" ;;
  }

  dimension: weeks_since_last_received_tier {
    description: "time ranges (weeks) between each email message variation/canvas step delivered to an email address (null if campaign/canvas only has one send per email address)"
    type: tier
    hidden: yes
    sql: COALESCE(${TABLE}."DIFF_WEEKS",0) ;;
    tiers: [1,2,3,4,5,6,7,8,9,10,11,12,13,23,33,52]
    style: integer
  }

  measure: average_number_of_days_since_last_received {
    description: "average amount of time (days) between each email message variation/canvas step delivered to an email address (null if campaign/canvas only has one send per email address)"
    type: average
    value_format_name: decimal_0
    sql: ${TABLE}."DIFF_DAYS";;
  }

  measure: count_distinct_email_address {
    description: "distinct count of email addresses"
    type: count_distinct
    sql: ${TABLE}."DELIVERED_ADDRESS" ;;
  }

  measure: emails_delivered {
    description: "distinct count of delivery ids"
    type: count_distinct
    sql: ${TABLE}."DELIVERED_ID" ;;
  }

  measure: unique_clicks {
    description: "distinct count of campaigns/canvases clicked per email address; may differ by less than 1% due to inability to link exact instances of emails delivered to emails clicked"
    type: number
    sql: count(distinct ${TABLE}."CLICK_ADDRESS", ${TABLE}."C_MESSAGE_VARIATION_ID")
    +count(distinct ${TABLE}."CLICK_ADDRESS", ${TABLE}."C_CANVAS_STEP_ID") ;;
  }

  measure: unique_opens {
    description: "distinct count of campaigns/canvases opened per email address; may differ by less than 1% due to inability to link exact instances of emails delivered to emails opened"
    type: number
    sql: count(distinct ${TABLE}."OPEN_ADDRESS", ${TABLE}."O_MESSAGE_VARIATION_ID")
    +count(distinct ${TABLE}."OPEN_ADDRESS", ${TABLE}."O_CANVAS_STEP_ID") ;;
  }

  measure: unique_open_rate {
    description: "email unique opens/deliveries"
    type: number
    value_format_name: percent_2
    sql: ${unique_opens}/${emails_delivered} ;;
  }

  measure: unique_click_rate {
    description: "email unique opens/deliveries"
    type: number
    value_format_name: percent_2
    sql: ${unique_clicks}/${emails_delivered} ;;
  }
}
