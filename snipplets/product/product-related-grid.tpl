{# /*============================================================================
  #Product Related Grid
==============================================================================*/

#Properties

#Related Slider

#}

{% if settings.products_related_title %}
    <h2 class="h3">{{ settings.products_related_title }}</h2>
{% endif %}

<div class="js-swiper-related swiper-container" data-related-products-amount="{{ related_products | length }}">
    <div class="swiper-wrapper swiper-products-slider flex-nowrap">
        {% for related in related_products %}
            {% include 'snipplets/grid/item.tpl' with {'product': related, 'slide_item': true, 'related_item' : true} %}
        {% endfor %}
    </div>
</div>
<div class="js-swiper-related-prev swiper-button-prev swiper-button-outside d-none d-md-block svg-icon-text">
    <svg class="icon-inline icon-lg icon-flip-horizontal"><use xlink:href="#chevron"/></svg>
</div>
<div class="js-swiper-related-next swiper-button-next swiper-button-outside d-none d-md-block svg-icon-text">
    <svg class="icon-inline icon-lg"><use xlink:href="#chevron"/></svg>
</div>
