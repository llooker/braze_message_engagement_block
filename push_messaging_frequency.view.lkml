# Push Messaging Frequency
view: push_messaging_frequency {
  derived_table: {
    sql: SELECT * FROM (
        SELECT
        sent_user_id,
        date_trunc({% parameter date_granularity %}, to_timestamp(sent_time)) as sent_time,
        opened_id,
        frequency,
        rank,
        campaign_name,
        canvas_name,
        message_variation_id,
        canvas_step_id,
        platform
        FROM PROD_ANALYTICS.ANALYTICS_PROCESSED.TBL_BRAZE_PUSH_FREQUENCY
        WHERE
        {% condition campaign_name %} campaign_name {% endcondition %}
        AND
        {% condition canvas_name %} canvas_name {% endcondition %}
        AND
        {% condition message_variation_id %} message_variation_id {% endcondition %}
        AND
        {% condition canvas_name %} canvas_step_id {% endcondition %}
        AND
        {% condition platform %} platform {% endcondition %}
      ) WHERE frequency > 0
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
