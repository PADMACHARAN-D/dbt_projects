{{
  config(
    materialized = "view",
    schema = "stage",
    database = "pc_dbt_db",
    tags = 'stage'
  )
}}

select * from {{source('Hospital','src_patients')}}