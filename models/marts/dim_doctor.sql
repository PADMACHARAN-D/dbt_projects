{{ config(
    materialized='incremental',
    unique_key='doctor_id',
    incremental_strategy = 'insert_overwrite',
    tags = "marts_dim"
) }}

select *
from {{ ref('trans_doctor') }}
{% if is_incremental() %}
  where last_updated_date > (select max(last_updated_date) from {{ this}})
{% endif %}