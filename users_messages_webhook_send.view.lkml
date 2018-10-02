# Webhook Send Events
view: users_messages_webhook_send {
  sql_table_name: PUBLIC.USERS_MESSAGES_WEBHOOK_SEND ;;

  dimension: id {
    primary_key: yes
    description: "unique id of this event"
    hidden: yes
    type: string
    sql: ${TABLE}."ID" ;;
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
    description: "name of the Canvas"
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
    description: "Braze user id"
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  dimension_group: webhook_sent_time {
    description: "timestamp of the webhook send event"
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

  dimension: webhook_sent_timezone {
    description: "IANA timezone of the user at the time of the webhook send event"
    hidden: yes
    type: string
    sql: ${TABLE}."TIMEZONE" ;;
  }

  measure: webhook_sent {
    description: "distinct count of webhook send events"
    type: count_distinct
    sql: ${TABLE}."ID" ;;
  }

  measure: user_count {
    description: "number of unique users to whom a webhook was sent"
    type: count_distinct
    sql: ${TABLE}."USER_ID" ;;
  }
}
