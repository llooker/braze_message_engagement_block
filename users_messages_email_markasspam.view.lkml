# Email Marked as Spam Events
view: users_messages_email_markasspam {
  sql_table_name: PUBLIC.USERS_MESSAGES_EMAIL_MARKASSPAM ;;

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

  dimension_group: email_marked_as_spam_time {
    description: "timestamp the email was marked as spam"
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

  dimension: email_marked_as_spam_timezone {
    description: "IANA timezone of the user at the time of the event"
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

  dimension: user_agent_marked_as_spam {
    description: "description of the user's system and browser for the marked as spam event (only use for marked as spam events)"
    hidden: yes
    type: string
    sql: ${TABLE}."USER_AGENT" ;;
  }

  dimension: user_id {
    description: "Braze id of the user"
    hidden: yes
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: emails_marked_as_spam {
    description: "distinct count of marked-as-spam event IDs"
    type: count_distinct
    sql: ${TABLE}."ID" ;;
  }

  measure: marked_as_spam_rate {
    description: "emails marked as spam/emails sent"
    type: number
    value_format_name: percent_2
    sql: ${emails_marked_as_spam}/NULLIF(${users_messages_email_send.emails_sent},0) ;;
  }
}
