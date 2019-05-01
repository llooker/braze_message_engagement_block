# Push Messaging Cadence
view: push_messaging_cadence {
  derived_table: {
    sql: select to_timestamp(sends.time) as send_timestamp,
      sends.user_id as send_user_id,
      bounces.user_id as bounce_user_id,
      sends.message_variation_id as s_message_variation_id,
      sends.canvas_step_id as s_canvas_step_id,
      sends.campaign_name as s_campaign_name,
      sends.canvas_name as s_canvas_name,
      sends.platform as s_platform,
      sends.id as send_id,
      opens.id as open_id,
      bounces.id as bounce_id,
      rank() over (partition by send_user_id order by send_timestamp asc) as send_event,
      iff(timediff(second, send_timestamp, to_timestamp(opens.time))=min(timediff(second, send_timestamp, to_timestamp(opens.time))) over (partition by open_id), true, false) as min_open_difference,
      iff(timediff(second, send_timestamp, to_timestamp(bounces.time))=min(timediff(second, send_timestamp, to_timestamp(bounces.time))) over (partition by bounce_id), true, false) as min_bounce_difference,
      min(send_timestamp) over (partition by send_user_id order by send_timestamp asc) as first_sent,
      datediff(day, lag(send_timestamp) over (partition by send_user_id order by send_timestamp asc), send_timestamp) as diff_days,
      datediff(week, lag(send_timestamp) over (partition by send_user_id order by send_timestamp asc), send_timestamp) as diff_weeks
FROM PUBLIC.USERS_MESSAGES_PUSHNOTIFICATION_SEND AS sends
LEFT JOIN PUBLIC.USERS_MESSAGES_PUSHNOTIFICATION_OPEN AS opens ON (sends.user_id)=(opens.user_id)
            AND
            (sends.device_id)=(opens.device_id)
            AND
            ((sends.message_variation_id)=(opens.message_variation_id)
            OR
            (sends.canvas_step_id)=(opens.canvas_step_id))
LEFT JOIN PUBLIC.USERS_MESSAGES_PUSHNOTIFICATION_BOUNCE AS bounces ON (sends.user_id)=(bounces.user_id)
            AND
            (sends.device_id)=(bounces.device_id)
            AND
            ((sends.message_variation_id)=(bounces.message_variation_id)
            OR
            (sends.canvas_step_id)=(bounces.canvas_step_id)) ;;
  }

  dimension_group: send {
    description: "UTC epoch timestamp the push was sent"
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
    description: "UTC epoch timestamp the first push was sent to this user"
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
