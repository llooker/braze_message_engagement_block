# Email Click Events
view: users_messages_email_click {
  sql_table_name: PUBLIC.USERS_MESSAGES_EMAIL_CLICK ;;

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

  dimension_group: email_clicked_time {
    description: "timestamp of the email click event"
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

  dimension: email_clicked_timezone {
    description: "IANA timezone of the user at the time of the email click event"
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

  dimension: user_agent_click {
    description: "description of the user's system and browser for the click event (only use with click measures)"
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

  measure: email_total_clicks {
    description: "distinct count of email click events (counts users opening an email more than once)"
    type: count_distinct
    sql: ${TABLE}."ID" ;;
  }

  measure: email_total_click_rate {
    description: "total clicks/emails delivered--may be over 100% at the user level"
    type: number
    value_format_name: percent_2
    sql: ${email_total_clicks}/NULLIF(${users_messages_email_send.emails_sent},0) ;;
  }

  measure: email_unique_clicks_mvid {
    type: count_distinct
    hidden: yes
    sql: ${TABLE}."EMAIL_ADDRESS", ${TABLE}."MESSAGE_VARIATION_ID" ;;
  }

  measure: email_unique_clicks_csid {
    type: count_distinct
    hidden: yes
    sql: ${TABLE}."EMAIL_ADDRESS", ${TABLE}."CANVAS_STEP_ID" ;;
  }

  measure: email_unique_clicks {
    description: "distinct count of times a recipient clicked an email campaign or canvas (does not count the same person clicking the same campaign or canvas more than once)"
    type: number
    sql: ${email_unique_clicks_mvid}+${email_unique_clicks_csid} ;;
  }

  measure: email_unique_click_rate {
    description: "unique clicks/emails delivered"
    type: number
    value_format_name: percent_2
    sql:${email_unique_clicks}/NULLIF(${users_messages_email_delivery.emails_delivered},0) ;;
  }
}
