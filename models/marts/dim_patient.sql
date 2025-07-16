select  
{{dbt_utils.generate_surrogate_key(['patient_id']) }} as surrogate_key,
patient_id,
{{isnull('first_name')}} as first_name,
{{isnull('last_name')}} as last_name,
{{gender('gender')}} as gender,
{{customdate('date_of_birth')}} as date_of_birth,
{{validate_phone_max_10_digits('contact_number')}} as contact_number, 
address,
insurance_provider,
insurance_number,
{{ is_valid_email('email')}} as email,
registration_date,
dbt_updated_at,
dbt_valid_from as effective_start_date,
dbt_valid_to as effective_end_date,
{{isactive('dbt_valid_to')}} as isactive
from {{ ref('patient_snapshots') }}