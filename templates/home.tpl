{# Detect presence of features that remove empty placeholders #}

{% set has_main_slider = settings.slider and settings.slider is not empty %}
{% set has_mobile_slider = settings.toggle_slider_mobile and settings.slider_mobile and settings.slider_mobile is not empty %}
{% set has_video = settings.video_embed %}
{% set has_main_categories = settings.main_categories and settings.slider_categories and settings.slider_categories is not empty %}
{% set has_banners = settings.banner and settings.banner is not empty %}
{% set has_promotional_banners = settings.banner_promotional and settings.banner_promotional is not empty %}
{% set has_news_banners = settings.banner_news and settings.banner_news is not empty %}
{% set has_brands = settings.brands and settings.brands is not empty %}
{% set has_informative_banners = settings.banner_services and (settings.banner_services_01_title or settings.banner_services_02_title or settings.banner_services_03_title or settings.banner_services_01_description or settings.banner_services_02_description or settings.banner_services_03_description) %}
{% set has_instafeed = settings.show_instafeed and store.instagram and store.hasInstagramToken() %}
{% set has_institutional_message = settings.institutional_subtitle or settings.institutional_message or settings.institutional_text %}
{% set has_welcome_message = settings.welcome_message %}

{% set has_testimonial_01 = settings.testimonial_01_description or settings.testimonial_01_name or "testimonial_01.jpg" | has_custom_image %}
{% set has_testimonial_02 = settings.testimonial_02_description or settings.testimonial_02_name or "testimonial_02.jpg" | has_custom_image %}
{% set has_testimonial_03 = settings.testimonial_03_description or settings.testimonial_03_name or "testimonial_03.jpg" | has_custom_image %}
{% set has_testimonials = has_testimonial_01 or has_testimonial_02 or has_testimonial_03 %}

{% set show_help = not (has_main_slider or has_mobile_slider or has_video or has_main_categories or has_banners or has_promotional_banners or has_news_banners or has_brands or has_informative_banners or has_instafeed or has_testimonials or has_institutional_message or has_welcome_message) and not has_products %}

{% set help_url = has_products ? '/admin/products/feature/' : '/admin/products/new/' %}

{# **** This will show default products in the home page before you upload some products **** #}
{% if show_help %}
	{% snipplet 'defaults/show_help.tpl' %}
{% else %}

	{# END of show default products in the home page #}

	{#  **** Features Order ****  #}
	{% set newArray = [] %}

	{% for section in ['home_order_position_1', 'home_order_position_2', 'home_order_position_3', 'home_order_position_4', 'home_order_position_5', 'home_order_position_6', 'home_order_position_7', 'home_order_position_8', 'home_order_position_9',  'home_order_position_10', 'home_order_position_11', 'home_order_position_12', 'home_order_position_13', 'home_order_position_14', 'home_order_position_15', 'home_order_position_16', 'home_order_position_17', 'home_order_position_18'] %}
		{% set section_select = attribute(settings,"#{section}") %}

		{% if section_select not in newArray %}

			{% if section_select == 'slider' %}
				{#  **** Home slider ****  #}

					{% set has_mobile_slider = settings.toggle_slider_mobile and settings.slider_mobile and settings.slider_mobile is not empty %}

					<section{% if not settings.slider_full %} class="section-home"{% endif %} data-store="home-slider" data-transition="fade-in">
						{% include 'snipplets/home/home-slider.tpl' %}
						{% if has_mobile_slider %}
							{% include 'snipplets/home/home-slider.tpl' with {mobile: true} %}
						{% endif %}
					</section>

			{% elseif section_select == 'main_categories' %}

				{#  **** Main categories ****  #}
				{% include 'snipplets/home/home-categories.tpl' %}

			{% elseif section_select == 'welcome' %}

				{#  **** Welcome message ****  #}
				{% include 'snipplets/home/home-welcome-message.tpl' %}

			{% elseif section_select == 'institutional' %}

				{#  **** Welcome message ****  #}
				{% include 'snipplets/home/home-institutional-message.tpl' %}

			{% elseif section_select == 'products' %}

				{#  **** Featured products ****  #}
				{% include 'snipplets/home/home-featured-products.tpl' with {'has_featured': true} %}

			{% elseif section_select == 'new' %}

				{#  **** New products ****  #}
				{% include 'snipplets/home/home-featured-products.tpl' with {'has_new': true} %}

			{% elseif section_select == 'sale' %}

				{#  **** Sale products ****  #}
				{% include 'snipplets/home/home-featured-products.tpl' with {'has_sale': true} %}

			{% elseif section_select == 'promotion' %}

				{#  **** Promotional products ****  #}
				{% include 'snipplets/home/home-featured-products.tpl' with {'has_promotion': true} %}

			{% elseif section_select == 'best_seller' %}

				{#  **** Best sellers products ****  #}
				{% include 'snipplets/home/home-featured-products.tpl' with {'has_best_seller': true} %}

			{% elseif section_select == 'informatives' %}

				{#  **** Informative banners ****  #}
				{% include 'snipplets/banner-services/banner-services.tpl' %}

			{% elseif section_select == 'categories' %}

				{#  **** Categories banners ****  #}
				{% include 'snipplets/home/home-banners.tpl' with {'has_banner': true} %}

			{% elseif section_select == 'main_product' %}

				{#  **** Main product ****  #}
				{% include 'snipplets/home/home-main-product.tpl' %}

			{% elseif section_select == 'video' %}

				{#  **** Video embed ****  #}
				{% include 'snipplets/home/home-video.tpl' %}

			{% elseif section_select == 'instafeed' %}

				{#  **** Instafeed ****  #}
				{% include 'snipplets/home/home-instafeed.tpl' %}

			{% elseif section_select == 'promotional' %}

				{#  **** Promotional banners ****  #}
				{% include 'snipplets/home/home-banners.tpl' with {'has_banner_promotional': true} %}

			{% elseif section_select == 'news_banners' %}

				{#  **** News banners ****  #}
				{% include 'snipplets/home/home-banners.tpl' with {'has_banner_news': true} %}

			{% elseif section_select == 'brands' %}

				{#  **** Brands slider ****  #}
				{% include 'snipplets/home/home-brands.tpl' %}

			{% elseif section_select == 'testimonials' %}

				{#  **** Testimonials slider ****  #}
				{% include 'snipplets/home/home-testimonials.tpl' %}

			{% endif %}
		{% set newArray = newArray|merge([section_select]) %}

		{% endif %}

	{% endfor %}

	{% if settings.home_promotional_popup and ("home_popup_image.jpg" | has_custom_image or settings.home_popup_title or settings.home_popup_txt or settings.home_news_box or (settings.home_popup_btn and settings.home_popup_url)) %}
		{% include 'snipplets/home/home-popup.tpl' %}
	{% endif %}

{% endif %}
