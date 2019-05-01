- dashboard: push_marketing_pressure
  title: Push Marketing Pressure
  layout: newspaper
  description: Uses push messaging cadence and frequency views to explore how push
    messaging timing and pressure affects user behavior.
  elements:
  - name: Push Send Frequency
    type: text
    title_text: Push Send Frequency
    subtitle_text: Explore how the number of push campaigns sent to a user in a given
      period of time (daily, weekly, monthly) affects engagement.
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Push Marketing Pressure and Engagement by Hour
    name: Push Marketing Pressure and Engagement by Hour
    model: braze_currents_block_message_engagement
    explore: users_messages_pushnotification_send
    type: looker_line
    fields:
    - users_messages_pushnotification_send.push_sent_time_hour_of_day
    - users_messages_pushnotification_open.push_open_rate
    - users_messages_pushnotification_send.push_sent
    fill_fields:
    - users_messages_pushnotification_send.push_sent_time_hour_of_day
    sorts:
    - users_messages_pushnotification_send.push_sent_time_hour_of_day
    limit: 500
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      users_messages_pushnotification_send.push_sent: "#FFCEB3"
    series_types:
      users_messages_pushnotification_send.push_sent: column
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: users_messages_pushnotification_send.push_sent
        name: Push Sent
        axisId: users_messages_pushnotification_send.push_sent
        __FILE: looker_blocks/push_marketing_pressure.dashboard.lookml
        __LINE_NUM: 56
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: looker_blocks/push_marketing_pressure.dashboard.lookml
      __LINE_NUM: 53
    - label:
      orientation: right
      series:
      - id: users_messages_pushnotification_open.push_open_rate
        name: Push Open Rate
        axisId: users_messages_pushnotification_open.push_open_rate
        __FILE: looker_blocks/push_marketing_pressure.dashboard.lookml
        __LINE_NUM: 68
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: looker_blocks/push_marketing_pressure.dashboard.lookml
      __LINE_NUM: 65
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Hour Sent
    show_x_axis_ticks: true
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_label_rotation: 0
    show_null_points: true
    interpolation: monotone
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Date Range: users_messages_pushnotification_send.push_sent_time_date
      Platform: users_messages_pushnotification_send.platform
      Campaign Name: users_messages_pushnotification_send.campaign_name
      Canvas Name: users_messages_pushnotification_send.canvas_name
    row: 44
    col: 0
    width: 12
    height: 9
  - title: Push Marketing Pressure and Engagement by Day of Week
    name: Push Marketing Pressure and Engagement by Day of Week
    model: braze_currents_block_message_engagement
    explore: users_messages_pushnotification_send
    type: looker_line
    fields:
    - users_messages_pushnotification_open.push_open_rate
    - users_messages_pushnotification_send.push_sent
    - users_messages_pushnotification_send.push_sent_time_day_of_week
    fill_fields:
    - users_messages_pushnotification_send.push_sent_time_day_of_week
    sorts:
    - users_messages_pushnotification_send.push_sent_time_day_of_week
    limit: 500
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      users_messages_pushnotification_send.push_sent: "#FFCEB3"
    series_types:
      users_messages_pushnotification_send.push_sent: column
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: users_messages_pushnotification_send.push_sent
        name: Push Sent
        axisId: users_messages_pushnotification_send.push_sent
        __FILE: looker_blocks/push_marketing_pressure.dashboard.lookml
        __LINE_NUM: 138
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: looker_blocks/push_marketing_pressure.dashboard.lookml
      __LINE_NUM: 135
    - label:
      orientation: right
      series:
      - id: users_messages_pushnotification_open.push_open_rate
        name: Push Open Rate
        axisId: users_messages_pushnotification_open.push_open_rate
        __FILE: looker_blocks/push_marketing_pressure.dashboard.lookml
        __LINE_NUM: 150
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: looker_blocks/push_marketing_pressure.dashboard.lookml
      __LINE_NUM: 147
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Day Sent
    show_x_axis_ticks: true
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_label_rotation: 0
    show_null_points: true
    interpolation: monotone
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Date Range: users_messages_pushnotification_send.push_sent_time_date
      Platform: users_messages_pushnotification_send.platform
      Campaign Name: users_messages_pushnotification_send.campaign_name
      Canvas Name: users_messages_pushnotification_send.canvas_name
    row: 44
    col: 12
    width: 12
    height: 9
  - title: average number of days between pushes sent
    name: average number of days between pushes sent
    model: braze_currents_block_message_engagement
    explore: push_messaging_cadence
    type: single_value
    fields:
    - push_messaging_cadence.average_number_of_days_since_last_sent
    limit: 500
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
    hidden_fields: []
    y_axes: []
    listen:
      Date Range: push_messaging_cadence.send_date
      Platform: push_messaging_cadence.platform
      Campaign Name: push_messaging_cadence.campaign_name
      Canvas Name: push_messaging_cadence.canvas_name
    row: 24
    col: 0
    width: 24
    height: 2
  - name: Push Send Cadence
    type: text
    title_text: Push Send Cadence
    subtitle_text: Explore how the timing and pattern of pushes sent affects engagement.
    row: 22
    col: 0
    width: 24
    height: 2
  - title: Send Cadence Overview
    name: Send Cadence Overview
    model: braze_currents_block_message_engagement
    explore: push_messaging_cadence
    type: table
    fields:
    - push_messaging_cadence.send_event
    - push_messaging_cadence.average_number_of_days_since_last_sent
    - push_messaging_cadence.push_sent
    - push_messaging_cadence.push_open_rate
    sorts:
    - push_messaging_cadence.send_event
    limit: 500
    query_timezone: America/New_York
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting:
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
        __FILE: looker_blocks/push_marketing_pressure.dashboard.lookml
        __LINE_NUM: 462
      bold: false
      italic: false
      strikethrough: false
      fields:
      - push_messaging_cadence.push_open_rate
      color_application:
        collection_id: legacy
        palette_id: legacy_diverging1
        __FILE: looker_blocks/push_marketing_pressure.dashboard.lookml
        __LINE_NUM: 473
      __FILE: looker_blocks/push_marketing_pressure.dashboard.lookml
      __LINE_NUM: 457
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields:
    - push_send_cadence.total_push_sent
    y_axes: []
    note_state: expanded
    note_display: above
    note_text: "*Send event: 1=first push message, 2=second push message (total),\
      \ 3=third push message (total), etc."
    listen:
      Date Range: push_messaging_cadence.send_date
      Platform: push_messaging_cadence.platform
      Campaign Name: push_messaging_cadence.campaign_name
      Canvas Name: push_messaging_cadence.canvas_name
    row: 26
    col: 0
    width: 24
    height: 9
  - title: Open Rates by Days Between Push Messages
    name: Open Rates by Days Between Push Messages
    model: braze_currents_block_message_engagement
    explore: push_messaging_cadence
    type: table
    fields:
    - push_messaging_cadence.days_since_last_sent_tier
    - push_messaging_cadence.push_open_rate
    fill_fields:
    - push_messaging_cadence.days_since_last_sent_tier
    filters:
      push_messaging_cadence.send_event: ">=2"
    sorts:
    - push_messaging_cadence.days_since_last_sent_tier
    limit: 500
    query_timezone: America/New_York
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      push_messaging_cadence.days_since_last_sent_tier: Days Since Last Sent
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting:
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
        __FILE: looker_blocks/push_marketing_pressure.dashboard.lookml
        __LINE_NUM: 525
      bold: false
      italic: false
      strikethrough: false
      fields:
      - push_messaging_cadence.push_open_rate
      __FILE: looker_blocks/push_marketing_pressure.dashboard.lookml
      __LINE_NUM: 520
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields:
    - push_send_cadence.total_push_sent
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: Underlying filter applied on this tile to ensure it does not include
      the first send event.
    listen:
      Date Range: push_messaging_cadence.send_date
      Platform: push_messaging_cadence.platform
      Campaign Name: push_messaging_cadence.campaign_name
      Canvas Name: push_messaging_cadence.canvas_name
    row: 35
    col: 0
    width: 12
    height: 9
  - title: Open Rates by Weeks Between Push Messages
    name: Open Rates by Weeks Between Push Messages
    model: braze_currents_block_message_engagement
    explore: push_messaging_cadence
    type: table
    fields:
    - push_messaging_cadence.push_open_rate
    - push_messaging_cadence.weeks_since_last_sent_tier
    fill_fields:
    - push_messaging_cadence.weeks_since_last_sent_tier
    filters:
      push_messaging_cadence.send_event: ">=2"
    sorts:
    - push_messaging_cadence.weeks_since_last_sent_tier
    limit: 500
    query_timezone: America/New_York
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      push_messaging_cadence.weeks_since_last_sent_tier: Weeks Since Last Sent
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting:
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
        __FILE: looker_blocks/push_marketing_pressure.dashboard.lookml
        __LINE_NUM: 627
      bold: false
      italic: false
      strikethrough: false
      fields:
      - push_messaging_cadence.push_open_rate
      __FILE: looker_blocks/push_marketing_pressure.dashboard.lookml
      __LINE_NUM: 622
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: true
    series_types: {}
    hidden_fields:
    - push_send_cadence.total_push_sent
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: Underlying filter applied on this tile to ensure it does not include
      the first send event.
    listen:
      Date Range: push_messaging_cadence.send_date
      Platform: push_messaging_cadence.platform
      Campaign Name: push_messaging_cadence.campaign_name
      Canvas Name: push_messaging_cadence.canvas_name
    row: 35
    col: 12
    width: 12
    height: 9
  - title: Impact of Monthly Push Campaigns on Engagement
    name: Impact of Monthly Push Campaigns on Engagement
    model: braze_currents_block_message_engagement
    explore: push_messaging_frequency
    type: looker_line
    fields:
    - push_messaging_frequency.frequency
    - push_messaging_frequency.push_open_rate
    - push_messaging_frequency.unique_recipients
    filters:
      push_messaging_frequency.date_granularity: month
    sorts:
    - push_messaging_frequency.frequency
    limit: 500
    trellis: ''
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle_outline
    series_types:
      push_messaging_frequency.push_delivered: column
      push_messaging_frequency.unique_recipients: column
    limit_displayed_rows: false
    y_axes:
    - label:
      orientation: left
      series:
      - id: push_messaging_frequency.unique_recipients
        name: Unique Recipients
        axisId: push_messaging_frequency.unique_recipients
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    - label:
      orientation: right
      series:
      - id: push_messaging_frequency.push_open_rate
        name: Push Open Rate
        axisId: push_messaging_frequency.push_open_rate
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Monthly Push Sent to a Unique User
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_label_rotation: 0
    show_null_points: true
    interpolation: monotone
    ordering: none
    label_rotation: 0
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - push_send_frequency.opens
    listen:
      Date Range: push_messaging_frequency.sent_date
      Platform: push_messaging_frequency.platform
      Campaign Name: push_messaging_frequency.campaign_name
      Canvas Name: push_messaging_frequency.canvas_name
    row: 2
    col: 0
    width: 24
    height: 10
  - title: Impact of Daily Push Campaigns on Engagement
    name: Impact of Daily Push Campaigns on Engagement
    model: braze_currents_block_message_engagement
    explore: push_messaging_frequency
    type: looker_line
    fields:
    - push_messaging_frequency.frequency
    - push_messaging_frequency.push_open_rate
    - push_messaging_frequency.unique_recipients
    filters:
      push_messaging_frequency.date_granularity: day
    sorts:
    - push_messaging_frequency.frequency
    limit: 500
    trellis: ''
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle_outline
    series_types:
      push_messaging_frequency.push_delivered: column
      push_messaging_frequency.unique_recipients: column
    limit_displayed_rows: false
    y_axes:
    - label:
      orientation: left
      series:
      - id: push_messaging_frequency.unique_recipients
        name: Unique Recipients
        axisId: push_messaging_frequency.unique_recipients
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    - label:
      orientation: right
      series:
      - id: push_messaging_frequency.push_open_rate
        name: Push Open Rate
        axisId: push_messaging_frequency.push_open_rate
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Daily Push Sent to a Unique User
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_label_rotation: 0
    show_null_points: true
    interpolation: monotone
    ordering: none
    label_rotation: 0
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - push_send_frequency.opens
    - frequency
    listen:
      Date Range: push_messaging_frequency.sent_date
      Platform: push_messaging_frequency.platform
      Campaign Name: push_messaging_frequency.campaign_name
      Canvas Name: push_messaging_frequency.canvas_name
    row: 12
    col: 0
    width: 12
    height: 10
  - title: Impact of Weekly Push Campaigns on Engagement
    name: Impact of Weekly Push Campaigns on Engagement
    model: braze_currents_block_message_engagement
    explore: push_messaging_frequency
    type: looker_line
    fields:
    - push_messaging_frequency.frequency
    - push_messaging_frequency.push_open_rate
    - push_messaging_frequency.unique_recipients
    filters:
      push_messaging_frequency.date_granularity: week
    sorts:
    - push_messaging_frequency.frequency
    limit: 500
    trellis: ''
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle_outline
    series_types:
      push_messaging_frequency.push_delivered: column
      push_messaging_frequency.unique_recipients: column
    limit_displayed_rows: false
    y_axes:
    - label:
      orientation: left
      series:
      - id: push_messaging_frequency.unique_recipients
        name: Unique Recipients
        axisId: push_messaging_frequency.unique_recipients
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    - label:
      orientation: right
      series:
      - id: push_messaging_frequency.push_open_rate
        name: Push Open Rate
        axisId: push_messaging_frequency.push_open_rate
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Weekly Push Sent to a Unique User
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_label_rotation: 0
    show_null_points: true
    interpolation: monotone
    ordering: none
    label_rotation: 0
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - push_send_frequency.opens
    listen:
      Date Range: push_messaging_frequency.sent_date
      Platform: push_messaging_frequency.platform
      Campaign Name: push_messaging_frequency.campaign_name
      Canvas Name: push_messaging_frequency.canvas_name
    row: 12
    col: 12
    width: 12
    height: 10
  filters:
  - name: Date Range
    title: Date Range
    type: date_filter
    default_value: 1 years
    allow_multiple_values: true
    required: false
  - name: Platform
    title: Platform
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: braze_currents_block_message_engagement
    explore: users_messages_pushnotification_send
    listens_to_filters: []
    field: users_messages_pushnotification_send.platform
  - name: Campaign Name
    title: Campaign Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: braze_currents_block_message_engagement
    explore: users_messages_pushnotification_send
    listens_to_filters: []
    field: users_messages_pushnotification_send.campaign_name
  - name: Canvas Name
    title: Canvas Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: braze_currents_block_message_engagement
    explore: users_messages_pushnotification_send
    listens_to_filters: []
    field: users_messages_pushnotification_send.canvas_name
