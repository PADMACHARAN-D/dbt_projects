select  
{{dbt_utils.generate_surrogate_key(['patient_id']) }} as surrogate_key,
patient_id,
{{isnull('first_name')}},
{{isnull('last_name')}},
{{gender('gender')}},
date_of_birth,
{{validate_phone_max_10_digits('contact_number')}},
address,
insurance_provider,
insurance_number,
email,
registration_date,
dbt_updated_at,
dbt_valid_from,
dbt_valid_to
from {{ ref('patient_snapshots') }}