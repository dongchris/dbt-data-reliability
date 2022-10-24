{% macro upload_information() %}
  {% if not execute or edr_cli_run %}
    {{ return('') }}
  {% endif %}

  {% set identifier = 'information' %}
  {% set relation = elementary.get_elementary_relation(identifier) %}
  {% if not relation %}
    {{ return('') }}
  {% endif %}

  {% if results %}
    {% if elementary.get_result_node(identifier) %}
      {{ return('') }}
    {% else %}
      {% do dbt.truncate_relation(relation) %}
    {% endif %}
  {% endif %}

  {% set data = [
    {'key': 'dbt_version', 'value': dbt_version},
    {'key': 'elementary_version', 'value': elementary.get_elementary_package_version()},
  ] %}
  {% do elementary.insert_rows(relation, data) %}
{% endmacro %}
