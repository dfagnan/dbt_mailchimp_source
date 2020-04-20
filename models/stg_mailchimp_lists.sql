with base as (

    select *
    from {{ source('mailchimp','list')}}

), fields as (

    select 
        id as list_id,
        date_created,
        name,
        list_rating
    from base

)

select *
from fields