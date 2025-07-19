with patient as (
    select surrogate_key,patient_id from {{ ref('dim_patient') }}
),
doctor as (
    select doctor_id from {{ ref('dim_doctor') }}
)
select a.appointment_id,p.surrogate_key as patient_id,d.doctor_id as doctor_id,a.appointment_time,a.reason_for_visit,a.status
from {{ ref('stg_appointments') }} as a join doctor d on a.doctor_id = d.doctor_id  join patient p on a.patient_id = p.patient_id