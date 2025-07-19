{{
  config(
    materialized = "table",
    schema = "stage",
    database = "pc_dbt_db"
  )
}}

select *,current_timestamp as last_updated_date from {{source('Hospital','src_doctors')}}