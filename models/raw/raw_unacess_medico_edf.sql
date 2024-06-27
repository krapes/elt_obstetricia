with raw_unacess_medico_edf as (

    select * from {{ ref('unacess_medico_edf') }}

)

select *
from raw_unacess_medico_edf