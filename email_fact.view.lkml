# Email Fact
view: email_fact {
  view_label: "Email Events"
  sql_table_name: PROD_ANALYTICS.ANALYTICS_PROCESSED.TBL_BRAZE_EMAIL_FACT ;;
  
  #########################################
  #                 SEND
  #########################################
  dimension: send_id {
    primary_key: yes
    description: "unique id of this event"
    hidden: yes
    type: string
    sql: ${TABLE}."SEND_ID" ;;
  }

  dimension: send_campaign_id {
    label: "Campaign ID"
    description: "id of the campaign if from a campaign"
    type: string
    sql: ${TABLE}."SEND_CAMPAIGN_ID" ;;
  }

  dimension: send_campaign_name {
    label: "Campaign Name"
    description: "name of the campaign"
    type: string
    sql: ${TABLE}."SEND_CAMPAIGN_NAME" ;;
  }

  dimension: send_canvas_id {
    label: "Canvas ID"
    description: "id of the canvas if from a canvas"
    type: string
    sql: ${TABLE}."SEND_CANVAS_ID" ;;
  }

  dimension: send_canvas_name {
    label: "Canvas Name"
    description: "name of the canvas"
    type: string
    sql: ${TABLE}."SEND_CANVAS_NAME" ;;
  }

  dimension: send_canvas_step_id {
    label: "Canvas Step ID"
    description: "id of the step for this message if from a Canvas"
    type: string
    sql: ${TABLE}."SEND_CANVAS_STEP_ID" ;;
  }

  dimension: send_canvas_variation_id {
    label: "Canvas Variation ID"
    description: "id of the Canvas variation the user is in if from a Canvas"
    type: string
    sql: ${TABLE}."SEND_CANVAS_VARIATION_ID" ;;
  }

  dimension: send_email_address {
    label: "Email Address"
    description: "email address for this event"
    type: string
    sql: ${TABLE}."SEND_EMAIL_ADDRESS" ;;
  }

  dimension_group: email_send_time {
    description: "timestamp of the email send"
    type: time
     
    timeframes: [
      raw,
      minute,
      minute10,
      minute20,
      minute30,
      hour,
      hour_of_day,
      time,
      date,
      week,
      day_of_week,
      week_of_year,
      day_of_month,
      month,
      quarter,
      quarter_of_year,
      month_num,
      year
    ]
    sql: ${TABLE}."SEND_TIME" ;;
  }

  dimension: send_email_send_timezone {
    description: "IANA timezone of the user at the time of the event"
    hidden: yes
    type: string
    sql: ${TABLE}."SEND_TIMEZONE" ;;
  }

  dimension: send_external_user_id {
    label: "External ID"
    description: "External ID of the user"
    type: string
    sql: ${TABLE}."SEND_EXTERNAL_USER_ID" ;;
  }

  dimension: send_message_variation_id {
    label: "Message Variation ID"
    description: "id of the message variation if from a campaign"
    type: string
    sql: ${TABLE}."SEND_MESSAGE_VARIATION_ID" ;;
  }

  dimension: send_send_id {
    description: "id of the message if specified for the campaign (See Send Identifier under REST API Parameter Definitions)"
    hidden: yes
    type: string
    sql: ${TABLE}."SEND_SEND_ID" ;;
  }

  dimension: send_user_id {
    description: "Braze id of the user"
    hidden: yes
    type: string
    sql: ${TABLE}."SEND_USER_ID" ;;
  }

  measure: emails_sent {
    group_label: "Sends"
    description: "distinct count of email send event IDs"
    type: count_distinct
    sql: ${TABLE}."SEND_ID" ;;
  }

  measure: send_unique_users {
    group_label: "Sends"
    description: "distinct count of email addresses that an email campaign was sended"
    type: count_distinct
    sql: ${TABLE}."SEND_EMAIL_ADDRESS" ;;
  }

  #########################################
  #                 DELIVERIES
  #########################################

  dimension: deliveries_id {
    description: "unique id of this event"
    hidden: yes
    type: string
    sql: ${TABLE}."DELIVERIES_ID" ;;
  }

  dimension: deliveries_campaign_id {
    description: "id of the campaign if from a campaign"
    hidden: yes
    type: string
    sql: ${TABLE}."DELIVERIES_CAMPAIGN_ID" ;;
  }

  dimension: deliveries_campaign_name {
    description: "name of the campaign"
    hidden: yes
    type: string
    sql: ${TABLE}."DELIVERIES_CAMPAIGN_NAME" ;;
  }

  dimension: deliveries_canvas_id {
    description: "id of the canvas if from a canvas"
    hidden: yes
    type: string
    sql: ${TABLE}."DELIVERIES_CANVAS_ID" ;;
  }

  dimension: deliveries_canvas_name {
    description: "name of the canvas"
    hidden: yes
    type: string
    sql: ${TABLE}."DELIVERIES_CANVAS_NAME" ;;
  }

  dimension: deliveries_canvas_step_id {
    description: "id of the step for this message if from a Canvas"
    hidden: yes
    type: string
    sql: ${TABLE}."DELIVERIES_CANVAS_STEP_ID" ;;
  }

  dimension: deliveries_canvas_variation_id {
    description: "id of the Canvas variation the user is in if from a Canvas"
    hidden: yes
    type: string
    sql: ${TABLE}."DELIVERIES_CANVAS_VARIATION_ID" ;;
  }

  dimension: deliveries_email_address {
    description: "email address for this event"
    hidden: yes
    type: string
    sql: ${TABLE}."DELIVERIES_EMAIL_ADDRESS" ;;
  }

  dimension_group: email_delivered_time {
    description: "timestamp of the email delivery"
    type: time
     
    timeframes: [
      raw,
      minute,
      minute10,
      minute20,
      minute30,
      hour,
      hour_of_day,
      time,
      date,
      week,
      day_of_week,
      week_of_year,
      day_of_month,
      month,
      quarter,
      quarter_of_year,
      month_num,
      year
    ]
    sql: ${TABLE}."DELIVERIES_TIME" ;;
  }

  dimension: deliveries_email_delivered_timezone {
    description: "IANA timezone of the user at the time the email was delivered"
    hidden: yes
    type: string
    sql: ${TABLE}."DELIVERIES_TIMEZONE" ;;
  }

  dimension: deliveries_external_user_id {
    description: "External ID of the user"
    hidden: yes
    type: string
    sql: ${TABLE}."DELIVERIES_EXTERNAL_USER_ID" ;;
  }

  dimension: deliveries_message_variation_id {
    description: "id of the message variation if from a campaign"
    hidden: yes
    type: string
    sql: ${TABLE}."DELIVERIES_MESSAGE_VARIATION_ID" ;;
  }

  dimension: deliveries_send_id {
    description: "id of the message if specified for the campaign (See Send Identifier under REST API Parameter Definitions)"
    hidden: yes
    type: string
    sql: ${TABLE}."DELIVERIES_SEND_ID" ;;
  }

  dimension: deliveries_sending_ip_delivery {
    description: "the IP address from which the message was sent (only use for email delivery measures)"
    hidden: yes
    type: string
    # drill_fields: [campaign_name,campaign_id,message_variation_id,canvas_step_id]
    sql: ${TABLE}."DELIVERIES_SENDING_IP" ;;
  }

  dimension: deliveries_user_id {
    description: "Braze id of the user"
    hidden: yes
    type: string
    sql: ${TABLE}."DELIVERIES_USER_ID" ;;
  }

  measure: emails_delivered {
    group_label: "Deliveries"
    description: "distinct count of email delivery event IDs"
    type: count_distinct
    sql: ${TABLE}."DELIVERIES_ID" ;;
  }

  measure: email_delivery_rate {
    group_label: "Deliveries"
    description: "emails delivered/emails sent"
    type: number
    value_format_name: percent_2
    sql:${emails_delivered}/NULLIF(${emails_sent},0) ;;
  }

  measure: deliveries_unique_users {
    group_label: "Deliveries"
    description: "distinct count of email addresses that received an email campaign"
    type: count_distinct
    sql: ${TABLE}."DELIVERIES_EMAIL_ADDRESS" ;;
  }

  #########################################
  #                 OPEN
  #########################################

  dimension: open_id {
    description: "unique id of this event"
    hidden: yes
    type: string
    sql: ${TABLE}."OPEN_ID" ;;
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
    description: "id of the canvas if from a canvas"
    hidden: yes
    type: string
    sql: ${TABLE}."OPEN_CANVAS_ID" ;;
  }

  dimension: open_canvas_name {
    description: "name of the canvas"
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

  dimension: open_email_address {
    description: "email address for this event"
    hidden: yes
    type: string
    sql: ${TABLE}."OPEN_EMAIL_ADDRESS" ;;
  }

  dimension_group: email_opened_time {
    description: "timestamp of the email open"
    type: time
     
    timeframes: [
      raw,
      minute,
      minute10,
      minute20,
      minute30,
      hour,
      hour_of_day,
      time,
      date,
      week,
      day_of_week,
      week_of_year,
      day_of_month,
      month,
      quarter,
      quarter_of_year,
      month_num,
      year
    ]
    sql: ${TABLE}."OPEN_TIME" ;;
  }

  dimension: open_email_opened_timezone {
    description: "IANA timezone of the user at the time of the event"
    hidden: yes
    type: string
    sql: ${TABLE}."OPEN_TIMEZONE" ;;
  }

  dimension: open_external_user_id {
    description: "External ID of the user"
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

  dimension: open_send_id {
    description: "id of the message if specified for the campaign (See Send Identifier under REST API Parameter Definitions)"
    hidden: yes
    type: string
    sql: ${TABLE}."OPEN_SEND_ID" ;;
  }

  dimension: open_user_agent_open {
    description: "description of the user's system and browser for the open event (only use with email open measures)"
    hidden: yes
    type: string
    sql: ${TABLE}."OPEN_USER_AGENT" ;;
  }

  dimension: open_user_id {
    description: "Braze id for this user"
    hidden: yes
    type: string
    sql: ${TABLE}."OPEN_USER_ID" ;;
  }

  measure: email_total_opens {
    group_label: "Opens"
    description: "distinct count of email open events (counts users opening an email more than once)"
    type: count_distinct
    sql: ${TABLE}."OPEN_ID" ;;
  }

  measure: email_total_open_rate {
    group_label: "Opens"
    description: "total opens/emails delivered--may be over 100% at the user level"
    type: number
    value_format_name: percent_2
    sql:${email_total_opens}/NULLIF(${emails_sent},0) ;;
  }

  measure: email_unique_opens_mvid {
    type: count_distinct
    hidden: yes
    sql: ${TABLE}."OPEN_EMAIL_ADDRESS", ${TABLE}."OPEN_MESSAGE_VARIATION_ID" ;;
  }

  measure: email_unique_opens_csid {
    type: count_distinct
    hidden: yes
    sql: ${TABLE}."OPEN_EMAIL_ADDRESS", ${TABLE}."OPEN_CANVAS_STEP_ID" ;;
  }

  measure: email_unique_opens {
    group_label: "Opens"
    description: "distinct count of times a recipient opened an email campaign or canvas (does not count the same person opening the same campaign or canvas more than once)"
    type: number
    sql: ${email_unique_opens_mvid}+${email_unique_opens_csid} ;;
  }

  measure: email_unique_open_rate {
    group_label: "Opens"
    description: "unique opens/emails delivered"
    type: number
    value_format_name: percent_2
    sql:${email_unique_opens}/NULLIF(${emails_delivered},0) ;;
  }

  measure: open_unique_users {
    group_label: "Opens"
    description: "distinct count of email addresses that opened an email campaign"
    type: count_distinct
    sql: ${TABLE}."OPEN_EMAIL_ADDRESS" ;;
  }

  #########################################
  #                 CLICK
  #########################################
  dimension: click_id {
    description: "unique id of this event"
    hidden: yes
    type: string
    sql: ${TABLE}."CLICK_ID" ;;
  }

  dimension: click_campaign_id {
    description: "id of the campaign if from a campaign"
    hidden: yes
    type: string
    sql: ${TABLE}."CLICK_CAMPAIGN_ID" ;;
  }

  dimension: click_campaign_name {
    description: "name of the campaign"
    hidden: yes
    type: string
    sql: ${TABLE}."CLICK_CAMPAIGN_NAME" ;;
  }

  dimension: click_canvas_id {
    description: "id of the canvas if from a canvas"
    hidden: yes
    type: string
    sql: ${TABLE}."CLICK_CANVAS_ID" ;;
  }

  dimension: click_canvas_name {
    description: "name of the canvas"
    hidden: yes
    type: string
    sql: ${TABLE}."CLICK_CANVAS_NAME" ;;
  }

  dimension: click_canvas_step_id {
    description: "id of the step for this message if from a Canvas"
    hidden: yes
    type: string
    sql: ${TABLE}."CLICK_CANVAS_STEP_ID" ;;
  }

  dimension: click_canvas_variation_id {
    description: "id of the Canvas variation the user is in if from a Canvas"
    hidden: yes
    type: string
    sql: ${TABLE}."CLICK_CANVAS_VARIATION_ID" ;;
  }

  dimension: click_email_address {
    description: "email address for this event"
    hidden: yes
    type: string
    sql: ${TABLE}."CLICK_EMAIL_ADDRESS" ;;
  }

  dimension_group: email_clicked_time {
    description: "timestamp of the email click event"
    type: time
     
    timeframes: [
      raw,
      minute,
      minute10,
      minute20,
      minute30,
      hour,
      hour_of_day,
      time,
      date,
      week,
      day_of_week,
      week_of_year,
      day_of_month,
      month,
      quarter,
      quarter_of_year,
      month_num,
      year
    ]
    sql: ${TABLE}."CLICK_TIME" ;;
  }

  dimension: click_email_clicked_timezone {
    description: "IANA timezone of the user at the time of the email click event"
    hidden: yes
    type: string
    sql: ${TABLE}."CLICK_TIMEZONE" ;;
  }

  dimension: click_external_user_id {
    description: "External ID of the user"
    hidden: yes
    type: string
    sql: ${TABLE}."CLICK_EXTERNAL_USER_ID" ;;
  }

  dimension: click_message_variation_id {
    description: "id of the message variation if from a campaign"
    hidden: yes
    type: string
    sql: ${TABLE}."CLICK_MESSAGE_VARIATION_ID" ;;
  }

  dimension: click_send_id {
    description: "id of the message if specified for the campaign (See Send Identifier under REST API Parameter Definitions)"
    hidden: yes
    type: string
    sql: ${TABLE}."CLICK_SEND_ID" ;;
  }

  dimension: click_user_agent_click {
    description: "description of the user's system and browser for the click event (only use with click measures)"
    hidden: yes
    type: string
    sql: ${TABLE}."CLICK_USER_AGENT" ;;
  }

  dimension: click_user_id {
    description: "Braze id of the user"
    hidden: yes
    type: string
    sql: ${TABLE}."CLICK_USER_ID" ;;
  }

  dimension: click_destination {
    description: "To which destination the person went when clicked"
    type: string
    sql: ${TABLE}."CLICK_DESTINATION" ;;
  }

  measure: email_unique_clicks_on_image {
    group_label: "Clicks"
    description: "distinct count of email click events on the image (does not count the same person clicking the same image more than once)"
    type: count_distinct
    sql: CASE WHEN ${TABLE}."CLICK_URL" regexp '.+(\_\_).+(\_\_).+' THEN ${TABLE}."CLICK_EMAIL_ADDRESS" END ;;
  }

  measure: email_total_clicks {
    group_label: "Clicks"
    description: "distinct count of email click events (counts users opening an email more than once)"
    type: count_distinct
    sql: ${TABLE}."CLICK_ID" ;;
  }

  measure: email_total_click_rate {
    group_label: "Clicks"
    description: "total clicks/emails delivered--may be over 100% at the user level"
    type: number
    value_format_name: percent_2
    sql: ${email_total_clicks}/NULLIF(${emails_sent},0) ;;
  }

  measure: email_unique_clicks_mvid {
    type: count_distinct
    hidden: yes
    sql: ${TABLE}."CLICK_EMAIL_ADDRESS", ${TABLE}."CLICK_MESSAGE_VARIATION_ID" ;;
  }

  measure: email_unique_clicks_csid {
    type: count_distinct
    hidden: yes
    sql: ${TABLE}."CLICK_EMAIL_ADDRESS", ${TABLE}."CLICK_CANVAS_STEP_ID" ;;
  }

  measure: email_unique_clicks {
    group_label: "Clicks"
    description: "distinct count of times a recipient clicked an email campaign or canvas (does not count the same person clicking the same campaign or canvas more than once)"
    type: number
    sql: ${email_unique_clicks_mvid}+${email_unique_clicks_csid} ;;
  }

  measure: email_unique_click_rate {
    group_label: "Clicks"
    description: "unique clicks/emails delivered"
    type: number
    value_format_name: percent_2
    sql:${email_unique_clicks}/NULLIF(${emails_delivered},0) ;;
  }

  measure: image_share_of_clicks {
    group_label: "Clicks"
    description: "unique click on image/email_unique_clicks"
    type: number
    value_format_name: percent_2
    sql:${email_unique_clicks_on_image}/NULLIF(${email_unique_clicks},0) ;;
  }

  measure: click_unique_users {
    group_label: "Clicks"
    description: "distinct count of email addresses that clicked on an email campaign"
    type: count_distinct
    sql: ${TABLE}."CLICK_EMAIL_ADDRESS" ;;
  }

  #########################################
  #                 BOUNCE
  #########################################
  dimension: bounce_id {
    description: "unique id of this event"
    hidden: yes
    type: string
    sql: ${TABLE}."BOUNCE_ID" ;;
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
    description: "id of the canvas if from a canvas"
    hidden: yes
    type: string
    sql: ${TABLE}."BOUNCE_CANVAS_ID" ;;
  }

  dimension: bounce_canvas_name {
    description: "name of the canvas"
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

  dimension: bounce_email_address {
    description: "email address for this event"
    hidden: yes
    type: string
    sql: ${TABLE}."BOUNCE_EMAIL_ADDRESS" ;;
  }

  dimension_group: email_bounced_time {
    description: "timestamp of the email bounce event"
    type: time
     
    timeframes: [
      raw,
      minute,
      minute10,
      minute20,
      minute30,
      hour,
      hour_of_day,
      time,
      date,
      week,
      day_of_week,
      week_of_year,
      day_of_month,
      month,
      quarter,
      quarter_of_year,
      month_num,
      year
    ]
    sql: ${TABLE}."BOUNCE_TIME" ;;
  }

  dimension: bounce_email_bounced_timezone {
    description: "IANA timezone of the user at the time of the event"
    hidden: yes
    type: string
    sql: ${TABLE}."BOUNCE_TIMEZONE" ;;
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

  dimension: bounce_send_id {
    description: "id of the message if specified for the campaign (See Send Identifier under REST API Parameter Definitions)"
    hidden: yes
    type: string
    sql: ${TABLE}."BOUNCE_SEND_ID" ;;
  }

  dimension: bounce_sending_ip_bounce {
    description: "the IP address from which the message was sent (only use for email bounce measures)"
    hidden: yes
    type: string
    # drill_fields: [campaign_name, campaign_id, message_variation_id,canvas_step_id]
    sql: ${TABLE}."BOUNCE_SENDING_IP" ;;
  }

  dimension: bounce_user_id {
    description: "Braze id of the user"
    hidden: yes
    type: string
    sql: ${TABLE}."BOUNCE_USER_ID" ;;
  }

  measure: email_bounces {
    group_label: "Bounces"
    description: "distinct count of email bounce event IDs"
    type: count_distinct
    sql: ${TABLE}."BOUNCE_ID" ;;
  }

  measure: email_bounce_rate {
    group_label: "Bounces"
    description: "email (hard) bounces/emails sent--may be over 100% at the user level"
    type: number
    value_format_name: percent_2
    sql: ${email_bounces}/NULLIF(${emails_sent},0) ;;
  }

  measure: bounce_unique_users {
    group_label: "Bounces"
    description: "distinct count of email addresses that an email campaign bounced"
    type: count_distinct
    sql: ${TABLE}."BOUNCE_EMAIL_ADDRESS" ;;
  }

  #########################################
  #                 SPAM
  #########################################

  dimension: spam_id {
    description: "unique id of this event"
    hidden: yes
    type: string
    sql: ${TABLE}."SPAM_ID" ;;
  }

  dimension: spam_campaign_id {
    description: "id of the campaign if from a campaign"
    hidden: yes
    type: string
    sql: ${TABLE}."SPAM_CAMPAIGN_ID" ;;
  }

  dimension: spam_campaign_name {
    description: "name of the campaign"
    hidden: yes
    type: string
    sql: ${TABLE}."SPAM_CAMPAIGN_NAME" ;;
  }

  dimension: spam_canvas_id {
    description: "id of the canvas if from a canvas"
    hidden: yes
    type: string
    sql: ${TABLE}."SPAM_CANVAS_ID" ;;
  }

  dimension: spam_canvas_name {
    description: "name of the canvas"
    hidden: yes
    type: string
    sql: ${TABLE}."SPAM_CANVAS_NAME" ;;
  }

  dimension: spam_canvas_step_id {
    description: "id of the step for this message if from a Canvas"
    hidden: yes
    type: string
    sql: ${TABLE}."SPAM_CANVAS_STEP_ID" ;;
  }

  dimension: spam_canvas_variation_id {
    description: "id of the Canvas variation the user is in if from a Canvas"
    hidden: yes
    type: string
    sql: ${TABLE}."SPAM_CANVAS_VARIATION_ID" ;;
  }

  dimension: spam_email_address {
    description: "email address for this event"
    hidden: yes
    type: string
    sql: ${TABLE}."SPAM_EMAIL_ADDRESS" ;;
  }

  dimension_group: email_marked_as_spam_time {
    description: "timestamp the email was marked as spam"
    type: time
     
    timeframes: [
      raw,
      minute,
      minute10,
      minute20,
      minute30,
      hour,
      hour_of_day,
      time,
      date,
      week,
      day_of_week,
      week_of_year,
      day_of_month,
      month,
      quarter,
      quarter_of_year,
      month_num,
      year
    ]
    sql: ${TABLE}."SPAM_TIME" ;;
  }

  dimension: spam_email_marked_as_spam_timezone {
    description: "IANA timezone of the user at the time of the event"
    hidden: yes
    type: string
    sql: ${TABLE}."SPAM_TIMEZONE" ;;
  }

  dimension: spam_external_user_id {
    description: "External ID of the user"
    hidden: yes
    type: string
    sql: ${TABLE}."SPAM_EXTERNAL_USER_ID" ;;
  }

  dimension: spam_message_variation_id {
    description: "id of the message variation if from a campaign"
    hidden: yes
    type: string
    sql: ${TABLE}."SPAM_MESSAGE_VARIATION_ID" ;;
  }

  dimension: spam_send_id {
    description: "id of the message if specified for the campaign (See Send Identifier under REST API Parameter Definitions)"
    hidden: yes
    type: string
    sql: ${TABLE}."SPAM_SEND_ID" ;;
  }

  dimension: spam_user_agent_marked_as_spam {
    description: "description of the user's system and browser for the marked as spam event (only use for marked as spam events)"
    hidden: yes
    type: string
    sql: ${TABLE}."SPAM_USER_AGENT" ;;
  }

  dimension: spam_user_id {
    description: "Braze id of the user"
    hidden: yes
    type: string
    sql: ${TABLE}."SPAM_USER_ID" ;;
  }

  measure: emails_marked_as_spam {
    group_label: "Spam"
    description: "distinct count of marked-as-spam event IDs"
    type: count_distinct
    sql: ${TABLE}."SPAM_ID" ;;
  }

  measure: marked_as_spam_rate {
    group_label: "Spam"
    description: "emails marked as spam/emails sent"
    type: number
    value_format_name: percent_2
    sql: ${emails_marked_as_spam}/NULLIF(${emails_sent},0) ;;
  }

  measure: spam_unique_users {
    group_label: "Spam"
    description: "distinct count of email addresses that marked an email as spam"
    type: count_distinct
    sql: ${TABLE}."SPAM_EMAIL_ADDRESS" ;;
  }

  #########################################
  #                 UNSUB
  #########################################
  
  dimension: unsub_id {
    description: "unique id of this event"
    hidden: yes
    type: string
    sql: ${TABLE}."UNSUB_ID" ;;
  }

  dimension: unsub_campaign_id {
    description: "id of the campaign if from a campaign"
    hidden: yes
    type: string
    sql: ${TABLE}."UNSUB_CAMPAIGN_ID" ;;
  }

  dimension: unsub_campaign_name {
    description: "name of the campaign"
    hidden: yes
    type: string
    sql: ${TABLE}."UNSUB_CAMPAIGN_NAME" ;;
  }

  dimension: unsub_canvas_id {
    description: "id of the canvas if from a canvas"
    hidden: yes
    type: string
    sql: ${TABLE}."UNSUB_CANVAS_ID" ;;
  }

  dimension: unsub_canvas_name {
    description: "name of the canvas"
    hidden: yes
    type: string
    sql: ${TABLE}."UNSUB_CANVAS_NAME" ;;
  }

  dimension: unsub_canvas_step_id {
    description: "id of the step for this message if from a Canvas"
    hidden: yes
    type: string
    sql: ${TABLE}."UNSUB_CANVAS_STEP_ID" ;;
  }

  dimension: unsub_canvas_variation_id {
    description: "id of the Canvas variation the user is in if from a Canvas"
    hidden: yes
    type: string
    sql: ${TABLE}."UNSUB_CANVAS_VARIATION_ID" ;;
  }

  dimension: unsub_email_address {
    description: "email address for this event"
    hidden: yes
    type: string
    sql: ${TABLE}."UNSUB_EMAIL_ADDRESS" ;;
  }

  dimension_group: email_unsubscribe_time {
    description: "timestamp of the unsubscribe event"
    type: time
     
    timeframes: [
      raw,
      minute,
      minute10,
      minute20,
      minute30,
      hour,
      hour_of_day,
      time,
      date,
      week,
      day_of_week,
      week_of_year,
      day_of_month,
      month,
      quarter,
      quarter_of_year,
      month_num,
      year
    ]
    sql: ${TABLE}."UNSUB_TIME" ;;
  }

  dimension: unsub_email_unsubscribe_timezone {
    description: "IANA timezone of the user at the time of the event"
    hidden: yes
    type: string
    sql: ${TABLE}."UNSUB_TIMEZONE" ;;
  }

  dimension: unsub_external_user_id {
    description: "External ID of the user"
    hidden: yes
    type: string
    sql: ${TABLE}."UNSUB_EXTERNAL_USER_ID" ;;
  }

  dimension: unsub_message_variation_id {
    description: "id of the message variation if from a campaign"
    hidden: yes
    type: string
    sql: ${TABLE}."UNSUB_MESSAGE_VARIATION_ID" ;;
  }

  dimension: unsub_send_id {
    description: "id of the message if specified for the campaign (See Send Identifier under REST API Parameter Definitions)"
    hidden: yes
    type: string
    sql: ${TABLE}."UNSUB_SEND_ID" ;;
  }

  dimension: unsub_user_id {
    description: "Braze id of the user"
    hidden: yes
    type: string
    sql: ${TABLE}."UNSUB_USER_ID" ;;
  }

  measure: email_unsubscribes {
    group_label: "Unsubscribe"
    description: "distinct count of email addresses that have unsubscribed"
    type: count_distinct
    sql: ${TABLE}."UNSUB_EMAIL_ADDRESS" ;;
  }

  measure: email_unsubscribe_rate {
    group_label: "Unsubscribe"
    description: "email unsubscribes/emails delivered"
    type: number
    value_format_name: percent_2
    sql:${email_unsubscribes}/NULLIF(${emails_sent},0) ;;
  }

  measure: unsubscribe_unique_users {
    group_label: "Unsubscribe"
    description: "distinct count of email addresses that unsubscribed to a campaign"
    type: count_distinct
    sql: ${TABLE}."UNSUB_EMAIL_ADDRESS" ;;
  }

  ##################################################
  #         MY MEASURES
  #################################################
  
  measure: CTR {
    group_label: "Clicks"
    description: "email unique clicks/emails unique opens"
    label: "CTR"
    type: number
    value_format_name: percent_2
    sql:${email_unique_clicks}/NULLIF(${email_unique_opens},0) ;;
  }
}
