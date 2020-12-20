- dashboard: email_funnel
  title: Email Funnel
  layout: newspaper
  elements:
  - title: Email Funnel
    name: Email Funnel
    model: braze_currents_block_message_engagement
    explore: email_fact
    type: looker_funnel
    fields:
    - email_fact.emails_sent
    - email_fact.emails_delivered
    - email_fact.email_unique_opens
    - email_fact.email_unique_clicks
    limit: 500
    leftAxisLabelVisible: false
    leftAxisLabel: ''
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
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Campaign Name: email_fact.send_campaign_name
      Canvas Name: email_fact.send_canvas_name
    note_state: expanded
    note_display: above
    note_text: 'Note: use campaign name OR canvas name filters for best results.'
    row: 0
    col: 0
    width: 24
    height: 11
  filters:
  - name: Campaign Name
    title: Campaign Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: braze_currents_block_message_engagement
    explore: email_fact
    listens_to_filters: []
    field: email_fact.send_campaign_name
  - name: Canvas Name
    title: Canvas Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: braze_currents_block_message_engagement
    explore: email_fact
    listens_to_filters: []
    field: email_fact.send_canvas_name
