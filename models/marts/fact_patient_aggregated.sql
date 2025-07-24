{{ config(
    tags = 'marts_fact'
) }}
select * from {{ ref('int_patient_activity') }}