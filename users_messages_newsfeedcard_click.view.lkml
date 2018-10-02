# Newsfeed Card Click Events
view: users_messages_newsfeedcard_click {
  sql_table_name: PUBLIC.USERS_MESSAGES_NEWSFEEDCARD_CLICK ;;

  dimension: id {
    primary_key: yes
    description: "unique id of this event"
    hidden: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: app_id {
    description: "id for the app on which the user action occurred"
    hidden: yes
    type: string
    sql: ${TABLE}."APP_ID" ;;
  }

  dimension: card_id {
    description: "id of the card that was clicked"
    hidden: yes
    type: string
    sql: ${TABLE}."CARD_ID" ;;
  }

  dimension: device_id {
    description: "id of the device on which the event occurred"
    hidden: yes
    type: string
    sql: ${TABLE}."DEVICE_ID" ;;
  }

  dimension: device_model {
    description: "hardware model of the device"
    hidden: yes
    type: string
    sql: ${TABLE}."DEVICE_MODEL" ;;
  }

  dimension: external_user_id {
    description: "External ID of the user"
    hidden: yes
    type: string
    sql: ${TABLE}."EXTERNAL_USER_ID" ;;
  }

  dimension_group: newsfeed_card_click_time {
    description: "timestamp of the newsfeed card click"
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

  dimension: newsfeed_card_click_timezone {
    description: "IANA timezone of the user at the time of the newsfeed card click event"
    hidden: yes
    type: string
    sql: ${TABLE}."TIMEZONE" ;;
  }

  dimension: os_version {
    description: "os version of device used for the action"
    hidden: yes
    type: string
    sql: ${TABLE}."OS_VERSION" ;;
  }

  dimension: platform {
    description: "platform of the device (iOS, Android, web, etc.)"
    hidden: yes
    type: string
    sql: ${TABLE}."PLATFORM" ;;
  }

  dimension: user_id {
    description: "Braze user id"
    hidden: yes
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: newsfeed_card_clicks {
    description: "distinct count of newsfeed card click events"
    type: count_distinct
    sql: ${TABLE}."ID" ;;
  }

  measure: newsfeed_card_click_rate {
    description: "newsfeed card clicks/impressions"
    type: number
    value_format_name: percent_2
    sql: ${newsfeed_card_clicks}/NULLIF(${users_messages_newsfeedcard_impression.newsfeed_card_impressions},0) ;;
  }
}
