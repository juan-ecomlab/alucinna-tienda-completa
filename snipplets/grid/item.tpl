{# /*============================================================================
  #Item grid
==============================================================================*/

#Properties

#Slide Item

#}

{% set slide_item = slide_item | default(false) %}

{% if template == 'home'%}
    {% set columns_desktop = section_columns_desktop %}
    {% set columns_mobile = section_columns_mobile %}
    {% set section_slider = section_slider %}
{% else %}
    {% set columns_desktop = settings.grid_columns_desktop %}
    {% set columns_mobile = settings.grid_columns_mobile %}
    {% if template == 'product'%}
        {% set section_slider = true %}
    {% endif %}
{% endif %}

{% set filtro_talle = params.Talle %}
{% set array_filtro_talle = filtro_talle|split('|') %}
{% set has_stock = false %}

{% for variant in product.variants_object %}
    {% set selected_color = (variant.option0 == variant_color_name or variant.option1 == variant_color_name or variant.option2 == variant_color_name) %}
    {% set selected_talle = false %}

    {% if filtro_talle %}
        {% for talle in array_filtro_talle %}
            {% if variant.option0 == talle or variant.option1 == talle or variant.option2 == talle %}
                {% set selected_talle = true %}
            {% endif %}
        {% endfor %}
    {% else %}
        {% set selected_talle = true %}  {# Si no hay filtro de talle, permitir cualquiera #}
    {% endif %}

    {% if selected_color and selected_talle and (variant.stock > 0 or variant.available) %}
        {% set has_stock = true %}
    {% endif %}
{% endfor %}

{# Si no hay stock en ningún talle, oculta el producto #}
<div id="product_color_{{variant_color_name}}" class="js-item-product{% if slide_item %} js-item-slide swiper-slide{% endif %} col-{% if columns_mobile == 1 %}12{% else %}6{% endif %} col-md-{% if columns_desktop == 4 %}3{% elseif columns_desktop == 5 %}2-4{% else %}2{% endif %} item-product col-grid" data-product-type="list" data-product-id="{{ product.id }}" data-store="product-item-{{ product.id }}" data-component="product-list-item"
data-component-value="{{ product.id }}" {% if not has_stock %} style="display: none;" {% endif %}>
    <div class="item">
        {% if settings.quick_shop or settings.product_color_variants %}
            <div class="js-product-container js-quickshop-container{% if product.variations %} js-quickshop-has-variants{% endif %} position-relative" data-variants="{{ product.variants_object | json_encode }}" data-quickshop-id="quick{{ product.id }}">
        {% endif %}
        
        {% set product_url_with_selected_variant = has_filters ?  ( product.url | add_param('variant', product.selected_or_first_available_variant.id)) : product.url  %}
        {% set show_secondary_image = settings.product_hover and product.other_images %}
        {% if has_color_variant %}

            {# Item image will be the first avaiable variant #}
            
            {% set item_img_width = product.featured_image.dimensions['width'] %}
            {% set item_img_height = product.featured_image.dimensions['height'] %}
            {% set item_img_srcset = product.featured_image %}
            {% set item_img_alt = product.featured_image.alt %}
            {% set item_img_spacing = item_img_height / item_img_width * 100 %}

            {% set variant_image_id = "" %}
            {% set item_img_variant = false %} 

            {% set found = false %}
            {% for variante in product.variants_object %}
                {% if not found %}
                    {% if filtro_talle %}
                        {% for talle in array_filtro_talle %}
                            {% if variante.option0 == variant_color_name and variante.option1 == talle or variante.option0 == talle and variante.option1 == variant_color_name %}
                                {% set item_img_variant = variante.image_url %}
                                {% set variant_image_id = variante.image %}
                                {% set product_url_with_selected_variant = ( product.url | add_param('variant', variante.id)) %}
                                {% set found = true %}
                            {% endif %}
                        {% endfor %}
                    {% else %}
                        {% if variante.option0 == variant_color_name or variante.option1 == variant_color_name %}
                            {% set item_img_variant = variante.image_url %}
                            {% set variant_image_id = variante.image %}
                            {% set product_url_with_selected_variant = ( product.url | add_param('variant', variante.id)) %}
                            {% set found = true %}
                        {% endif %}
                    {% endif %}
                {% endif %}
            {% endfor %}
        {% else %}
            {# Item image will be the first image regardless the variant #}

            {% set item_img_width = product.featured_image.dimensions['width'] %}
            {% set item_img_height = product.featured_image.dimensions['height'] %}
            {% set item_img_srcset = product.featured_image %}
            {% set item_img_alt = product.featured_image.alt %}
            {% set item_img_spacing = item_img_height / item_img_width * 100 %}
        {% endif %}

        {# Set how much viewport space the images will take to load correct image #}

        {% if columns_mobile == 2 %}
            {% set mobile_image_viewport_space = '50' %}
        {% else %}
            {% set mobile_image_viewport_space = '100' %}
        {% endif %}

        {% if columns_desktop == 4 %}
            {% set desktop_image_viewport_space = '25' %}
        {% elseif columns_desktop == 3 %}
            {% set desktop_image_viewport_space = '33' %}
        {% else %}
            {% set desktop_image_viewport_space = '50' %}
        {% endif %}

        <div class="{% if show_secondary_image %}js-item-with-secondary-image{% endif %} item-image{% if columns == 1 %} item-image-big{% endif %}">
            <div style="padding-bottom: {{ item_img_spacing }}%;" class="js-item-image-padding position-relative" data-store="product-item-image-{{ product.id }}">
                <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" aria-label="{{ product.name }}" >
                    {% if item_img_variant %}
                        <img loading="lazy" alt="{{ item_img_alt }}" src="{{ item_img_variant }}" data-srcset="{{ item_img_variant }}" class="lazyautosizes lazyload img-absolute img-absolute-centered fade-in{% if settings.product_hover and product.other_images %} item-image-primary{% endif %}" data-sizes="auto" data-expand="-10" />
                    {% else %}
                    <img alt="{{ item_img_alt }}" data-expand="-10" src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset="{{ item_img_srcset | product_image_url('small')}} 240w, {{ item_img_srcset | product_image_url('medium')}} 320w, {{ item_img_srcset | product_image_url('large')}} 480w, {{ item_img_srcset | product_image_url('huge')}} 640w, {{ item_img_srcset | product_image_url('original')}} 1024w" class="js-item-image lazyautosizes lazyload img-absolute img-absolute-centered fade-in {% if show_secondary_image %}item-image-primary{% endif %}" width="{{ item_img_width }}" height="{{ item_img_height }}" sizes="(max-width: 768px) {{ mobile_image_viewport_space }}vw, (min-width: 769px) {{ desktop_image_viewport_space }}vw"/>
                    {% endif %}
                    
                    <div class="placeholder-fade"></div>

                    {% if show_secondary_image %}
                        {# Second image with color #}
                        {% if item_img_variant %}
                            {% set next_image = false %}
                            {% for image in product.images %}
                                {% if next_image %}
                                    {% set next_image = false %}
                                    <img alt="{{ item_img_alt }}" data-sizes="auto" src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset="{{ image | product_image_url('small')}} 240w, {{ image | product_image_url('medium')}} 320w, {{ image | product_image_url('large')}} 480w, {{ image | product_image_url('huge')}} 640w, {{ image | product_image_url('original')}} 1024w" class="secondary-custom js-item-image js-item-image-secondary lazyautosizes lazyload img-absolute img-absolute-centered fade-in item-image-secondary" sizes="(min-width: 768px) {{ desktop_image_viewport_space }}vw, {{ mobile_image_viewport_space }}vw" style="display:none;" />
                                {% else %}
                                    {% if variant_image_id == image.id %}
                                        {% set next_image = true %}
                                    {% endif %}
                                {% endif %}
                            {% endfor %}
                        {% else %}
                            <img alt="{{ item_img_alt }}" data-sizes="auto" src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset="{{ product.other_images | first | product_image_url('small')}} 240w, {{ product.other_images | first | product_image_url('medium')}} 320w, {{ product.other_images | first | product_image_url('large')}} 480w, {{ product.other_images | first | product_image_url('huge')}} 640w, {{ product.other_images | first | product_image_url('original')}} 1024w" class="js-item-image js-item-image-secondary lazyautosizes lazyload img-absolute img-absolute-centered fade-in item-image-secondary" sizes="(min-width: 768px) {{ desktop_image_viewport_space }}vw, {{ mobile_image_viewport_space }}vw" style="display:none;" />
                        {% endif %}
                    {% endif %}
                </a>
            </div>

            {% if settings.product_color_variants %}
                {% include 'snipplets/labels.tpl' with {labels_floating: true, no_stock: no_stock} %}
            {% else %}
                {% include 'snipplets/labels.tpl' with {labels_floating: true} %}
            {% endif %}
        </div>
        {% if (settings.quick_shop or settings.product_color_variants) and product.available and product.display_price and product.variations %}

            {# Hidden product form to update item image and variants: Also this is used for quickshop popup #}

            <div class="js-item-variants hidden">
                <form class="js-product-form" method="post" action="{{ store.cart_url }}">
                    <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                    {% if product.variations %}
                        {% include "snipplets/product/product-variants.tpl" with {quickshop: true} %}
                    {% endif %}
                    {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                    {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}

                    {# Add to cart CTA #}

                    {% set show_product_quantity = product.available and product.display_price %}

                    <div class="row no-gutters mt-3">

                        {% if show_product_quantity %}
                            {% include "snipplets/product/product-quantity.tpl" with {quickshop: true} %}
                        {% endif %}

                        <div class="{% if show_product_quantity %}col-8 col-md-9{% else %}col-12{% endif %}">

                            <input type="submit" class="js-addtocart js-prod-submit-form btn-add-to-cart btn btn-primary btn-big w-100 {{ state }}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} />

                            {# Fake add to cart CTA visible during add to cart event #}

                            {% include 'snipplets/placeholders/button-placeholder.tpl' with {custom_class: "btn-big"} %}
                        </div>
                    </div>
                </form>
            </div>
        {% endif %}

        {% set show_labels = not product.has_stock or product.compare_at_price or product.promotional_offer %}
        
        <div class="item-description pt-3" data-store="product-item-info-{{ product.id }}">
            <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" aria-label="{{ product.name }}" class="item-link">
                {% if settings.product_color_variants %}
                    {% include 'snipplets/grid/item-colors.tpl' with { variant_color_custom_name: variant_color_name } %}
                {% endif %}
                <div class="js-item-name item-name mb-2 font-small opacity-80" data-store="product-item-name-{{ product.id }}">{{ product.name }}{% if has_color_variant %} {{variant_color_name}}{% endif %}</div>
                {% if product.display_price %}
                    <div class="item-price-container {% if settings.quick_shop %}mb-3{% endif %}" data-store="product-item-price-{{ product.id }}">
                        <div class="d-block mb-1 mr-1">
                            <span class="js-price-display item-price font-weight-bold {% if settings.payment_discount_price %}font-body{% endif %}">
                                {{ product.price | money }}
                            </span>
                            {% include 'snipplets/labels.tpl' %}
                        </div>
                        <span class="js-compare-price-display price-compare" {% if not product.compare_at_price or not product.display_price %}style="display:none;"{% else %}style="display:inline-block;"{% endif %}>
                            {{ product.compare_at_price | money }}
                        </span>

                            {% set product_can_show_installments = product.show_installments and product.display_price and product.get_max_installments.installment > 1 and settings.product_installments %}

                        {% set discount_price_spacing_classes = product_can_show_installments ? 'mb-2' %}

                        {{ component('payment-discount-price', {
                                visibility_condition: settings.payment_discount_price,
                                location: 'product',
                                container_classes: discount_price_spacing_classes ~ " mt-2 font-weight-bold font-smallest",
                                text_classes: {
                                    price: 'font-small',
                                },
                            }) 
                        }}
                        {% if product_can_show_installments %}
                            {{ component('installments', {'location' : 'product_item' , 'short_wording' : true, container_classes: { installment: "item-installments mt-2"}}) }}
                        {% endif %}
                    </div>
                {% endif %}
                {% if product.available and product.display_price and settings.quick_shop %}
                    {% if settings.quick_shop %}
                        <div class="item-actions d-inline-block">
                            {% if product.variations %}

                                {# Open quickshop popup if has variants #}

                                <span data-toggle="#quickshop-modal" href="#" class="js-quickshop-modal-open {% if slide_item %}js-quickshop-slide{% endif %} js-modal-open btn btn-primary btn-small btn-smallest-md px-4" title="{{ 'Compra rápida de' | translate }} {{ product.name }}" aria-label="{{ 'Compra rápida de' | translate }} {{ product.name }}" data-component="product-list-item.add-to-cart" data-component-value="{{product.id}}">
                                    <span class="js-open-quickshop-wording">{{ 'Comprar' | translate }}</span>
                                </span>
                            {% else %}
                                {# If not variants add directly to cart #}
                                <form class="js-product-form" method="post" action="{{ store.cart_url }}">
                                    <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                                    {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                                    {% set texts = {'cart': "Comprar", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}

                                    <div class="js-item-submit-container item-submit-container position-relative float-left d-inline-block w-100">
                                        <input type="submit" class="js-addtocart js-prod-submit-form js-quickshop-icon-add btn btn-primary btn-small btn-smallest-md px-4 {{ state }}" value="{{ texts[state] | translate }}" alt="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} data-component="product-list-item.add-to-cart" data-component-value="{{ product.id }}"/>
                                    </div>

                                    {# Fake add to cart CTA visible during add to cart event #}

                                    {% include 'snipplets/placeholders/button-placeholder.tpl' with {direct_add: true} %}
                                </form>
                            {% endif %}
                        </div>
                    {% endif %}
                {% endif %}
            </a>
        </div>
        {% if settings.quick_shop or settings.product_color_variants %}
            </div>{# This closes the quickshop tag #}
        {% endif %}

        {# Structured data to provide information for Google about the product content #}
        {{ component('structured-data', {'item': true}) }}
    </div>
</div>
