{{
  config(
    materialized = "view",
    schema = "stage",
    database = "pc_dbt_db"
  )
}}

select * from {{source('Hospital','src_patients')}}