# Canvas Conversions
view: users_canvas_conversion {
  sql_table_name: PUBLIC.USERS_CANVAS_CONVERSION ;;

  dimension: id {
    primary_key: yes
    description: "unique ID for this conversion event"
    hidden: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: app_id {
    description: "id for the app on which the user action occurred"
    type: string
    sql: ${TABLE}."APP_ID" ;;
  }

  dimension: canvas_id {
    description: "id of the canvas"
    type: string
    sql: ${TABLE}."CANVAS_ID" ;;
  }

  dimension: canvas_name {
    description: "name of the canvas"
    type: string
    sql: ${TABLE}."CANVAS_NAME" ;;
  }

  dimension: canvas_step_id {
    description: "id of the canvas step"
    type: string
    sql: ${TABLE}."CANVAS_STEP_ID" ;;
  }

  dimension: canvas_variation_id {
    description: "id of the Canvas variation the user is in"
    type: string
    sql: ${TABLE}."CANVAS_VARIATION_ID" ;;
  }

# the below dimensions use Snowflake syntax to turn a json string into code that can be queried.
# use the proper code for your SQL dialect.
  dimension: conversion_behavior {
    description: "JSON-encoded string describing the conversion behavior"
    hidden: yes
    type: string
    sql: parse_json(${TABLE}."CONVERSION_BEHAVIOR");;
  }

  dimension: conversion_behavior_index {
    description: "index of the conversion behavior"
    hidden: yes
    type: number
    sql: ${TABLE}."CONVERSION_BEHAVIOR_INDEX" ;;
  }

  dimension: conversion_behavior_type {
    description: "type of the conversion behavior"
    type: string
    sql: ${conversion_behavior}:type::STRING ;;
  }

  dimension: conversion_custom_event_name {
    description: "if the conversion was a custom event, the name of custom event"
    type: string
    sql: ${conversion_behavior}:custom_event_name::STRING ;;
  }

  dimension: conversion_window {
    description: "window of time to perform the conversion behavior in seconds"
    type: number
    sql: ${conversion_behavior}:window::NUMBER ;;
  }

  dimension_group: converted_time {
    description: "timestamp of the conversion"
    type: time
    datatype: epoch
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."TIME" ;;
  }

  dimension: converted_timezone {
    description: "IANA timezone of the user at the time of the event"
    hidden: yes
    type: string
    sql: ${TABLE}."TIMEZONE" ;;
  }

  dimension: external_user_id {
    description: "External ID of the user"
    type: string
    sql: ${TABLE}."EXTERNAL_USER_ID" ;;
  }

  dimension: user_id {
    description: "braze user id of the user"
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: canvas_conversion_event_count {
    description: "distinct count of canvas conversion behavior event IDs"
    type: count_distinct
    sql: ${TABLE}."ID" ;;
  }

  measure: unique_users_that_converted_on_a_canvas {
    description: "distinct count of Braze user IDs who converted on a canvas"
    type: count_distinct
    sql: ${TABLE}."USER_ID" ;;
  }
}
