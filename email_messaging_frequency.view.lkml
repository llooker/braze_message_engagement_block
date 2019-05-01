# Email Messaging Frequency
view: email_messaging_frequency {
  derived_table: {
    sql: SELECT date_trunc({% parameter date_granularity %}, to_timestamp(deliveries.time)) AS delivered_time,
        deliveries.email_address  AS delivered_address,
        deliveries.ID as delivered_id,
        count(distinct deliveries.id ) over (partition by delivered_time, delivered_address) AS frequency,
        row_number() over (partition by delivered_address, delivered_time order by delivered_time) as rank,
        opens.email_address as opened_address,
        opens.message_variation_id as opened_mv_id,
        opens.canvas_step_id as opened_cs_id,
        clicks.email_address as clicked_address,
        clicks.message_variation_id as clicked_mv_id,
        clicks.canvas_step_id as clicked_cs_id
        FROM PUBLIC.USERS_MESSAGES_EMAIL_DELIVERY  AS deliveries
        LEFT JOIN PUBLIC.USERS_MESSAGES_EMAIL_OPEN  AS opens ON (deliveries.email_address)=(opens.email_address)
                    AND
                    ((deliveries.message_variation_id)=(opens.message_variation_id)
                    OR
                    (deliveries.canvas_step_id)=(opens.canvas_step_id))
        LEFT JOIN PUBLIC.USERS_MESSAGES_EMAIL_CLICK  AS clicks ON (deliveries.email_address)=(clicks.email_address)
                    AND
                    ((deliveries.message_variation_id)=(clicks.message_variation_id)
                    OR
                    (deliveries.canvas_step_id)=(clicks.canvas_step_id))
      WHERE
      {% condition campaign_name %} deliveries.campaign_name {% endcondition %}
      AND
      {% condition canvas_name %} deliveries.canvas_name {% endcondition %}
      AND
      {% condition message_variation_id %} deliveries.message_variation_id {% endcondition %}
      AND
      {% condition canvas_name %} deliveries.canvas_step_id {% endcondition %}
      ;;
  }

  filter: campaign_name {
    description: "name of the campaign"
    suggest_explore: users_messages_email_send
    suggest_dimension: campaign_name
  }

  filter: canvas_name {
    description: "name of the canvas"
    suggest_explore: users_messages_email_send
    suggest_dimension: canvas_name
  }

  filter: canvas_step_id {
    description: "canvas step id if from a canvas"
    suggest_explore: users_messages_email_send
    suggest_dimension: canvas_step_id
  }

  filter: message_variation_id {
    description: "message variation id if from a campaign"
    suggest_explore: users_messages_email_send
    suggest_dimension: message_variation_id
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

  dimension_group: delivered_time {
    description: "time the email was delivered (UTC)"
    type: time
    timeframes: [hour_of_day,
      date,
      day_of_week,
      week, month,
      quarter,
      year]
    sql: ${TABLE}."DELIVERED_TIME" ;;
  }

  dimension: email_address {
    description: "email address of the user"
    type: string
    sql: ${TABLE}."DELIVERED_ADDRESS" ;;
  }

  dimension: frequency {
    description: "number of emails sent per date granularity (day/week/month)"
    type: number
    sql: ${TABLE}."FREQUENCY" ;;
  }

  measure: emails_delivered {
    description: "count of unique delivery event IDs"
    type: sum
    sql: CASE WHEN rank=1 then ${frequency} else null end ;;
  }

  measure: unique_opens_mvid {
    description: "unique opens corresponding to message variations"
    type: count_distinct
    hidden: yes
    sql: ${TABLE}."OPENED_ADDRESS", ${TABLE}."OPENED_MV_ID" ;;
  }

  measure: unique_opens_csid {
    description: "unique opens corresponding to canvas steps"
    type: count_distinct
    hidden: yes
    sql: ${TABLE}."OPENED_ADDRESS", ${TABLE}."OPENED_CS_ID" ;;
  }

  measure: unique_clicks_mvid {
    description: "unique clicks corresponding to message variations"
    type: count_distinct
    hidden: yes
    sql: ${TABLE}."CLICKED_ADDRESS", ${TABLE}."CLICKED_MV_ID" ;;
  }

  measure: unique_clicks_csid {
    description: "unique clicks corresponding to canvas steps"
    type: count_distinct
    hidden: yes
    sql: ${TABLE}."CLICKED_ADDRESS", ${TABLE}."CLICKED_CS_ID" ;;
  }

  measure: unique_opens {
    description: "distinct count of times a recipient opened an email campaign or canvas (does not count the same person opening the same campaign or canvas more than once);
    expected behavior is for this measure to deviate from actual by less than 1% because of limitations on linking specific instances of emails delivered to emails opened"
    type: number
    sql: COALESCE(${unique_opens_mvid},0)+COALESCE(${unique_opens_csid},0);;
  }

  measure: unique_clicks {
    description: "distinct count of times a recipient opened an email campaign or canvas (does not count the same person opening the same campaign or canvas more than once);
    expected behavior is for this measure to deviate from actual by less than 1% because of limitations on linking specific instances of emails delivered to emails clicked"
    type: number
    sql: COALESCE(${unique_clicks_mvid},0)+COALESCE(${unique_clicks_csid},0) ;;
  }

  measure: delivery_occasions {
    description: "occasions a certain frequency of emails was sent to a user per date granularity"
    type: number
    sql: COUNT(CASE WHEN rank=1 then ${frequency} else null end) ;;
  }

  measure: unique_click_rate {
    description: "email unique clicks/emails delivered"
    type: number
    value_format_name: percent_2
    sql: ${unique_clicks}/NULLIF(${emails_delivered},0) ;;
  }

  measure: unique_open_rate {
    description: "email unique opens/emails delivered"
    type: number
    value_format_name: percent_2
    sql: ${unique_opens}/NULLIF(${emails_delivered},0) ;;
  }

  measure: unique_recipients {
    description: "distinct count of email addresses that received an email campaign"
    type: count_distinct
    sql: ${TABLE}."DELIVERED_ADDRESS" ;;
  }
}