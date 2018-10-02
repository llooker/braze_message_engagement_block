- dashboard: push_funnel
  title: Push Funnel
  layout: newspaper
  elements:
  - title: Push Funnel
    name: Push Funnel
    model: braze_currents_block_message_engagement
    explore: users_messages_pushnotification_send
    type: looker_funnel
    fields:
    - users_messages_pushnotification_send.push_sent
    - users_messages_pushnotification_send.push_delivered
    - users_messages_pushnotification_open.push_opens
    limit: 500
    query_timezone: America/New_York
    leftAxisLabelVisible: false
    leftAxisLabel: Metric
    rightAxisLabelVisible: true
    rightAxisLabel: Percent of previous tier
    barColors:
    - "#F77B81"
    - "#1D3890"
    - "#FFCEB3"
    - "#92E8ED"
    smoothedBars: true
    orientation: automatic
    labelPosition: left
    percentType: prior
    percentPosition: right
    valuePosition: inline
    labelColorEnabled: false
    labelColor: "#FFF"
    series_types: {}
    listen:
      Campaign Name (funnel filter): users_messages_pushnotification_send.campaign_name
      Canvas Name (funnel filter): users_messages_pushnotification_send.canvas_name
    note_state: expanded
    note_display: above
    note_text: 'Note: use campaign name OR canvas name filters for best results.'
    row: 0
    col: 0
    width: 24
    height: 11
  filters:
  - name: Campaign Name (funnel filter)
    title: Campaign Name (funnel filter)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: braze_currents_block_message_engagement
    explore: users_messages_pushnotification_send
    listens_to_filters: []
    field: users_messages_pushnotification_send.campaign_name
  - name: Canvas Name (funnel filter)
    title: Canvas Name (funnel filter)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: braze_currents_block_message_engagement
    explore: users_messages_pushnotification_send
    listens_to_filters: []
    field: users_messages_pushnotification_send.canvas_name
