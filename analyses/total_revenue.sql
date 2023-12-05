with payments as (
    select * from  {{ ref( 'stg_payments') }}
),

revenue as (
    select 
        sum(case when status = 'success' 
            then amount
            else 0 end) 
            as total_revenue
    from payments
)

select * from revenue