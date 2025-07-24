{{ config(
    tags = 'marts_dim'
) }}
{{ config(
    materialized='incremental',
    unique_key='treatment_id',
    incremental = 'merge'
) }}

with existing as (
    select
        surrogate_key,
        treatment_id,
        treatment_type,
        description,
        cost_range,
        last_updated
    from {{ ref('int_treatments') }}
)
select * from existing

{% if is_incremental() %}
  where last_updated> (select max(last_updated) from {{this}})
{% endif %}
