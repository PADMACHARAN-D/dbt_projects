{{
  config(
    materialized = "view",
    schema = "stage",
    tags = 'stage'
  )
}}

select * from {{source('Hospital','src_billing')}}