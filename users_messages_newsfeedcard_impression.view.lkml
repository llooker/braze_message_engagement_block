# Newsfeed Card Impression Events
view: users_messages_newsfeedcard_impression {
  sql_table_name: PUBLIC.USERS_MESSAGES_NEWSFEEDCARD_IMPRESSION ;;

  dimension: id {
    primary_key: yes
    description: "unique id of this event"
    hidden: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: app_id {
    description: "id for the app on which the user action occurred"
    type: string
    sql: ${TABLE}."APP_ID" ;;
  }

  dimension: card_id {
    description: "id of the card that was viewed"
    type: string
    sql: ${TABLE}."CARD_ID" ;;
  }

  dimension: device_id {
    description: "id of the device on which the event occurred"
    type: string
    sql: ${TABLE}."DEVICE_ID" ;;
  }

  dimension: device_model {
    description: "hardware model of the device"
    type: string
    sql: ${TABLE}."DEVICE_MODEL" ;;
  }

  dimension: external_user_id {
    description: "External ID of the user"
    type: string
    sql: ${TABLE}."EXTERNAL_USER_ID" ;;
  }

  dimension_group: newsfeed_card_impression_time {
    description: "timestamp of the newsfeed card impression"
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
    description: "IANA timezone of the user at the time of the newsfeed card impression event"
    hidden: yes
    type: string
    sql: ${TABLE}."TIMEZONE" ;;
  }

  dimension: os_version {
    description: "os version of device used for the action"
    type: string
    sql: ${TABLE}."OS_VERSION" ;;
  }

  dimension: platform {
    description: "platform of the device (iOS, Android, web, etc.)"
    type: string
    sql: ${TABLE}."PLATFORM" ;;
  }

  dimension: user_id {
    description: "Braze user id"
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: newsfeed_card_impressions {
    description: "distinct count of newsfeed card impression events"
    type: count_distinct
    sql: ${TABLE}."ID" ;;
  }

  measure: unique_card_count {
    description: "distinct count of card IDs"
    type: count_distinct
    sql: ${TABLE}."CARD_ID" ;;
  }

  measure: unique_user_id_count {
    description: "distinct count of Braze user IDs that had a newsfeed card impression"
    type: count_distinct
    sql: ${TABLE}."USER_ID" ;;
  }
}
