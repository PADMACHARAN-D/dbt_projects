with treatments as(
    select *,row_number() over(partition by treatment_id order by last_updated) as rnk from {{ ref('trans_treatments') }} 
)
select * from treatments
where rnk = 1