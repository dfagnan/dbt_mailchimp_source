with base as (

    select *
    from {{ source('mailchimp','member')}}

), fields as (

    select 
        id as member_id,
        email_address,
        email_client,
        email_type,
        status,
        list_id,
        timestamp_signup as signup_date,
        timestamp_opt as opt_in_date,
        last_changed as last_changed_date
    from base

)

select *
from fields