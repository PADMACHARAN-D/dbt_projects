with patient as(
    select patient_id from {{ ref('dim_patient') }}
),
billing as(
    select bill_id,patient_id,treatment_id,bill_date,amount,payment_method,payment_status
    from {{ ref('stg_billing') }}   
)
select  b.bill_id,p.patient_id,b.treatment_id,b.bill_date,b.amount,b.payment_method,b.payment_status
from billing b join patient p on b.patient_id=p.patient_id