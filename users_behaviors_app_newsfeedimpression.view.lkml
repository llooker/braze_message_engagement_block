# Newsfeed Impression Events
view: users_behaviors_app_newsfeedimpression {
  sql_table_name: PUBLIC.USERS_BEHAVIORS_APP_NEWSFEEDIMPRESSION ;;

  dimension: id {
    primary_key: yes
    description: "unique ID of this event"
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: app_id {
    description: "id for the app on which the user action occurred"
    type: string
    sql: ${TABLE}."APP_ID" ;;
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

  dimension_group: time {
    description: "timestamp of the newsfeed impression"
    label: "Time"
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

  dimension: user_id {
    description: "braze user id of the user"
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: newsfeed_impressions {
    description: "distinct count of newsfeed impression events"
    type: count_distinct
    sql: ${TABLE}."ID" ;;
  }
}
