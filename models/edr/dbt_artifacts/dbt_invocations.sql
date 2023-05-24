{{
  config(
    materialized = 'incremental',
    transient=False,
    unique_key = 'invocation_id',
    on_schema_change = 'append_new_columns',
    full_refresh=elementary.get_config_var('elementary_full_refresh'),
    meta={"timestamp_column": "generated_at"},
    post_hook="{{ init_created_at_column() }}"
  )
}}

{{ elementary.get_dbt_invocations_empty_table_query() }}
