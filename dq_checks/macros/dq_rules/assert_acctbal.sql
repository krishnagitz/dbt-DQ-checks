{% macro test_assert_job_acctbal (model,column_name,tolerance) %}
{{ config (
    database='SNOWFLAKE_SAMPLE_DATA',
    severity = 'warn',
    tags=['acct_bal']
    )
}}

with acct_bal as (
select c_custkey, c_name, {{column_name}} from {{model}} where c_acctbal <0)

select * from acct_bal where {{column_name}} > {{tolerance}}

{% endmacro %}
