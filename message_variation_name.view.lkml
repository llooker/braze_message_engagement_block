# Message Variation Name
view: message_variation_name {
  sql_table_name: PROD_RAW.STITCH_GSHEETS_BRAZE_VARIATION_NAME.BRAZE_VARIATION_NAME ;;

  dimension: message_variation_id {
    primary_key: yes
    description: "message variation id"
    type: string
    sql: ${TABLE}."VARIATION_ID" ;;
  }

  dimension: description {
    description: "description of the variation name"
    type: string
    sql: ${TABLE}."DESCRIPTION" ;;
  }

  dimension: variation_name {
    description: "name for each message variation id"
    type: string
    sql: ${TABLE}."VARIATION_NAME" ;;
  }
}
