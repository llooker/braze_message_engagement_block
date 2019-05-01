# Push Messaging Frequency
view: push_messaging_frequency {
  derived_table: {
    sql: SELECT * FROM
        (select distinct
        sends.user_id  as sent_user_id,
        date_trunc({% parameter date_granularity %}, to_timestamp(sends.time)) as sent_time,
        opens.id  as opened_id,
        coalesce(count(distinct sends.id) over (partition by sent_user_id, sent_time),0)-coalesce(count(distinct bounces.id) over (partition by sent_user_id, sent_time),0) as frequency,
        row_number() over (partition by sent_user_id, sent_time order by sent_time) as rank
      FROM PUBLIC.USERS_MESSAGES_PUSHNOTIFICATION_SEND  as sends
      LEFT JOIN PUBLIC.USERS_MESSAGES_PUSHNOTIFICATION_BOUNCE  as bounces ON (sends.user_id)=(bounces.user_id)
                  AND
                  ((sends.message_variation_id)=(bounces.message_variation_id)
                  OR
                  (sends.canvas_step_id)=(bounces.canvas_step_id))
      LEFT JOIN PUBLIC.USERS_MESSAGES_PUSHNOTIFICATION_OPEN  as opens ON (sends.user_id)=(opens.user_id)
                  AND
                  ((sends.message_variation_id)=(opens.message_variation_id)
                  OR
                  (sends.canvas_step_id)=(opens.canvas_step_id))
      WHERE
      {% condition campaign_name %} sends.campaign_name {% endcondition %}
      AND
      {% condition canvas_name %} sends.canvas_name {% endcondition %}
      AND
      {% condition message_variation_id %} sends.message_variation_id {% endcondition %}
      AND
      {% condition canvas_name %} sends.canvas_step_id {% endcondition %}
      AND
      {% condition platform %} sends.platform {% endcondition %}) WHERE frequency > 0
      ;;
  }

  filter: campaign_name {
    description: "name of the campaign"
    suggest_explore: users_messages_pushnotification_send
    suggest_dimension: campaign_name
  }

  filter: canvas_name {
    description: "name of the canvas"
    suggest_explore: users_messages_pushnotification_send
    suggest_dimension: canvas_name
  }

  filter: canvas_step_id {
    description: "canvas step id if from a canvas"
    suggest_explore: users_messages_pushnotification_send
    suggest_dimension: canvas_step_id
  }

  filter: message_variation_id {
    description: "message variation id if from a campaign"
    suggest_explore: users_messages_pushnotification_send
    suggest_dimension: message_variation_id
  }

  filter: platform {
    description: "platform of the device (iOS, Android, web, etc.)"
    suggest_explore: users_messages_pushnotification_send
    suggest_dimension: platform
  }

  parameter: date_granularity {
    description: "specify daily, weekly or monthly marketing pressure"
    type: string
    default_value: "day"
    allowed_value: {
      value: "day"
    }
    allowed_value: {
      value: "week"
    }
    allowed_value: {
      value: "month"
    }
  }

  dimension: user_id {
    description: "Braze id of the user"
    type: string
    sql: ${TABLE}."SENT_USER_ID" ;;
  }

  dimension_group: sent {
    description: "timestamp the push notification was sent"
    type: time
    timeframes: [date, week, month, quarter, year]
    sql: ${TABLE}."SENT_TIME" ;;
  }

  dimension: frequency {
    description: "number of push messages delivered per date granularity (day/week/month)"
    type: number
    sql: ${TABLE}."FREQUENCY" ;;
  }

  measure: delivery_occasions {
    description: "distinct occasions a certain frequency of push messages was sent to a user per date granularity"
    type: number
    sql: COUNT(CASE WHEN rank=1 then ${TABLE}."FREQUENCY" ELSE NULL END) ;;
  }

  measure: push_open_rate {
    description: "push opens/push delivered"
    type: number
    value_format_name: percent_2
    sql: ${push_opens}/NULLIF(${push_delivered},0) ;;
  }

  measure: push_opens {
    description: "distinct count of push open event ids; may deviate lower than expected due to filtering out 'frequencies' of 0 (where sum(push sent)=sum(push bounce))"
    type: count_distinct
    sql: ${TABLE}."OPENED_ID" ;;
  }

  measure: push_delivered {
    description: "distinct count of push delivery event ids"
    type: sum
    sql: CASE WHEN rank=1 then ${TABLE}."FREQUENCY" ELSE NULL END ;;
  }

  measure: unique_recipients {
    description: "distinct count of user ids that received a push message"
    type: count_distinct
    sql: ${TABLE}."SENT_USER_ID" ;;
  }
}
