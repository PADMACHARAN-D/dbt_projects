{{ config(
    tags = 'marts_fact'
) }}
select * from {{ ref('int_appointments') }}