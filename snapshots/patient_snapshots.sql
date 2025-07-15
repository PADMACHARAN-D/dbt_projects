{% snapshot patient_snapshots %}

{{
  config(
    target_schema='snapshots',         
    unique_key='patient_id',            
    strategy='check',
    check_cols=['contact_number', 'address', 'insurance_provider'],
    database = "pc_dbt_db"
    )
}}

SELECT *
FROM {{ ref('stg_patients') }}

{% endsnapshot %}