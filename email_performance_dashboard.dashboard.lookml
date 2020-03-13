- dashboard: email_performance_dashboard
  title: Email Performance Dashboard
  layout: newspaper
  elements:
  - title: Email Performance by Week
    name: Email Performance by Week
    model: braze_currents_block_message_engagement
    explore:  email_fact
    type: looker_column
    fields:
    -  email_fact.email_unique_open_rate
    -  email_fact.email_unique_click_rate
    -  email_fact.email_unique_clicks
    -  email_fact.email_unique_opens
    -  email_fact.emails_delivered
    -  email_fact.email_send_time_week
    fill_fields:
    -  email_fact.email_send_time_week
    sorts:
    -  email_fact.email_send_time_week desc
    limit: 500
    stacking: ''
    show_value_labels: false
    label_density: 25
    font_size: '10'
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_types:
       email_fact.email_unique_open_rate: line
       email_fact.email_unique_click_rate: line
    limit_displayed_rows: false
    y_axes:
    - label: Email Volume
      orientation: left
      series:
      - id:  email_fact.emails_delivered
        name: Emails Delivered
        axisId:  email_fact.emails_delivered
      - id:  email_fact.email_unique_opens
        name: Email Unique Opens
        axisId:  email_fact.email_unique_opens
      - id:  email_fact.email_unique_clicks
        name: Email Unique Clicks
        axisId:  email_fact.email_unique_clicks
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label: Email Rates
      orientation: right
      series:
      - id:  email_fact.email_unique_click_rate
        name: Email Unique Click Rate
        axisId:  email_fact.email_unique_click_rate
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
    x_axis_label: Week Sent
    show_x_axis_ticks: true
    x_axis_datetime_label: "%b %d %Y"
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_label_rotation: -45
    ordering: none
    label_rotation: 0
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 11
  - title: Email Deliverability Overview by Day
    name: Email Deliverability Overview by Day
    model: braze_currents_block_message_engagement
    explore:  email_fact
    type: table
    fields:
    -  email_fact.email_send_time_date
    -  email_fact.email_delivery_rate
    -  email_fact.email_bounce_rate
    # - users_messages_email_softbounce.email_soft_bounce_rate
    -  email_fact.marked_as_spam_rate
    fill_fields:
    -  email_fact.email_send_time_date
    sorts:
    -  email_fact.email_send_time_date desc
    limit: 500
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
       email_fact.email_send_time_date: Date Sent
       email_fact.email_delivery_rate: Delivery Rate
       email_fact.email_bounce_rate: Bounce Rate
      # users_messages_email_softbounce.email_soft_bounce_rate: Soft Bounce Rate
       email_fact.emails_marked_as_spam: Marked as Spam
       email_fact.marked_as_spam_rate: Marked as Spam Rate
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting:
    - type: high to low
      value:
      background_color:
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields:
      -  email_fact.marked_as_spam_rate
    - type: high to low
      value:
      background_color:
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields:
      -  email_fact.email_bounce_rate
    # - type: high to low
    #  value:
    #  background_color:
    #  font_color:
    #  palette:
    #    name: Red to Yellow to Green
    #    colors:
    #    - "#F36254"
    #    - "#FCF758"
    #    - "#4FBC89"
    #  bold: false
    #  italic: false
    #  strikethrough: false
    #  fields:
    #  - users_messages_email_softbounce.email_soft_bounce_rate
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
      bold: false
      italic: false
      strikethrough: false
      fields:
      -  email_fact.email_delivery_rate
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
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
    listen: {}
    row: 22
    col: 0
    width: 24
    height: 10
  - title: Deliverability Performance by Week
    name: Deliverability Performance by Week
    model: braze_currents_block_message_engagement
    explore:  email_fact
    type: looker_column
    fields:
    -  email_fact.email_send_time_week
    -  email_fact.email_bounces
    -  email_fact.email_bounce_rate
    # - users_messages_email_softbounce.emails_soft_bounced
    # - users_messages_email_softbounce.email_soft_bounce_rate
    -  email_fact.email_delivery_rate
    -  email_fact.emails_marked_as_spam
    -  email_fact.emails_delivered
    fill_fields:
    -  email_fact.email_send_time_week
    sorts:
    -  email_fact.email_send_time_week
    limit: 500
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_types:
       email_fact.email_delivery_rate: line
      # users_messages_email_softbounce.email_soft_bounce_rate: line
       email_fact.email_bounce_rate: line
    limit_displayed_rows: false
    y_axes:
    - label: Email Volume
      orientation: left
      series:
      - id:  email_fact.email_bounces
        name: Email Bounces
        axisId:  email_fact.email_bounces
      # - id: users_messages_email_softbounce.emails_soft_bounced
      #   name: Emails Soft Bounced
      #   axisId: users_messages_email_softbounce.emails_soft_bounced
      - id:  email_fact.emails_delivered
        name: Emails Delivered
        axisId:  email_fact.emails_delivered
      - id:  email_fact.emails_marked_as_spam
        name: Emails Marked As Spam
        axisId:  email_fact.emails_marked_as_spam
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label: Email Rates
      orientation: right
      series:
      - id:  email_fact.email_bounce_rate
        name: Email Bounce Rate
        axisId:  email_fact.email_bounce_rate
      # - id: users_messages_email_softbounce.email_soft_bounce_rate
      #   name: Email Soft Bounce Rate
      #   axisId: users_messages_email_softbounce.email_soft_bounce_rate
      - id:  email_fact.email_delivery_rate
        name: Email Delivery Rate
        axisId:  email_fact.email_delivery_rate
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
    x_axis_label: Week Sent
    show_x_axis_ticks: true
    x_axis_datetime_label: "%b %d %Y"
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_label_rotation: -45
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 11
    col: 0
    width: 24
    height: 11
