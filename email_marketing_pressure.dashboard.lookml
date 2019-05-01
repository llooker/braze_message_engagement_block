- dashboard: email_marketing_pressure
  title: Email Marketing Pressure
  layout: newspaper
  description: Uses email messaging cadence and frequency views to explore how email
    marketing timing and pressure affects user behavior.
  elements:
  - name: Email Send Frequency
    type: text
    title_text: Email Send Frequency
    subtitle_text: Explore how the number of emails sent to an email address in a
      given period of time (daily, weekly, monthly) affects engagement.
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 3
  - name: Email Send Cadence
    type: text
    title_text: Email Send Cadence
    subtitle_text: Explore how the timing and pattern of emails sent affects engagement.
    body_text: ''
    row: 23
    col: 0
    width: 24
    height: 2
  - title: average number of days between emails
    name: average number of days between emails
    model: braze_currents_block_message_engagement
    explore: email_messaging_cadence
    type: single_value
    fields:
    - email_messaging_cadence.average_number_of_days_since_last_received
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
      Date Range: email_messaging_cadence.delivery_date
      Campaign Name: email_messaging_cadence.campaign_name
      Canvas Name: email_messaging_cadence.canvas_name
    row: 25
    col: 0
    width: 24
    height: 2
  - title: Send Cadence Overview
    name: Send Cadence Overview
    model: braze_currents_block_message_engagement
    explore: email_messaging_cadence
    type: table
    fields:
    - email_messaging_cadence.delivery_event
    - email_messaging_cadence.average_number_of_days_since_last_received
    - email_messaging_cadence.emails_delivered
    - email_messaging_cadence.unique_click_rate
    - email_messaging_cadence.unique_open_rate
    sorts:
    - email_messaging_cadence.delivery_event
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
    - type: along a scale...
      value:
      background_color:
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 291
      bold: false
      italic: false
      strikethrough: false
      fields:
      - email_messaging_cadence.unique_click_rate
      __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
      __LINE_NUM: 286
    - type: along a scale...
      value:
      background_color:
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 310
      bold: false
      italic: false
      strikethrough: false
      fields:
      - email_messaging_cadence.unique_open_rate
      __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
      __LINE_NUM: 305
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: circle_outline
    series_types: {}
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: email_messaging_cadence.emails_delivered
        name: Total Emails Sent
        axisId: email_messaging_cadence.emails_delivered
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 338
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
      __LINE_NUM: 335
    - label:
      orientation: right
      series:
      - id: email_send_cadence.average_number_of_days_between_sends
        name: Average Number of Days Between Sends
        axisId: email_send_cadence.average_number_of_days_between_sends
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 353
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
      __LINE_NUM: 350
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
    hidden_fields: []
    note_state: expanded
    note_display: above
    note_text: "*Delivery event: 1=first email, 2=second email (total), 3=third email\
      \ (total), etc."
    listen:
      Date Range: email_messaging_cadence.delivery_date
      Campaign Name: email_messaging_cadence.campaign_name
      Canvas Name: email_messaging_cadence.canvas_name
    row: 27
    col: 0
    width: 24
    height: 10
  - title: Engagement by Weeks Between Emails
    name: Engagement by Weeks Between Emails
    model: braze_currents_block_message_engagement
    explore: email_messaging_cadence
    type: table
    fields:
    - email_messaging_cadence.weeks_since_last_received_tier
    - email_messaging_cadence.emails_delivered
    - email_messaging_cadence.unique_clicks
    - email_messaging_cadence.unique_opens
    fill_fields:
    - email_messaging_cadence.weeks_since_last_received_tier
    sorts:
    - email_messaging_cadence.weeks_since_last_received_tier
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: emails_delivered
      label: Emails Delivered
      expression: "${email_messaging_cadence.emails_delivered}"
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: unique_open_rate
      label: Unique Open Rate
      expression: "${email_messaging_cadence.unique_opens}/${email_messaging_cadence.emails_delivered}"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: unique_click_rate
      label: Unique Click Rate
      expression: "${email_messaging_cadence.unique_clicks}/${email_messaging_cadence.emails_delivered}"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/New_York
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      email_send_cadence.days_since_last_sent_tier: Weeks Since Last Sent
      email_messaging_cadence.weeks_since_last_received_tier: Weeks Since Last Sent
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
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 451
      bold: false
      italic: false
      strikethrough: false
      fields:
      - unique_open_rate
      __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
      __LINE_NUM: 446
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
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 470
      bold: false
      italic: false
      strikethrough: false
      fields:
      - unique_click_rate
      __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
      __LINE_NUM: 465
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    series_types: {}
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: 0 to 7 - 1 - unique_open_rate
        name: 0 to 7 - Unique Open Rate
        axisId: unique_open_rate
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 499
      - id: 8 to 14 - 2 - unique_open_rate
        name: 8 to 14 - Unique Open Rate
        axisId: unique_open_rate
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 504
      - id: 15 to 21 - 3 - unique_open_rate
        name: 15 to 21 - Unique Open Rate
        axisId: unique_open_rate
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 509
      - id: 22 to 28 - 4 - unique_open_rate
        name: 22 to 28 - Unique Open Rate
        axisId: unique_open_rate
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 514
      - id: 29 to 35 - 5 - unique_open_rate
        name: 29 to 35 - Unique Open Rate
        axisId: unique_open_rate
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 519
      - id: 36 or Above - 6 - unique_open_rate
        name: 36 or Above - Unique Open Rate
        axisId: unique_open_rate
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 524
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
      __LINE_NUM: 496
    - label:
      orientation: right
      series:
      - id: 0 to 7 - 1 - total_emails_sent
        name: 0 to 7 - Total Emails Sent
        axisId: total_emails_sent
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 539
      - id: 8 to 14 - 2 - total_emails_sent
        name: 8 to 14 - Total Emails Sent
        axisId: total_emails_sent
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 544
      - id: 15 to 21 - 3 - total_emails_sent
        name: 15 to 21 - Total Emails Sent
        axisId: total_emails_sent
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 549
      - id: 22 to 28 - 4 - total_emails_sent
        name: 22 to 28 - Total Emails Sent
        axisId: total_emails_sent
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 554
      - id: 29 to 35 - 5 - total_emails_sent
        name: 29 to 35 - Total Emails Sent
        axisId: total_emails_sent
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 559
      - id: 36 or Above - 6 - total_emails_sent
        name: 36 or Above - Total Emails Sent
        axisId: total_emails_sent
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 564
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
      __LINE_NUM: 536
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
    show_null_points: true
    interpolation: monotone
    ordering: none
    label_rotation: 0
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - email_messaging_cadence.emails_delivered
    - email_messaging_cadence.unique_clicks
    - email_messaging_cadence.unique_opens
    note_state: expanded
    note_display: hover
    note_text: Underlying filters have been applied to this tile so as to ensure that
      the first delivery event is not included.
    listen:
      Date Range: email_messaging_cadence.delivery_date
      Campaign Name: email_messaging_cadence.campaign_name
      Canvas Name: email_messaging_cadence.canvas_name
    row: 37
    col: 12
    width: 12
    height: 9
  - title: Impact of Monthly Email Campaigns on Engagement
    name: Impact of Monthly Email Campaigns on Engagement
    model: braze_currents_block_message_engagement
    explore: email_messaging_frequency
    type: looker_line
    fields:
    - email_messaging_frequency.frequency
    - email_messaging_frequency.unique_open_rate
    - email_messaging_frequency.unique_click_rate
    - email_messaging_frequency.unique_recipients
    filters:
      email_messaging_frequency.date_granularity: month
    sorts:
    - email_messaging_frequency.frequency
    limit: 500
    query_timezone: America/New_York
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
      email_messaging_frequency.emails_delivered: column
      email_messaging_frequency.unique_recipients: column
    limit_displayed_rows: false
    y_axes:
    - label:
      orientation: left
      series:
      - id: email_messaging_frequency.unique_recipients
        name: Unique Recipients
        axisId: email_messaging_frequency.unique_recipients
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 645
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
      __LINE_NUM: 642
    - label: Engagement
      orientation: right
      series:
      - id: email_messaging_frequency.unique_open_rate
        name: Unique Open Rate
        axisId: email_messaging_frequency.unique_open_rate
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 656
      - id: email_messaging_frequency.unique_click_rate
        name: Unique Click Rate
        axisId: email_messaging_frequency.unique_click_rate
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 659
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
      __LINE_NUM: 653
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Monthly Emails Received by a Unique User
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    reference_lines: []
    show_null_points: true
    interpolation: monotone
    ordering: none
    label_rotation: 0
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    note_state: expanded
    note_display: above
    note_text: ''
    listen:
      Date Range: email_messaging_frequency.delivered_time_date
      Campaign Name: email_messaging_frequency.campaign_name
      Canvas Name: email_messaging_frequency.canvas_name
    row: 3
    col: 0
    width: 24
    height: 10
  - title: Impact of Weekly Email Campaigns on Engagement
    name: Impact of Weekly Email Campaigns on Engagement
    model: braze_currents_block_message_engagement
    explore: email_messaging_frequency
    type: looker_line
    fields:
    - email_messaging_frequency.frequency
    - email_messaging_frequency.unique_open_rate
    - email_messaging_frequency.unique_click_rate
    - email_messaging_frequency.unique_recipients
    filters:
      email_messaging_frequency.date_granularity: week
    sorts:
    - email_messaging_frequency.frequency
    limit: 500
    query_timezone: America/New_York
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
      email_messaging_frequency.emails_delivered: column
      email_messaging_frequency.unique_recipients: column
    limit_displayed_rows: false
    y_axes:
    - label:
      orientation: left
      series:
      - id: email_messaging_frequency.unique_recipients
        name: Unique Recipients
        axisId: email_messaging_frequency.unique_recipients
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 733
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
      __LINE_NUM: 730
    - label: Engagement
      orientation: right
      series:
      - id: email_messaging_frequency.unique_open_rate
        name: Unique Open Rate
        axisId: email_messaging_frequency.unique_open_rate
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 744
      - id: email_messaging_frequency.unique_click_rate
        name: Unique Click Rate
        axisId: email_messaging_frequency.unique_click_rate
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 747
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
      __LINE_NUM: 741
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Weekly Emails Received by a Unique User
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: monotone
    ordering: none
    label_rotation: 0
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Date Range: email_messaging_frequency.delivered_time_date
      Campaign Name: email_messaging_frequency.campaign_name
      Canvas Name: email_messaging_frequency.canvas_name
    row: 13
    col: 0
    width: 12
    height: 10
  - title: Impact of Daily Email Campaigns on Engagement
    name: Impact of Daily Email Campaigns on Engagement
    model: braze_currents_block_message_engagement
    explore: email_messaging_frequency
    type: looker_line
    fields:
    - email_messaging_frequency.frequency
    - email_messaging_frequency.unique_open_rate
    - email_messaging_frequency.unique_click_rate
    - email_messaging_frequency.unique_recipients
    filters:
      email_messaging_frequency.date_granularity: day
    sorts:
    - email_messaging_frequency.frequency
    limit: 500
    query_timezone: America/New_York
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
      email_messaging_frequency.emails_delivered: column
      email_messaging_frequency.unique_recipients: column
    limit_displayed_rows: false
    y_axes:
    - label:
      orientation: left
      series:
      - id: email_messaging_frequency.unique_recipients
        name: Unique Recipients
        axisId: email_messaging_frequency.unique_recipients
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 817
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
      __LINE_NUM: 814
    - label: Engagement
      orientation: right
      series:
      - id: email_messaging_frequency.unique_open_rate
        name: Unique Open Rate
        axisId: email_messaging_frequency.unique_open_rate
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 828
      - id: email_messaging_frequency.unique_click_rate
        name: Unique Click Rate
        axisId: email_messaging_frequency.unique_click_rate
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 831
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
      __LINE_NUM: 825
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Daily Emails Received by a Unique User
    show_x_axis_ticks: true
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: monotone
    ordering: none
    label_rotation: 0
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Date Range: email_messaging_frequency.delivered_time_date
      Campaign Name: email_messaging_frequency.campaign_name
      Canvas Name: email_messaging_frequency.canvas_name
    row: 13
    col: 12
    width: 12
    height: 10
  - title: Engagement by Days Between Emails
    name: Engagement by Days Between Emails
    model: braze_currents_block_message_engagement
    explore: email_messaging_cadence
    type: table
    fields:
    - email_messaging_cadence.days_since_last_received_tier
    - email_messaging_cadence.emails_delivered
    - email_messaging_cadence.unique_click_rate
    - email_messaging_cadence.unique_open_rate
    filters:
      email_messaging_cadence.days_since_last_received_tier: "-Below 1"
      email_messaging_cadence.delivery_event: ">=2"
    sorts:
    - email_messaging_cadence.days_since_last_received_tier
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: emails_delivered
      label: Emails Delivered
      expression: "${email_messaging_cadence.emails_delivered}"
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    - table_calculation: unique_open_rate
      label: Unique Open Rate
      expression: "${email_messaging_cadence.unique_opens}/${email_messaging_cadence.emails_delivered}"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    - table_calculation: unique_click_rate
      label: Unique Click Rate
      expression: "${email_messaging_cadence.unique_clicks}/${email_messaging_cadence.emails_delivered}"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    query_timezone: America/New_York
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      email_send_cadence.weeks_since_last_sent_tier: Weeks Since Last Sent
      email_messaging_cadence.days_since_last_received_tier: Days Since Last Sent
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting:
    - type: along a scale...
      value:
      background_color:
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 929
      bold: false
      italic: false
      strikethrough: false
      fields:
      - email_messaging_cadence.unique_open_rate
      __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
      __LINE_NUM: 924
    - type: along a scale...
      value:
      background_color:
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 948
      bold: false
      italic: false
      strikethrough: false
      fields:
      - email_messaging_cadence.unique_click_rate
      __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
      __LINE_NUM: 943
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    series_types: {}
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: 0 to 7 - 1 - unique_open_rate
        name: 0 to 7 - Unique Open Rate
        axisId: unique_open_rate
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 977
      - id: 8 to 14 - 2 - unique_open_rate
        name: 8 to 14 - Unique Open Rate
        axisId: unique_open_rate
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 982
      - id: 15 to 21 - 3 - unique_open_rate
        name: 15 to 21 - Unique Open Rate
        axisId: unique_open_rate
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 987
      - id: 22 to 28 - 4 - unique_open_rate
        name: 22 to 28 - Unique Open Rate
        axisId: unique_open_rate
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 992
      - id: 29 to 35 - 5 - unique_open_rate
        name: 29 to 35 - Unique Open Rate
        axisId: unique_open_rate
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 997
      - id: 36 or Above - 6 - unique_open_rate
        name: 36 or Above - Unique Open Rate
        axisId: unique_open_rate
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 1002
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
      __LINE_NUM: 974
    - label:
      orientation: right
      series:
      - id: 0 to 7 - 1 - total_emails_sent
        name: 0 to 7 - Total Emails Sent
        axisId: total_emails_sent
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 1017
      - id: 8 to 14 - 2 - total_emails_sent
        name: 8 to 14 - Total Emails Sent
        axisId: total_emails_sent
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 1022
      - id: 15 to 21 - 3 - total_emails_sent
        name: 15 to 21 - Total Emails Sent
        axisId: total_emails_sent
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 1027
      - id: 22 to 28 - 4 - total_emails_sent
        name: 22 to 28 - Total Emails Sent
        axisId: total_emails_sent
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 1032
      - id: 29 to 35 - 5 - total_emails_sent
        name: 29 to 35 - Total Emails Sent
        axisId: total_emails_sent
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 1037
      - id: 36 or Above - 6 - total_emails_sent
        name: 36 or Above - Total Emails Sent
        axisId: total_emails_sent
        __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
        __LINE_NUM: 1042
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: looker_blocks/email_marketing_pressure.dashboard.lookml
      __LINE_NUM: 1014
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
    show_null_points: true
    interpolation: monotone
    ordering: none
    label_rotation: 0
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    note_state: expanded
    note_display: hover
    note_text: Underlying filters have been applied to this tile so as to ensure that
      the first delivery event is not included.
    listen:
      Date Range: email_messaging_cadence.delivery_date
      Campaign Name: email_messaging_cadence.campaign_name
      Canvas Name: email_messaging_cadence.canvas_name
    row: 37
    col: 0
    width: 12
    height: 9
  - title: Email Marketing Pressure and Engagement by Hour
    name: Email Marketing Pressure and Engagement by Hour
    model: braze_currents_block_message_engagement
    explore: users_messages_email_send
    type: looker_line
    fields:
    - users_messages_email_send.email_send_time_hour_of_day
    - users_messages_email_open.email_unique_open_rate
    - users_messages_email_click.email_unique_click_rate
    - users_messages_email_delivery.emails_delivered
    fill_fields:
    - users_messages_email_send.email_send_time_hour_of_day
    sorts:
    - users_messages_email_send.email_send_time_hour_of_day
    limit: 500
    query_timezone: America/New_York
    trellis: ''
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_labels:
      users_messages_email_open.email_unique_open_rate: Unique Open Rate
      users_messages_email_click.email_unique_click_rate: Unique Click Rate
    series_types:
      users_messages_email_send.emails_sent: column
      users_messages_email_delivery.emails_delivered: column
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: users_messages_email_delivery.emails_delivered
        name: Emails Delivered
        axisId: users_messages_email_delivery.emails_delivered
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label: Engagement Rates
      orientation: right
      series:
      - id: users_messages_email_open.email_unique_open_rate
        name: Unique Open Rate
        axisId: users_messages_email_open.email_unique_open_rate
      - id: users_messages_email_click.email_unique_click_rate
        name: Unique Click Rate
        axisId: users_messages_email_click.email_unique_click_rate
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
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
    listen:
      Date Range: users_messages_email_send.email_send_time_date
      Campaign Name: users_messages_email_send.campaign_name
      Canvas Name: users_messages_email_send.canvas_name
    row: 46
    col: 0
    width: 12
    height: 9
  - title: Email Marketing Pressure and Engagement by Day
    name: Email Marketing Pressure and Engagement by Day
    model: braze_currents_block_message_engagement
    explore: users_messages_email_send
    type: looker_line
    fields:
    - users_messages_email_send.email_send_time_day_of_week
    - users_messages_email_open.email_unique_open_rate
    - users_messages_email_click.email_unique_click_rate
    - users_messages_email_delivery.emails_delivered
    fill_fields:
    - users_messages_email_send.email_send_time_day_of_week
    sorts:
    - users_messages_email_send.email_send_time_day_of_week
    limit: 500
    query_timezone: America/New_York
    trellis: ''
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_labels:
      users_messages_email_click.email_unique_click_rate: Unique Click Rate
      users_messages_email_open.email_unique_open_rate: Unique Open Rate
    series_types:
      users_messages_email_send.emails_sent: column
      users_messages_email_delivery.emails_delivered: column
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: users_messages_email_delivery.emails_delivered
        name: Emails Delivered
        axisId: users_messages_email_delivery.emails_delivered
      showLabels: true
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label: Engagement Rates
      orientation: right
      series:
      - id: users_messages_email_open.email_unique_open_rate
        name: Unique Open Rate
        axisId: users_messages_email_open.email_unique_open_rate
      - id: users_messages_email_click.email_unique_click_rate
        name: Unique Click Rate
        axisId: users_messages_email_click.email_unique_click_rate
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
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
    listen:
      Date Range: users_messages_email_send.email_send_time_date
      Campaign Name: users_messages_email_send.campaign_name
      Canvas Name: users_messages_email_send.canvas_name
    row: 46
    col: 12
    width: 12
    height: 9
  filters:
  - name: Date Range
    title: Date Range
    type: date_filter
    default_value: 1 years
    allow_multiple_values: true
    required: false
  - name: Campaign Name
    title: Campaign Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: braze_currents_block_message_engagement
    explore: users_messages_email_send
    listens_to_filters: []
    field: users_messages_email_send.campaign_name
  - name: Canvas Name
    title: Canvas Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: braze_currents_block_message_engagement
    explore: users_messages_email_send
    listens_to_filters: []
    field: users_messages_email_send.canvas_name
