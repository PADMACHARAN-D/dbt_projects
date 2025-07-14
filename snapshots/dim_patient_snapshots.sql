{{
  config(
    materialized = "table",
    schema = "snapshots",
    database = "pc_dbt_db"
  )
}}

{% snapshot dim_patient %}

{{
  config(
    target_schema='snapshots',         
    unique_key='patient_id',            
    strategy='check',
    check_cols=['contact_number', 'address', 'insurance_provider']  
    )
}}

SELECT *
FROM {{ ref('stg_patient') }}

{% endsnapshot %}