select doctor_id,
first_name,
last_name,
initcap(specialization) as specialization,
phone_number,
concat(years_experience,' years') as years_experience,
initcap(hospital_branch) as hospital_branch,
email,
last_updated_date
 from {{ ref('stg_doctors') }}