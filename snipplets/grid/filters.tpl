{% if applied_filters %}

    {# Applied filters chips #}

    {% if has_applied_filters %}
        <div class="font-body font-weight-bold mb-2">{{ 'Filtro aplicado' | translate }}</div>
        {% for product_filter in product_filters %}
            {% for value in product_filter.values %}

                {# List applied filters as tags #}
                
                {% if value.selected %}
                    <button class="js-remove-filter js-remove-filter-chip chip" data-filter-name="{{ product_filter.key }}" data-filter-value="{{ value.name }}" data-component="filter.pill-{{ product_filter.type }}" data-component-value="{{ product_filter.key }}">
                        {{ value.pill_label }}
                        <svg class="chip-remove-icon"><use xlink:href="#times"/></svg>
                    </button>
                {% endif %}
            {% endfor %}
        {% endfor %}
        <a href="#" class="js-remove-all-filters btn-link d-inline-block mt-1 mt-md-0 font-small" data-component="filter-delete">{{ 'Borrar filtros' | translate }}</a> 
    {% endif %}
{% else %}
    {% if product_filters is not empty %}
        
        {# Filters list #}

        <div id="filters" class="visible-when-content-ready" data-store="filters-nav">
            {% for product_filter in product_filters %}
                {% if product_filter.type == 'price' %}
                    {% set price_btn_classes = 'd-inline-block' %}
                    {% set price_title_classes = 'font-body' %}
                    {% set price_container_classes = 'filter-accordion' %}
                    {% if not modal %}
                        {% set price_btn_classes = 'btn-small' %}
                        {% set price_container_classes = '' %}
                        {% set price_title_classes = 'font-big' %}
                    {% endif %}
                    {{ component(
                        'price-filter',
                        {'group_class': 'price-filter-container mb-4 pb-2 ' ~ price_container_classes, 'title_class': 'font-weight-bold mb-4 ' ~ price_title_classes, 'button_class': 'btn btn-default ' ~ price_btn_classes }
                    ) }}

                {% else %}
                    {% if product_filter.has_products %}
                    
                        <div class="js-filter-container {% if modal %}js-accordion-container filter-accordion{% endif %}" data-store="filters-group" data-component="list.filter-{{ product_filter.type }}" data-component-value="{{ product_filter.key }}">
                            {% if modal %}
                                <a href="#" class="js-accordion-toggle row no-gutters align-items-center" data-accordion-target="{{ product_filter.key }}">
                                    <div class="col my-1 pr-3 d-flex align-items-center">
                                        <h6 class="font-body font-weight-bold mb-0">
                                            {{product_filter.name}}
                                        </h6>
                                        {% if has_applied_filters %}
                                            <span class="js-filters-badge-container ml-1" style="display: none;">(<span class="js-filters-badge"></span>)</span>
                                        {% endif %}
                                    </div>
                                    <div class="col-auto my-1">
                                        <span class="js-accordion-toggle-inactive">
                                            <svg class="icon-inline svg-icon-text font-big mr-1"><use xlink:href="#plus"/></svg>
                                        </span>
                                        <span class="js-accordion-toggle-active" style="display: none;">
                                            <svg class="icon-inline svg-icon-text font-big mr-1"><use xlink:href="#minus"/></svg>
                                        </span>
                                    </div>
                                </a>
                            {% else %}
                                <h6 class="font-big font-weight-bold mb-4">
                                    {{product_filter.name}}
                                </h6>
                            {% endif %}
                            <div class="{% if modal %}js-accordion-content my-3{% else %}mb-4 pb-2{% endif %}" {% if modal %}style="display: none;"{% endif %}> 
                                {% set index = 0 %}
                                {% for value in product_filter.values %}
                                    {% if value.product_count > 0 %}
                                        {% set index = index + 1 %}

                                        <label class="js-filter-checkbox {% if not value.selected %}js-apply-filter{% else %}js-remove-filter{% endif %} checkbox-container" data-filter-name="{{ product_filter.key }}" data-filter-value="{{ value.name }}" data-component="filter.option" data-component-value="{{ value.name }}">
                                            <input type="checkbox" autocomplete='off' {% if value.selected %}checked{% endif %}/>
                                            <span class="checkbox {% if loop.last and product_filter.values_with_products < 8 %}mb-0{% endif %}">
                                                <span class="checkbox-icon"></span>
                                                <span class="checkbox-text">
                                                    {{ value.name }} ({{ value.product_count }})
                                                </span>
                                                {% if product_filter.type == 'color' and value.color_type == 'insta_color' %}
                                                    <span class="checkbox-color" style="background-color: {{ value.color_hexa }};"></span>
                                                {% endif %}
                                            </span>
                                        </label>
                                        {% if index == 8 and product_filter.values_with_products > 8 %}
                                            <div class="js-accordion-container">
                                                <div class="js-accordion-content" style="display: none;">
                                        {% endif %}
                                        
                                    {% endif %}
                                    {% if loop.last and product_filter.values_with_products > 8 %}
                                                </div>
                                                <a href="#" class="js-accordion-toggle d-inline-block btn-link font-small mt-1">
                                                    <span class="js-accordion-toggle-inactive">{{ 'Ver todos' | translate }}</span>
                                                    <span class="js-accordion-toggle-active" style="display: none;">{{ 'Ver menos' | translate }}</span>
                                                </a>
                                            </div>
                                    {% endif %}
                                {% endfor %}
                            </div>
                        </div>
                    {% endif %}
                {% endif %}
            {% endfor %}
        </div>
    {% endif %}
{% endif %}