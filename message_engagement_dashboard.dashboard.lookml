- dashboard: message_engagement_dashboard
  title: Message Engagement Dashboard
  layout: newspaper
  elements:
  - title: Top 10 Performing Email Campaigns by Open Rate
    name: Top 10 Performing Email Campaigns by Open Rate
    model: braze_currents_block_message_engagement
    explore:  email_fact
    type: looker_column
    fields:
    -  email_fact.email_unique_open_rate
    -  email_fact.email_unique_opens
    -  email_fact.emails_sent
    -  email_fact.send_campaign_name
    filters:
       email_fact.send_campaign_id: "-NULL"
    sorts:
    -  email_fact.email_unique_open_rate desc
    limit: 500
    query_timezone: America/New_York
    stacking: ''
    show_value_labels: true
    label_density: 25
    font_size: '12'
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle_outline
    series_types:
       email_fact.email_unique_open_rate: line
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    y_axes:
    - label: Email Volume
      orientation: left
      series:
      - id:  email_fact.email_unique_opens
        name: Email Unique Opens
        axisId:  email_fact.email_unique_opens
      - id:  email_fact.emails_sent
        name: Emails Sent
        axisId:  email_fact.emails_sent
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label: Unique Open Rate
      orientation: right
      series:
      - id:  email_fact.email_unique_open_rate
        name: Email Unique Open Rate
        axisId:  email_fact.email_unique_open_rate
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
    x_axis_label: Campaign Name
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    label_rotation: 0
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    listen:
      Email Sent Date:  email_fact.email_send_time_date
    row: 0
    col: 0
    width: 12
    height: 9
  - title: Top 10 Performing Email Campaigns by Click Rate
    name: Top 10 Performing Email Campaigns by Click Rate
    model: braze_currents_block_message_engagement
    explore:  email_fact
    type: looker_column
    fields:
    -  email_fact.email_unique_click_rate
    -  email_fact.email_unique_clicks
    -  email_fact.emails_sent
    -  email_fact.send_campaign_name
    filters:
       email_fact.send_campaign_id: "-NULL"
    sorts:
    -  email_fact.email_unique_click_rate desc
    limit: 500
    column_limit: 50
    query_timezone: America/New_York
    stacking: ''
    show_value_labels: true
    label_density: 25
    font_size: '12'
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle_outline
    series_types:
       email_fact.email_unique_open_rate: line
       email_fact.email_unique_click_rate: line
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    y_axes:
    - label: Email Volume
      orientation: left
      series:
      - id:  email_fact.emails_sent
        name: Emails Sent
        axisId:  email_fact.emails_sent
      - id:  email_fact.email_unique_clicks
        name: Email Unique Clicks
        axisId:  email_fact.email_unique_clicks
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label: Unique Click Rate
      orientation: right
      series:
      - id:  email_fact.email_unique_click_rate
        name: Email Unique Click Rate
        axisId:  email_fact.email_unique_click_rate
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
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    label_rotation: 0
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    listen:
      Email Sent Date:  email_fact.email_send_time_date
    row: 0
    col: 12
    width: 12
    height: 9
  - title: Bottom 10 Performing Email Campaigns by Open Rate
    name: Bottom 10 Performing Email Campaigns by Open Rate
    model: braze_currents_block_message_engagement
    explore:  email_fact
    type: looker_column
    fields:
    -  email_fact.email_unique_open_rate
    -  email_fact.email_unique_opens
    -  email_fact.emails_sent
    -  email_fact.send_campaign_name
    filters:
       email_fact.send_campaign_id: "-NULL"
    sorts:
    -  email_fact.email_unique_open_rate
    limit: 500
    column_limit: 50
    query_timezone: America/New_York
    stacking: ''
    show_value_labels: true
    label_density: 25
    font_size: '12'
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle_outline
    series_types:
       email_fact.email_unique_open_rate: line
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    y_axes:
    - label: Email Volume
      orientation: left
      series:
      - id:  email_fact.email_unique_opens
        name: Email Unique Opens
        axisId:  email_fact.email_unique_opens
      - id:  email_fact.emails_sent
        name: Emails Sent
        axisId:  email_fact.emails_sent
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label: Unique Open Rate
      orientation: right
      series:
      - id:  email_fact.email_unique_open_rate
        name: Email Unique Open Rate
        axisId:  email_fact.email_unique_open_rate
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
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    label_rotation: 0
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    listen:
      Email Sent Date:  email_fact.email_send_time_date
    row: 9
    col: 0
    width: 12
    height: 9
  - title: Bottom 10 Performing Email Campaigns by Click Rate
    name: Bottom 10 Performing Email Campaigns by Click Rate
    model: braze_currents_block_message_engagement
    explore:  email_fact
    type: looker_column
    fields:
    -  email_fact.email_unique_click_rate
    -  email_fact.email_unique_clicks
    -  email_fact.emails_sent
    -  email_fact.send_campaign_name
    filters:
       email_fact.send_campaign_id: "-NULL"
    sorts:
    -  email_fact.email_unique_click_rate
    limit: 500
    column_limit: 50
    query_timezone: America/New_York
    stacking: ''
    show_value_labels: true
    label_density: 25
    font_size: '12'
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle_outline
    series_types:
       email_fact.email_unique_open_rate: line
       email_fact.email_unique_click_rate: line
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    y_axes:
    - label: Email Volume
      orientation: left
      series:
      - id:  email_fact.emails_sent
        name: Emails Sent
        axisId:  email_fact.emails_sent
      - id:  email_fact.email_unique_clicks
        name: Email Unique Clicks
        axisId:  email_fact.email_unique_clicks
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label: Unique Click Rate
      orientation: right
      series:
      - id:  email_fact.email_unique_click_rate
        name: Email Unique Click Rate
        axisId:  email_fact.email_unique_click_rate
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
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    label_rotation: 0
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    listen:
      Email Sent Date:  email_fact.email_send_time_date
    row: 9
    col: 12
    width: 12
    height: 9
  - title: Top 10 Performing Push Campaigns by Open Rate
    name: Top 10 Performing Push Campaigns by Open Rate
    model: braze_currents_block_message_engagement
    explore:  push_fact
    type: looker_line
    fields:
    -  push_fact.push_open_rate
    -  push_fact.push_opens
    -  push_fact.push_sent
    -  push_fact.send_campaign_name
    sorts:
    -  push_fact.push_open_rate desc
    limit: 500
    query_timezone: America/New_York
    stacking: ''
    show_value_labels: true
    label_density: 25
    font_size: ''
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_types:
       push_fact.push_sent: column
       push_fact.push_opens: column
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    y_axes:
    - label: Push Volume
      orientation: left
      series:
      - id:  push_fact.push_opens
        name: Push Opens
        axisId:  push_fact.push_opens
      - id:  push_fact.push_sent
        name: Push Sent
        axisId:  push_fact.push_sent
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    - label:
      orientation: right
      series:
      - id:  push_fact.push_open_rate
        name: Push Open Rate
        axisId:  push_fact.push_open_rate
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
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: monotone
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Push Sent Date:  push_fact.push_sent_time_date
    row: 18
    col: 0
    width: 12
    height: 9
  - title: Bottom 10 Performing Campaigns by Open Rate
    name: Bottom 10 Performing Campaigns by Open Rate
    model: braze_currents_block_message_engagement
    explore:  push_fact
    type: looker_line
    fields:
    -  push_fact.push_open_rate
    -  push_fact.push_opens
    -  push_fact.push_sent
    -  push_fact.send_campaign_name
    sorts:
    -  push_fact.push_open_rate
    limit: 500
    query_timezone: America/New_York
    stacking: ''
    show_value_labels: true
    label_density: 25
    font_size: ''
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_types:
       push_fact.push_sent: column
       push_fact.push_opens: column
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    y_axes:
    - label: Push Volume
      orientation: left
      series:
      - id:  push_fact.push_opens
        name: Push Opens
        axisId:  push_fact.push_opens
      - id:  push_fact.push_sent
        name: Push Sent
        axisId:  push_fact.push_sent
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    - label:
      orientation: right
      series:
      - id:  push_fact.push_open_rate
        name: Push Open Rate
        axisId:  push_fact.push_open_rate
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
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: monotone
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Push Sent Date:  push_fact.push_sent_time_date
    row: 18
    col: 12
    width: 12
    height: 9
  filters:
  - name: Email Sent Date
    title: Email Sent Date
    type: field_filter
    default_value: 30 days
    allow_multiple_values: true
    required: false
    model: braze_currents_block_message_engagement
    explore:  email_fact
    listens_to_filters: []
    field:  email_fact.email_send_time_date
  - name: Push Sent Date
    title: Push Sent Date
    type: field_filter
    default_value: 30 days
    allow_multiple_values: true
    required: false
    model: braze_currents_block_message_engagement
    explore:  push_fact
    listens_to_filters: []
    field:  push_fact.push_sent_time_date
