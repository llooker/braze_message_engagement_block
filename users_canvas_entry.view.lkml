# Users Entered Canvas
view: users_canvas_entry {
  sql_table_name: PROD_ANALYTICS.ANALYTICS_PROCESSED.TBL_BRAZE_CANVAS_ENTRIES ;;

  dimension: id {
    primary_key: yes
    description: "unique ID for this conversion event"
    hidden: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: canvas_id {
    description: "id of the canvas"
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
    description: "id of the canvas step"
    hidden: yes
    type: string
    sql: ${TABLE}."CANVAS_STEP_ID" ;;
  }

  dimension: canvas_variation_id {
    description: "id of the Canvas variation the user is in"
    hidden: yes
    type: string
    sql: ${TABLE}."CANVAS_VARIATION_ID" ;;
  }

  dimension_group: entered_canvas_time {
    description: "timestamp the user entered the canvas"
    type: time
     
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

  dimension: entered_canvas_timezone {
    description: "IANA timezone of the user at the time of the canvas entry"
    hidden: yes
    type: string
    sql: ${TABLE}."TIMEZONE" ;;
  }

  dimension: external_user_id {
    description: "external ID of the user"
    hidden: yes
    type: string
    sql: ${TABLE}."EXTERNAL_USER_ID" ;;
  }

  dimension: in_control_group {
    description: "is the user in the control group for the canvas variation"
    type: string
    sql: CASE WHEN ${TABLE}."IN_CONTROL_GROUP" IS NOT NULL THEN 'Yes' ELSE 'NO' END ;;
  }

  dimension: user_id {
    description: "Braze id of the user"
    hidden: yes
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }
}
