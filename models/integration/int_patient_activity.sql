{{
    config(
        tags = 'integration'
    )   
}}
with patient as(
    select patient_id from {{ ref('dim_patient') }}    
),
appointments as (
    select patient_id,
    count(*) as total_appointments,
    min(appointment_date) as first_appointment_date,
    max(appointment_date) as last_appointment_date,
    count(case when status = 'No-show' then 1 end) as no_show_count
    from {{ ref('stg_appointments')}}
    group by 1
),
billing as (
    select patient_id,sum(amount) as total_billed,
    sum(case when payment_status = 'Paid' then amount end) as total_paid 
    from {{ ref('stg_billing') }}
    group by 1
)

select p.patient_id,a.total_appointments,b.total_billed,b.total_paid,a.no_show_count,
a.first_appointment_date,a.last_appointment_date
from patient p 
join appointments a on p.patient_id = a.patient_id 
join billing b on b.patient_id = p.patient_id
