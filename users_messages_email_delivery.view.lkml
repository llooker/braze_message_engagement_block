# Email Delivery Events
view: users_messages_email_delivery {
  sql_table_name: PUBLIC.USERS_MESSAGES_EMAIL_DELIVERY ;;

  dimension: id {
    primary_key: yes
    description: "unique id of this event"
    hidden: yes
    type: string
    sql: ${TABLE}."ID" ;;
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

  dimension: email_address {
    description: "email address for this event"
    hidden: yes
    type: string
    sql: ${TABLE}."EMAIL_ADDRESS" ;;
  }

  dimension_group: email_delivered_time {
    description: "timestamp of the email delivery"
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

  dimension: email_delivered_timezone {
    description: "IANA timezone of the user at the time the email was delivered"
    hidden: yes
    type: string
    sql: ${TABLE}."TIMEZONE" ;;
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

  dimension: send_id {
    description: "id of the message if specified for the campaign (See Send Identifier under REST API Parameter Definitions)"
    hidden: yes
    type: string
    sql: ${TABLE}."SEND_ID" ;;
  }

  dimension: sending_ip_delivery {
    description: "the IP address from which the message was sent (only use for email delivery measures)"
    hidden: yes
    type: string
    drill_fields: [campaign_name,campaign_id,message_variation_id,canvas_step_id]
    sql: ${TABLE}."SENDING_IP" ;;
  }

  dimension: user_id {
    description: "Braze id of the user"
    hidden: yes
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: emails_delivered {
    description: "distinct count of email delivery event IDs"
    type: count_distinct
    sql: ${TABLE}."ID" ;;
  }

  measure: email_delivery_rate {
    description: "emails delivered/emails sent"
    type: number
    value_format_name: percent_2
    sql:${emails_delivered}/NULLIF(${users_messages_email_send.emails_sent},0) ;;
  }

  measure: unique_recipients {
    description: "distinct count of email addresses that received an email campaign"
    type: count_distinct
    sql: ${TABLE}."EMAIL_ADDRESS" ;;
  }
}
