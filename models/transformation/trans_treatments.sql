with base as(
    select {{dbt_utils.generate_surrogate_key(['treatment_id']) }} as surrogate_key,
concat('TRP_',treatment_type) as treatment_id,
treatment_type,
description,
concat(
    (min(cost) over (partition by treatment_type)),
    '-',
    (max(cost) over (partition by treatment_type)) ) as cost_range,
last_updated
from {{ ref('stg_treatments') }} )
select * from base



