with base as (

    select *
    from {{ source('mailchimp','campaign_recipient')}}

), fields as (

    select 
        campaign_id,
        member_id,
        combination_id,
        list_id
    from base

), unique_key as (

    select 
        *,
        {{ dbt_utils.surrogate_key(['campaign_id','member_id','list_id']) }} as id,
        {{ dbt_utils.surrogate_key(['campaign_id','member_id']) }} as email_id
    from fields
    
)

select *
from unique_key