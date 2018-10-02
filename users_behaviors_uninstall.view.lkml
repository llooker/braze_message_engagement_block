# Uninstall Events
view: users_behaviors_uninstall {
  sql_table_name: PUBLIC.USERS_BEHAVIORS_UNINSTALL ;;

  dimension: id {
    primary_key: yes
    description: "unique ID of this uninstall event"
    hidden: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: app_id {
    description: "id for the app on which the user action occurred"
    type: string
    sql: ${TABLE}."APP_ID" ;;
  }

  dimension: external_user_id {
    description: "External ID of the user"
    type: string
    sql: ${TABLE}."EXTERNAL_USER_ID" ;;
  }

  dimension_group: uninstall_time {
    description: "timestamp of the uninstall"
    label: "Time"
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

  dimension: user_id {
    description: "braze user id of the user"
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: count_distinct_uninstall_event_id {
    description: "unique count of uninstall event IDs"
    type: count_distinct
    sql: ${TABLE}."ID" ;;
  }
}
