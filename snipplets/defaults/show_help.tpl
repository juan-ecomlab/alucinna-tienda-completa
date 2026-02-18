{# Only remove this if you want to take away the theme onboarding advices #}

{% if not params.preview %}
	{% if is_theme_draft %}
		{% set admin_link = '/admin/themes/settings/draft/' %}
	{% else %}
		{% set admin_link = '/admin/themes/settings/active/' %}
	{% endif %}
{% endif %}

{% include "snipplets/svg/empty-placeholders.tpl" %}

{# Slider that work as example #}

{% set slide_view_box = '0 0 1440 770' %}

<section class="js-home-slider-container" data-store="home-slider">
	<div class="section-slider position-relative">
		{% if not settings.slider_full %}
			<div class="container">
		{% endif %}
		<div class="js-home-empty-slider h-100 swiper-container{% if not settings.slider_full %} mt-4{% endif %}">
			<div class="swiper-wrapper">
				<div class="swiper-slide slide-container">
					<svg viewBox='{{ slide_view_box }}'><use xlink:href="#slider-slide-placeholder"/></svg>
				</div>
				<div class="swiper-slide slide-container">
					<svg viewBox='{{ slide_view_box }}'><use xlink:href="#slider-slide-placeholder"/></svg>
				</div>
				<div class="swiper-slide slide-container">
					<svg viewBox='{{ slide_view_box }}'><use xlink:href="#slider-slide-placeholder"/></svg>
				</div>
			</div>
			<div class="placeholder-overlay placeholder-slider transition-soft">
				<div class="placeholder-info">
					<svg class="icon-inline icon-3x"><use xlink:href="#edit"/></svg>
					<div class="placeholder-description font-small-xs">
						{{ "Podés subir imágenes principales desde" | translate }} <strong>"{{ "Carrusel de imágenes" | translate }}"</strong>
					</div>
					{% if not params.preview %}
						<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
					{% endif %}
				</div>
			</div>
			<div class="js-swiper-empty-home-pagination swiper-pagination swiper-pagination-bullets d-block my-3"></div>
		</div>
		{% if not settings.slider_full %}
			</div>
		{% endif %}
	</div>
</section>

{# Products featured that work as examples #}

<section class="section-featured-home" data-store="home-products-featured">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<h2 class="section-title h3 mb-3 text-center">{{ "Destacados" | translate }}</h2>
				<div class="row row-grid">
					{% include 'snipplets/defaults/help_item.tpl' with {'help_item_1': true, 'section_columns_desktop': 4, 'section_columns_mobile': 2} %}
					{% include 'snipplets/defaults/help_item.tpl' with {'help_item_2': true, 'section_columns_desktop': 4, 'section_columns_mobile': 2} %}
					{% include 'snipplets/defaults/help_item.tpl' with {'help_item_3': true, 'section_columns_desktop': 4, 'section_columns_mobile': 2} %}
					{% include 'snipplets/defaults/help_item.tpl' with {'help_item_4': true, 'section_columns_desktop': 4, 'section_columns_mobile': 2} %}
				</div>
			</div>
		</div>
	</div>
</section>

{# Categories banners that work as examples #}

<section class="section-banners-home" data-store="home-banner-categories">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="row px-2">
					<div class="col-grid col-md-6">
						<div class="textbanner">
							<div class="textbanner-image p-0 overlay">
								<svg viewBox='{{ slide_view_box }}'><use xlink:href="#slider-slide-placeholder"/></svg>
							</div>
							<div class="textbanner-text text-center over-image">
								<div class="h4 h1-md mb-1">{{ "Categoría" | translate }}</div>
							</div>
							<div class="placeholder-overlay transition-soft">
								<div class="placeholder-info">
									<svg class="icon-inline icon-3x"><use xlink:href="#edit"/></svg>
									<div class="placeholder-description font-small-xs">
										{{ "Podés destacar categorías de tu tienda desde" | translate }} <strong>"{{ "Banners de categorías" | translate }}"</strong>
									</div>
									{% if not params.preview %}
										<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
									{% endif %}
								</div>
							</div>
						</div>
					</div>
					<div class="col-grid col-md-6">
						<div class="textbanner">
							<div class="textbanner-image p-0 overlay">
								<svg viewBox='{{ slide_view_box }}'><use xlink:href="#slider-slide-placeholder"/></svg>
							</div>
							<div class="textbanner-text text-center over-image">
								<div class="h4 h1-md mb-1">{{ "Categoría" | translate }}</div>
							</div>
							<div class="placeholder-overlay transition-soft">
								<div class="placeholder-info">
									<svg class="icon-inline icon-3x"><use xlink:href="#edit"/></svg>
									<div class="placeholder-description font-small-xs">
										{{ "Podés destacar categorías de tu tienda desde" | translate }} <strong>"{{ "Banners de categorías" | translate }}"</strong>
									</div>
									{% if not params.preview %}
										<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
									{% endif %}
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

{# Products featured that work as examples #}

<section class="section-featured-home" data-store="home-products-new">
	<div class="container">
		<div class="row">
			<div class="col-12 pr-0 pr-md-3">
				<h2 class="section-title h3 mb-3 text-center">{{ "Novedades" | translate }}</h2>
				<div class="js-swiper-featured-demo swiper-container swiper-products">
					<div class="swiper-wrapper swiper-products-slider flex-nowrap row row-grid">
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_4': true, 'section_columns_desktop': 4, 'section_columns_mobile': 2}  %}
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_5': true, 'section_columns_desktop': 4, 'section_columns_mobile': 2}  %}
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_6': true, 'section_columns_desktop': 4, 'section_columns_mobile': 2}  %}
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_7': true, 'section_columns_desktop': 4, 'section_columns_mobile': 2}  %}
					</div>
				</div>
				<div class="js-swiper-featured-demo-prev swiper-button-prev swiper-button-outside d-none d-md-block svg-icon-text">
					<svg class="icon-inline icon-lg icon-flip-horizontal"><use xlink:href="#chevron"/></svg>
				</div>
				<div class="js-swiper-featured-demo-next swiper-button-next swiper-button-outside d-none d-md-block svg-icon-text">
					<svg class="icon-inline icon-lg"><use xlink:href="#chevron"/></svg>
				</div>
			</div>
		</div>
	</div>
</section>

{# Video that work as examples #}

<section class="section-video-home" data-store="home-video">
	<div class="home-video embed-responsive embed-responsive-16by9">
		<svg viewBox="0 0 1130 635.63"><use xlink:href="#video-placeholder"/></svg>
		<div class="placeholder-overlay transition-soft">
		<div class="placeholder-info">
				<svg class="icon-inline icon-3x"><use xlink:href="#edit"/></svg>
				<div class="placeholder-description font-small-xs">
					{{ "Podés subir tu video de YouTube desde" | translate }} <strong>"{{ "Video" | translate }}"</strong>
				</div>
				{% if not params.preview %}
					<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
				{% endif %}
			</div>
		</div>
	</div>
</section>

{# Products featured that work as examples #}

<section class="section-featured-home" data-store="home-products-sale">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<h2 class="section-title h3 mb-3 text-center">{{ "Ofertas" | translate }}</h2>
				<div class="row row-grid">
					{% include 'snipplets/defaults/help_item.tpl' with {'help_item_1': true, 'section_columns_desktop': 4, 'section_columns_mobile': 2} %}
					{% include 'snipplets/defaults/help_item.tpl' with {'help_item_8': true, 'section_columns_desktop': 4, 'section_columns_mobile': 2} %}
					{% include 'snipplets/defaults/help_item.tpl' with {'help_item_4': true, 'section_columns_desktop': 4, 'section_columns_mobile': 2} %}
					{% include 'snipplets/defaults/help_item.tpl' with {'help_item_6': true, 'section_columns_desktop': 4, 'section_columns_mobile': 2} %}
				</div>
			</div>
		</div>
	</div>
</section>

{# Promotional banners that work as examples #}

<section class="section-banners-home" data-store="home-banner-promotional">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="row px-2">
					<div class="col-grid col-md-6">
						<div class="textbanner">
							<div class="textbanner-image p-0 overlay">
								<svg viewBox='{{ slide_view_box }}'><use xlink:href="#slider-slide-placeholder"/></svg>
							</div>
							<div class="textbanner-text text-center over-image">
								<div class="h4 h1-md mb-1">{{ "Promoción" | translate }}</div>
							</div>
							<div class="placeholder-overlay transition-soft">
								<div class="placeholder-info">
									<svg class="icon-inline icon-3x"><use xlink:href="#edit"/></svg>
									<div class="placeholder-description font-small-xs">
										{{ "Podés mostrar tus promociones desde" | translate }} <strong>"{{ "Banners promocionales" | translate }}"</strong>
									</div>
									{% if not params.preview %}
										<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
									{% endif %}
								</div>
							</div>
						</div>
					</div>
					<div class="col-grid col-md-6">
						<div class="textbanner">
							<div class="textbanner-image p-0 overlay">
								<svg viewBox='{{ slide_view_box }}'><use xlink:href="#slider-slide-placeholder"/></svg>
							</div>
							<div class="textbanner-text text-center over-image">
								<div class="h4 h1-md mb-1">{{ "Promoción" | translate }}</div>
							</div>
							<div class="placeholder-overlay transition-soft">
								<div class="placeholder-info">
									<svg class="icon-inline icon-3x"><use xlink:href="#edit"/></svg>
									<div class="placeholder-description font-small-xs">
										{{ "Podés mostrar tus promociones desde" | translate }} <strong>"{{ "Banners promocionales" | translate }}"</strong>
									</div>
									{% if not params.preview %}
										<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
									{% endif %}
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

{# Instagram feed that work as examples #}

<section class="section-instafeed-home position-relative overflow-none py-2 py-md-5" data-store="home-instagram-feed">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-md-3 p-0 pl-md-3">
				<div class="instafeed-link instafeed-title mb-0">
					<div class="img-absolute-centered-vertically h-auto px-4 text-center">
						<h2 class="h4 mb-0">@{{ 'Instagram' | translate }}</h2>
					</div>
				</div>
			</div>
			<div class="col-md-9">
				<div id="instafeed" class="row row-grid">
					{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_1': true} %}
					{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_2': true} %}
					{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_1': true} %}
				</div>
			</div>
		</div>
	</div>
	<div class="placeholder-overlay transition-soft">
		<div class="placeholder-info">
			<svg class="icon-inline icon-3x"><use xlink:href="#edit"/></svg>
			<div class="placeholder-description font-small-xs">
				{{ "Podés mostrar tus últimas novedades desde" | translate }} <strong>"{{ "Publicaciones de Instagram" | translate }}"</strong>
			</div>
			{% if not params.preview %}
				<a href="{{ admin_link }}#instatheme=redes-sociales" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
			{% endif %}
		</div>
	</div>
</section>
