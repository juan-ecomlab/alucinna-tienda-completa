<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://opengraphprotocol.org/schema/" lang="{% for language in languages %}{% if language.active %}{{ language.lang }}{% endif %}{% endfor %}">
    <head>
        <link rel="preconnect" href="{{ store_resource_hints }}" />
        <link rel="dns-prefetch" href="{{ store_resource_hints }}" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>{{ page_title }}</title>
        <meta name="description" content="{{ page_description }}" />
        <link rel="preload" href="{{ 'css/style-critical.scss' | static_url }}" as="style" />
        <link rel="preload" href="{{ 'js/external-no-dependencies.js.tpl' | static_url }}" as="script" />

        <!-- Start VWO Async SmartCode -->
        <link rel="preconnect" href="https://dev.visualwebsiteoptimizer.com" />
        <script type='text/javascript' id='vwoCode'>
        window._vwo_code ||
        (function () {
        var w=window,
        d=document;
        var account_id=1189453,
        version=2.2,
        settings_tolerance=2000,
        hide_element='body',
        hide_element_style = 'opacity:0 !important;filter:alpha(opacity=0) !important;background:none !important',
        f=0;
        /* DO NOT EDIT BELOW THIS LINE */
        if(f=!1,v=d.querySelector('#vwoCode'),cc={},-1<d.URL.indexOf('__vwo_disable__')||w._vwo_code)return;try{var e=JSON.parse(localStorage.getItem('_vwo_'+account_id+'_config'));cc=e&&'object'==typeof e?e:{}}catch(e){}function r(t){try{return decodeURIComponent(t)}catch(e){return t}}var s=function(){var e={combination:[],combinationChoose:[],split:[],exclude:[],uuid:null,consent:null,optOut:null},t=d.cookie||'';if(!t)return e;for(var n,i,o=/(?:^|;\s*)(?:(_vis_opt_exp_(\d+)_combi=([^;]*))|(_vis_opt_exp_(\d+)_combi_choose=([^;]*))|(_vis_opt_exp_(\d+)_split=([^:;]*))|(_vis_opt_exp_(\d+)_exclude=[^;]*)|(_vis_opt_out=([^;]*))|(_vwo_global_opt_out=[^;]*)|(_vwo_uuid=([^;]*))|(_vwo_consent=([^;]*)))/g;null!==(n=o.exec(t));)try{n[1]?e.combination.push({id:n[2],value:r(n[3])}):n[4]?e.combinationChoose.push({id:n[5],value:r(n[6])}):n[7]?e.split.push({id:n[8],value:r(n[9])}):n[10]?e.exclude.push({id:n[11]}):n[12]?e.optOut=r(n[13]):n[14]?e.optOut=!0:n[15]?e.uuid=r(n[16]):n[17]&&(i=r(n[18]),e.consent=i&&3<=i.length?i.substring(0,3):null)}catch(e){}return e}();function i(){var e=function(){if(w.VWO&&Array.isArray(w.VWO))for(var e=0;e<w.VWO.length;e++){var t=w.VWO[e];if(Array.isArray(t)&&('setVisitorId'===t[0]||'setSessionId'===t[0]))return!0}return!1}(),t='a='+account_id+'&u='+encodeURIComponent(w._vis_opt_url||d.URL)+'&vn='+version+'&ph=1'+('undefined'!=typeof platform?'&p='+platform:'')+'&st='+w.performance.now();e||((n=function(){var e,t=[],n={},i=w.VWO&&w.VWO.appliedCampaigns||{};for(e in i){var o=i[e]&&i[e].v;o&&(t.push(e+'-'+o+'-1'),n[e]=!0)}if(s&&s.combination)for(var r=0;r<s.combination.length;r++){var a=s.combination[r];n[a.id]||t.push(a.id+'-'+a.value)}return t.join('|')}())&&(t+='&c='+n),(n=function(){var e=[],t={};if(s&&s.combinationChoose)for(var n=0;n<s.combinationChoose.length;n++){var i=s.combinationChoose[n];e.push(i.id+'-'+i.value),t[i.id]=!0}if(s&&s.split)for(var o=0;o<s.split.length;o++)t[(i=s.split[o]).id]||e.push(i.id+'-'+i.value);return e.join('|')}())&&(t+='&cc='+n),(n=function(){var e={},t=[];if(w.VWO&&Array.isArray(w.VWO))for(var n=0;n<w.VWO.length;n++){var i=w.VWO[n];if(Array.isArray(i)&&'setVariation'===i[0]&&i[1]&&Array.isArray(i[1]))for(var o=0;o<i[1].length;o++){var r,a=i[1][o];a&&'object'==typeof a&&(r=a.e,a=a.v,r&&a&&(e[r]=a))}}for(r in e)t.push(r+'-'+e[r]);return t.join('|')}())&&(t+='&sv='+n)),s&&s.optOut&&(t+='&o='+s.optOut);var n=function(){var e=[],t={};if(s&&s.exclude)for(var n=0;n<s.exclude.length;n++){var i=s.exclude[n];t[i.id]||(e.push(i.id),t[i.id]=!0)}return e.join('|')}();return n&&(t+='&e='+n),s&&s.uuid&&(t+='&id='+s.uuid),s&&s.consent&&(t+='&consent='+s.consent),w.name&&-1<w.name.indexOf('_vis_preview')&&(t+='&pM=true'),w.VWO&&w.VWO.ed&&(t+='&ed='+w.VWO.ed),t}code={nonce:v&&v.nonce,library_tolerance:function(){return'undefined'!=typeof library_tolerance?library_tolerance:void 0},settings_tolerance:function(){return cc.sT||settings_tolerance},hide_element_style:function(){return'{'+(cc.hES||hide_element_style)+'}'},hide_element:function(){return performance.getEntriesByName('first-contentful-paint')[0]?'':'string'==typeof cc.hE?cc.hE:hide_element},getVersion:function(){return version},finish:function(e){var t;f||(f=!0,(t=d.getElementById('_vis_opt_path_hides'))&&t.parentNode.removeChild(t),e&&((new Image).src='https://dev.visualwebsiteoptimizer.com/ee.gif?a='+account_id+e))},finished:function(){return f},addScript:function(e){var t=d.createElement('script');t.type='text/javascript',e.src?t.src=e.src:t.text=e.text,v&&t.setAttribute('nonce',v.nonce),d.getElementsByTagName('head')[0].appendChild(t)},load:function(e,t){t=t||{};var n=new XMLHttpRequest;n.open('GET',e,!0),n.withCredentials=!t.dSC,n.responseType=t.responseType||'text',n.onload=function(){if(t.onloadCb)return t.onloadCb(n,e);200===n.status?_vwo_code.addScript({text:n.responseText}):_vwo_code.finish('&e=loading_failure:'+e)},n.onerror=function(){if(t.onerrorCb)return t.onerrorCb(e);_vwo_code.finish('&e=loading_failure:'+e)},n.send()},init:function(){var e,t=this.settings_tolerance();w._vwo_settings_timer=setTimeout(function(){_vwo_code.finish()},t),'body'!==this.hide_element()?(n=d.createElement('style'),e=(t=this.hide_element())?t+this.hide_element_style():'',t=d.getElementsByTagName('head')[0],n.setAttribute('id','_vis_opt_path_hides'),v&&n.setAttribute('nonce',v.nonce),n.setAttribute('type','text/css'),n.styleSheet?n.styleSheet.cssText=e:n.appendChild(d.createTextNode(e)),t.appendChild(n)):(n=d.getElementsByTagName('head')[0],(e=d.createElement('div')).style.cssText='z-index: 2147483647 !important;position: fixed !important;left: 0 !important;top: 0 !important;width: 100% !important;height: 100% !important;background: white !important;',e.setAttribute('id','_vis_opt_path_hides'),e.classList.add('_vis_hide_layer'),n.parentNode.insertBefore(e,n.nextSibling));var n='https://dev.visualwebsiteoptimizer.com/j.php?'+i();-1!==w.location.search.indexOf('_vwo_xhr')?this.addScript({src:n}):this.load(n+'&x=true',{l:1})}};w._vwo_code=code;code.init();})();
        </script>
        <!-- End VWO Async SmartCode -->

        {# Preload of first image of Slider to improve LCP #}
        {% if template == 'home'%}
            {% snipplet 'preload-images.tpl' %}
        {% endif %}

        {{ component('social-meta') }}
        {{ component('canary') }}

        {#/*============================================================================
            #CSS and fonts
        ==============================================================================*/#}

        <style>
            {# Font families #}

            {% if params.preview %}

                {# If page is loaded from customization page on the admin, load all fonts #}

                @import url('https://fonts.googleapis.com/css?family=Montserrat:400,600|Muli:400,600|Lato:400,600|Nunito:400,600|Plus+Jakarta+Sans:400,600|Outfit:400,600|Sora:400,600|Lexend:400,600|Lexend+Exa:400,600|Red+Hat+Display:400,600|Manrope:400,600|Work+Sans:400,600|Inter:400,600|Public+Sans:400,600|Kanit:400,600|Braah+One:400,600|Karla:400,600|Roboto+Mono:400,600|Playfair+Display:400,600|Ultra|Marcellus|Fraunces:400,600|Literata:400,600|Zilla+Slab:400,600|Oooh+Baby|Handlee|Domine:400,600|Corben:400,600|Tenor+Sans|Poppins:400,600|Libre+Franklin:400,600');

            {% else %}

                {# If page is NOT loaded from customization only load saved fonts #}

                {# Get only the saved fonts on settings #}

                @import url('{{ [settings.font_headings, settings.font_rest] | google_fonts_url('400, 600') | raw  }}');

            {% endif %}

            {# General CSS Tokens #}

            {% include "static/css/style-tokens.tpl" %}
        </style>

        {# Critical CSS #}

        {{ 'css/style-critical.scss' | static_url | static_inline }}

        {# Load async styling not mandatory for first meaningfull paint #}

        <link rel="stylesheet" href="{{ 'css/style-async.scss' | static_url }}" media="print" onload="this.media='all'">

        {# Loads custom CSS added from Advanced Settings on the admin´s theme customization screen #}

        <style>
            {{ settings.css_code | raw }}
        </style>

        {#/*============================================================================
            #Javascript: Needed before HTML loads
        ==============================================================================*/#}

        {# Defines if async JS will be used by using script_tag(true) #}

        {% set async_js = true %}

        {# Defines the usage of jquery loaded below, if nojquery = true is deleted it will fallback to jquery 1.5 #}

        {% set nojquery = true %}

        {# Jquery async by adding script_tag(true) #}

        {% if load_jquery %}

            {{ '//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js' | script_tag(true) }}

        {% endif %}

        {# Loads private Tiendanube JS #}

        {% head_content %}

        {# Structured data to provide information for Google about the page content #}

        {{ component('structured-data') }}

    </head>
    <body class="js-head-offset head-offset">

        {# Theme icons #}

        {% include "snipplets/svg/icons.tpl" %}
        
        {# Facebook comments on product page #}

        {% if template == 'product' %}

            {# Facebook comment box JS #}
            {% if settings.show_product_fb_comment_box %}
                {{ fb_js }}
            {% endif %}

            {# Pinterest share button JS #}
            {{ pin_js }}

        {% endif %}

        {# Back to admin bar #}

        {{back_to_admin}}

        {# Header = Advertising + Nav + Logo + Search + Ajax Cart #}

        {% snipplet "header/header.tpl" %}

        {# Page content #}

        {% template_content %}

        {# Quickshop modal #}

        {% snipplet "grid/quick-shop.tpl" %}

        {# WhatsApp chat button #}

        {% snipplet "whatsapp-chat.tpl" %}

        {# Footer #}

        {% snipplet "footer/footer.tpl" %}

        {% if cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price %}

            {# Minimum used for free shipping progress messages. Located on header so it can be accesed everywhere with shipping calculator active or inactive #}

            <span class="js-ship-free-min hidden" data-pricemin="{{ cart.free_shipping.min_price_free_shipping.min_price_raw }}"></span>
            <span class="js-cart-subtotal hidden" data-priceraw="{{ cart.subtotal }}"></span>
            <span class="js-cart-discount hidden" data-priceraw="{{ cart.promotional_discount_amount }}"></span>
        {% endif %}

        {#/*============================================================================
            #Javascript: Needed after HTML loads
        ==============================================================================*/#}

        {# Javascript used in the store #}

        {# Critical libraries #}

        {{ 'js/external-no-dependencies.js.tpl' | static_url | script_tag }}

        <script type="text/javascript">

            {# LS.ready.then function waits to Jquery and private Tiendanube JS to be loaded before executing what´s inside #}

            LS.ready.then(function(){

                {# Non critical libraries #}

                {% include "static/js/external.js.tpl" %}

                {# Specific store JS functions: product variants, cart, shipping, etc #}

                {% include "static/js/store.js.tpl" %}
            });
        </script>

        {# Google survey JS for Tiendanube Survey #}

        {% include "static/js/google-survey.js.tpl" %}

        {# Store external codes added from admin #}

        {% if store.assorted_js %}
            <script>
                LS.ready.then(function() {
                    var trackingCode = jQueryNuvem.parseHTML('{{ store.assorted_js| escape("js") }}', document, true);
                    jQueryNuvem('body').append(trackingCode);
                });
            </script>
        {% endif %}
    </body>
</html>
