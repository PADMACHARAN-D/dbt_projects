{{
  config(
    materialized = "view",
    schema = "stage",
    database = "pc_dbt_db"
  )
}}

select *,current_timestamp as last_updated from {{source('Hospital','src_treatments')}}