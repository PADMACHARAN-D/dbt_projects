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
),
final as (
    select
        b.surrogate_key,
        b.treatment_id,
        b.treatment_type,
        b.description,
        b.cost_range,
        case
            when e.treatment_id is null then current_timestamp
            when b.description != e.description or b.cost_range != e.cost_range then current_timestamp
            else e.last_updated
        end as last_updated
    from {{this}} as b
    left join existing e on b.treatment_id = e.treatment_id
)
select * from final

{% if is_incremental() %}
  where last_updated> (select max(last_updated) from {{ this}})
{% endif %}
