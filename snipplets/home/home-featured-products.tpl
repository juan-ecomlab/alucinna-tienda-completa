{% set has_featured = has_featured | default(false) and sections.primary.products %}
{% set has_new = has_new | default(false) and sections.new.products %}
{% set has_sale = has_sale | default(false) and sections.sale.products %}
{% set has_promotion = has_promotion | default(false) and sections.promotion.products %}
{% set has_best_seller = has_best_seller | default(false) and sections.best_seller.products %}

{% if has_featured %}
	{% set data_store_name = 'featured' %}
	{% set featured_products_classes = settings.featured_product_colors ? 'section-featured-products-home section-featured-products-home-colors section-home-color' : 'section-featured-products-home' %}
{% elseif has_new %}
	{% set data_store_name = 'new' %}
	{% set featured_new_classes = settings.new_product_colors ? 'section-new-products-home section-new-products-home-colors section-home-color' : 'section-new-products-home' %}
{% elseif has_sale %}
	{% set data_store_name = 'sale' %}
	{% set featured_sale_classes = settings.sale_product_colors ? 'section-sale-products-home section-sale-products-home-colors section-home-color' : 'section-sale-products-home' %}
{% elseif has_promotion %}
	{% set data_store_name = 'promotion' %}
	{% set featured_promotion_classes = settings.promotion_product_colors ? 'section-promotion-products-home section-promotion-products-home-colors section-home-color' : 'section-sale-products-home' %}
{% else %}
	{% set data_store_name = 'best-seller' %}
	{% set featured_best_seller_classes = settings.best_seller_product_colors ? 'section-best-seller-products-home section-best-seller-products-home-colors section-home-color' : 'best-seller-sale-products-home' %}
{% endif %}

{% if has_featured or has_new or has_sale or has_promotion or has_best_seller %}
	<section class="section-home section-featured-home {% if has_featured %}{{ featured_products_classes }}{% endif %}{% if has_new %}{{ featured_new_classes }}{% endif %}{% if has_sale %}{{ featured_sale_classes }}{% endif %}{% if has_promotion %}{{ featured_promotion_classes }}{% endif %}{% if has_best_seller %}{{ featured_best_seller_classes }}{% endif %}" data-store="home-products-{{ data_store_name }}">
		{% if has_featured %}
			{% include 'snipplets/home/home-featured-grid.tpl' with {'featured_products': true} %}
		{% endif %}
		{% if has_new %}
			{% include 'snipplets/home/home-featured-grid.tpl' with {'new_products': true} %}
		{% endif %}
		{% if has_sale %}
			{% include 'snipplets/home/home-featured-grid.tpl' with {'sale_products': true} %}
		{% endif %}
		{% if has_promotion %}
			{% include 'snipplets/home/home-featured-grid.tpl' with {'promotion_products': true} %}
		{% endif %}
		{% if has_best_seller %}
			{% include 'snipplets/home/home-featured-grid.tpl' with {'best_seller_products': true} %}
		{% endif %}
	</section>
{% endif %}
