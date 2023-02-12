{% macro edr_quote(str) %}
    {% do return("'{}'".format(str)) %}
{% endmacro %}

{% macro edr_quote_column(column_name) %}
    {{ adapter.dispatch('edr_quote_column','elementary')(column_name) }}
{% endmacro %}

{%- macro default__edr_quote_column(column_name) -%}
    {% if adapter.quote(column_name[1:-1]) == column_name %}
        {{ return(column_name) }}
    {% else %}
        {% set quoted_column = adapter.quote(column_name) %}
        {{ return(quoted_column) }}
    {% endif %}
{%- endmacro -%}

