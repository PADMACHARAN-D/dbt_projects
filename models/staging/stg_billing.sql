{{
  config(
    materialized = "view",
    schema = "stage",
  )
}}

select * from {{source('Hospital','src_billing')}}