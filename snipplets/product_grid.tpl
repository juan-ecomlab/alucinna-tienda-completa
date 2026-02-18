{% if products and pages.is_last %}
	<div class="last-page" style="display:none;"></div>
{% endif %}

{% for product in products %}
	{# Reviso si tiene variante de colores #}
 
	{% set print = false %}
	{% if product.variations %}
		{% for variation in product.variations %}
			{% if variation.name in ['COLOR', 'color', 'Color', 'Cor'] %}
				{% if variation.options | length > 0 %}
					{% for option in variation.options %}
						{% set has_color_variant = true %}
						{% set variation_name = variation.name %}
						{% set variant_color_name = option.name %}
						{% set has_variant_stock = true %}

						{% for variante in product.variants_object %}
							{% if (variante.option0 == variant_color_name or variante.option1 == variant_color_name) and variante.stock > 0 %}
								{% set has_variant_stock = true %}
							{% endif %}
						{% endfor %}	

						{% if has_variant_stock %}
							{% include 'snipplets/grid/item.tpl' with {variant_color_name: variant_color_name, has_color_variant: has_color_variant} %}
						{% endif %}

						{% set print = true %}
					{% endfor %}
				{% endif %}
			{% endif %}
		{% endfor %}
	{% endif %}

	{% if not print %}
		{% include 'snipplets/grid/item.tpl' %}
	{% endif %}
{% endfor %}