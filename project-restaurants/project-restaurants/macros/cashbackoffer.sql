-- macros/cashbackoffer.sql
{%- macro cashbackoffer(payment_method_col, amount_col, payment_methods) -%}
    {%- set cashback_rates = {
        "Credit Card": 0.05,
        "Debit Card": 0.03,
        "Mobile Payment": 0.07
    } -%}

    {%- set sql_parts = [] -%}

    {%- for payment_method in payment_methods -%}
        {%- set rate = cashback_rates.get(payment_method, 0) -%}
        {%- set sql_part = "when " ~ payment_method_col ~ " = '" ~ payment_method ~ "' then " ~ amount_col ~ " * " ~ rate -%}
        {%- do sql_parts.append(sql_part) -%}
    {%- endfor -%}
    {%- set case_when_sql = "case " ~ sql_parts | join(" ") ~ " else 0 end" -%}
    {%- set final_sql = case_when_sql ~ " as cashback" -%}

    {{ final_sql }}
{%- endmacro -%}
