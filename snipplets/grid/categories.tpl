{% if not modal and parent_category and parent_category.id!=0 %}
    <a href="{{ parent_category.url }}" title="{{ parent_category.name }}" class="category-back d-block{% if filter_categories %} mb-4{% endif %}">
        <svg class="icon-inline icon-flip-horizontal mr-2 svg-icon-text"><use xlink:href="#chevron"/></svg>{{ parent_category.name }}
    </a>
{% endif %}
{% if filter_categories %}
    <div class="js-accordion-container {% if modal %}filter-accordion{% endif %}">
        {% if modal %}
            <a href="#" class="js-accordion-toggle row no-gutters align-items-center">
                <div class="col pr-3 my-1">
                    <h6 class="font-body font-weight-bold mb-0">
                        {{ "Categorías" | translate }}
                    </h6>
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
            <h6 class="font-big font-weight-bold mb-4">{{ "Categorías" | translate }}</h6>
        {% endif %}
        <ul class="{% if modal %}js-accordion-content my-3{% else %}mb-4 pb-2{% endif %} list-unstyled" {% if modal %}style="display: none;"{% endif %}> 
            {% for category in filter_categories %}
                <li data-item="{{ loop.index }}" class="mb-2"><a href="{{ category.url }}" title="{{ category.name }}" class="font-small">{{ category.name }}</a></li>

                {% if loop.index == 8 and filter_categories | length > 8 %}
                    <div class="js-accordion-container">
                        <div class="js-accordion-content" style="display: none;">
                {% endif %}
                {% if loop.last and filter_categories | length > 8 %}
                        </div>
                        <a href="#" class="js-accordion-toggle d-inline-block btn-link font-small mt-1">
                            <span class="js-accordion-toggle-inactive">{{ 'Ver más' | translate }}</span>
                            <span class="js-accordion-toggle-active" style="display: none;">{{ 'Ver menos' | translate }}</span>
                        </a>
                    </div>
                {% endif %}
            {% endfor %}
        </ul>
    </div>
{% endif %}