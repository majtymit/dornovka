/*  TABLE OF CONTENT
    1. Common function
    2. Initialing
*/
/*================================================================*/
/*  1. Common function
/*================================================================*/

var sfApp={
    formatWidth: function(){
        var contentWidth = $('.body-content').width();
        var isGallery=false;
        var columns = 3;
        var columnPadding=20;
        if($('body').is('.gallery')){
            isGallery=true;
            columnPadding=0;
            if (contentWidth<=480){
                columns=1;
            }
            else if (contentWidth<=640){
                columns=2;
            }
            else if (contentWidth<=800){
                columns=3;
            }
            else if(contentWidth<=1140){
                columns=4;
            }
            else if(contentWidth<=1380){
                columns=5;
            }
            else if(contentWidth<=1620){
                columns=6;
            }
            else if(contentWidth>1620){
                columns=7;
            }
        }
        else{
            if (contentWidth<640){
                columns=1;
            }
            else if (contentWidth<=966){
                columns=2;
            }
            else if(contentWidth<=1140){
                columns=3;
            }
            else if(contentWidth<=1620){
                columns=4;
            }
            else if(contentWidth>1620){
                columns=5;
            }
        }
        var itemWidth = Math.floor((contentWidth-(columnPadding*(columns+1)))/columns);
        $('.item-list').each(function(){
            if(isGallery){
                var ratio='';
                if($(this).data('ratio'))
                    ratio=$(this).data('ratio');
                if(ratio!='' && columns>2){
                    var ratioData=ratio.split('x');
                    if(ratioData.length==2){
                        var newWidth=Math.floor(itemWidth*parseInt(ratioData[0]));
                        var newHeight=Math.floor(itemWidth*parseInt(ratioData[1]));
                        $(this).css({"width":newWidth+"px"});
                        $(this).css({"height":newHeight+"px"});
                    }
                    else{
                        $(this).css({"width":itemWidth+"px"});
                        $(this).css({"height":itemWidth+"px"});
                    }
                }
                else{
                    $(this).css({"width":itemWidth+"px"});
                    $(this).css({"height":itemWidth+"px"});
                }
            }
            else{
                $(this).css({"width":itemWidth+"px"});
            }
        });
    },
    reformatPost:function(){
        if($('body').is('.gallery') && $('.post').length){
            $('.post .wrap:not(.formated)').each(function() {
                var $postMedia=$(this).find('.post-media');
                if($(this).find('.hidden').has('img').length){
                    var $postImg=$(this).find('.hidden').find('img');
                    $postMedia.css('background-image', 'url("'+$postImg.attr('src')+'")');
                }
                else if($(this).find(".hidden").has('iframe[src^="//www.youtube.com"]').length){
                    var $youtube=$(this).find(".hidden").find('iframe[src^="//www.youtube.com"]');
                    var regExp=/youtube(-nocookie)?\.com\/(embed|v)\/([\w_-]+)/;
                    var youtubeId ='';
                    var regResult= $youtube.attr('src').match(regExp);
                    if(regResult!=null)
                        youtubeId=regResult[3];
                    if(youtubeId!=''){
                        var youtubeThumnailUrl='http://i3.ytimg.com/vi/'+youtubeId+'/0.jpg';
                        $postMedia.css('background-image','url("'+youtubeThumnailUrl+'")');
                    }
                }
                else{
                    var $innerContent=$('.post-desc',$(this));
                    var innerContentMargin=Math.floor($innerContent.height()/2);
                    $innerContent.css('margin-top', '-'+innerContentMargin+'px');
                }
                $(this).addClass('formated');
            });
        }
    },
    centerPostDesc:function(){
        if($('body').is('.gallery')){
            $('.post .wrap').each(function() {
                var $innerContent=$('.post-desc',$(this));
                var innerContentMargin=Math.floor($innerContent.height()/2);
                $innerContent.css('margin-top', '-'+innerContentMargin+'px');
            });
        }
    },
    formatPortfolioWidth:function(){
        if($('#portfolio-content').length){
            var cols=2;
            if($('#portfolio-content').data('cols')){
                cols=parseInt($('#portfolio-content').data('cols'));
                if($(window).width()<=767)
                    cols=1;
                var contentWidth=$('#portfolio-content').width();
                var itemWidth = Math.floor((contentWidth-(20*(cols+1)))/cols);
                $('#portfolio-content > .portfolio-item').each(function(index, el) {
                    $(this).css({"width":itemWidth+"px"});
                });
            }
        }
    },
    getMaxPagination:function(){
        if($('.page-number').length){
            var numberPattern = /\d+/g;
            var pageNumberStr=$('.page-number').html();
            var result=pageNumberStr.match(numberPattern);
            if(result!=null && result.length>1){
                return result[1];
            }
            else{
                return 1;
            }
        }
    },
    initFilter:function(){
        // This is demo how to use filter function, you can change it as you want.
        if($('body').is('.enable-filter') && $('.filter-control').length){
            var noSelectedText="Všetky";
            if($(window).width()<=480){
                noSelectedText="Všetky";
            }
            $('#filter').multiselect({
                numberDisplayed: 1,
                buttonText: function(options, select) {
                    if (options.length == 0) {
                      return noSelectedText + ' <b class="caret"></b>';
                    }
                    if (options.length == 1) {
                            return options.length + ' kategória <b class="caret"></b>';
                    }
                    if (options.length > 1 && options.length < 5) {
                            return options.length + ' kategórie <b class="caret"></b>';
                    }
                    else {
                        return options.length + ' kategórii <b class="caret"></b>';
                    }
                },
                onChange: function(option, checked) {
                    var selected = $('#filter option:selected')
                                       .map(function() { return $(this).val(); })
                                       .toArray()
                                       .join(',');
                    if ($('#isotope-content').length){
                        $('#isotope-content').isotope({filter:selected});
                    }
                    else if ($('#portfolio-content').length){
                        $('#portfolio-content').isotope({filter:selected});
                    }
                }
            });
            $('#sort').multiselect({
                onChange: function(option, checked) {
                    var sortAsc=false;
                    if($('.sort-option').data('sort')=='asc')
                        sortAsc=true;
                    var sortByStr=option.val();
                    if($('#isotope-content').length){
                        $('#isotope-content').isotope({
                            sortBy : sortByStr,
                            sortAscending : sortAsc
                        });
                    }
                    else if($('#portfolio-content').length){
                        $('#portfolio-content').isotope({
                            sortBy : sortByStr,
                            sortAscending : sortAsc
                        });
                    }
                }
            });
            $('.sort-option').click(function(event) {
                var sortAsc=false;
                var sortAscStr='';
                if($(this).data('sort')=='asc'){
                    sortAsc=false;
                    sortAscStr='desc';
                    $(this).data('sort','desc');
                    $(this).html('<i class="fa fa-long-arrow-down"></i>');
                }
                else{
                    sortAsc=true;
                    sortAscStr='asc';
                    $(this).data('sort','asc');
                    $(this).html('<i class="fa fa-long-arrow-up"></i>');
                }
                var sortByStr=$('#sort').val();
                if($('#isotope-content').length){
                    $('#isotope-content').isotope({
                        sortBy : sortByStr,
                        sortAscending : sortAsc
                    });
                }
                else if($('#portfolio-content').length){
                    $('#portfolio-content').isotope({
                        sortBy : sortByStr,
                        sortAscending : sortAsc
                    });
                }
            });
        }
    },
    isotopeSetup:function(){
        if($('#isotope-content').length){
            var $container = $('#isotope-content');
            $('.post').imagesLoaded(function( instance ) {
                sfApp.formatWidth();
                if($('body').is('.gallery')) {
                    var columns=3;
                    var contentWidth = $container.width();
                    if (contentWidth<=480){
                        columns=1;
                    }
                    else if (contentWidth<=640){
                        columns=2;
                    }
                    else if (contentWidth<=800){
                        columns=3;
                    }
                    else if(contentWidth<=1140){
                        columns=4;
                    }
                    else if(contentWidth<=1380){
                        columns=5;
                    }
                    else if(contentWidth<=1620){
                        columns=6;
                    }
                    else if(contentWidth>1620){
                        columns=7;
                    }
                    $container.isotope({
                        itemSelector : '.item-list',
                        layoutMode: 'perfectMasonry',
                        resizable: false,
                        animationOptions: {
                            duration: 400,
                            easing: 'swing',
                            queue: false
                        },
                        perfectMasonry: {
                            layout: 'vertical',
                            liquid: true,
                            columnWidth: 200,   // Force columns to 200px wide
                            rowHeight: 200,      // Force rows to 200px high
                            cols: columns
                        }
                    });
                }
                else{
                    if ($("isotope-content .item-list").length == 0) {
                        $container.isotope({
                            itemSelector: '',
                            filter:'*',
                            resizable: false,
                            animationOptions: {
                                duration: 400,
                                easing: 'swing',
                                queue: false
                            },
                            getSortData: {
                                date: function ($elem) {
                                    return Date.parse($elem.data('publish-date'));
                                },
                                title:function($elem){
                                    return $elem.find('.post-title a').text().replace(' ','');
                                }
                            }
                        });
                    }
                    else{
                        $container.isotope({
                            itemSelector: '.item-list',
                            filter: '*',
                            resizable: false,
                            animationOptions: {
                                duration: 400,
                                easing: 'swing',
                                queue: false
                            },
                            getSortData: {
                                date: function ($elem) {
                                    return Date.parse($elem.data('publish-date'));
                                },
                                title:function($elem){
                                    return $elem.find('.post-title a').text().replace(' ','');
                                }
                            }
                        });
                    }
                }

                $('#preloader').remove();

                if($('body').is('.enable-filter')){
                    $('.filter-control').fadeIn('fast', function() {
                        var marginTop=$('.filter-control').height()+40;
                        $('#isotope-content').css('margin-top', marginTop+'px');
                        $('.filter-control').animate({'top': '0px'},
                            400,
                            function() {
                                $('#isotope-content').fadeIn('slow').css({
                                    'visibility':'visible',
                                });
                            sfApp.reloadIsotope();
                        });
                    });
                }
                else{
                    var marginTop=$('.post-header').height();
                    $('#isotope-content').css('margin-top', marginTop + 15 + 'px');
                    $('#isotope-content').fadeIn('slow').css({
                        'visibility':'visible',
                    });
                    sfApp.reloadIsotope();
                }
            });
        }
    },
    infiniteScrollSetup:function(){
        if($('#isotope-content').length) {
            var $container = $('#isotope-content');
            $container.infinitescroll({
                    navSelector     : '.pagination',    // selector for the paged navigation
                    nextSelector    : '.pagination a',  // selector for the NEXT link (to page 2)
                    itemSelector    : '.post',     // selector for all items you'll retrieve
                    maxPage           : sfApp.getMaxPagination(),
                    loading: {
                        //finishedMsg: 'No more post to load.',
                        //img: '/assets/loading.gif'
                    }
                },
                // call Isotope as a callback
                function(newElements) {
                    $container.isotope('insert', $(newElements),function(){
                        $(".post .wrap").fitVids();
                        sfApp.reloadIsotope();
                    });
                }
            );
        }
        else if($('#portfolio-content').length){
            var $container = $('#portfolio-content');
            $container.infinitescroll({
                    navSelector     : '.pagination',    // selector for the paged navigation
                    nextSelector    : '.pagination a',  // selector for the NEXT link (to page 2)
                    itemSelector    : '.post',     // selector for all items you'll retrieve
                    maxPage           : sfApp.getMaxPagination(),
                    loading: {
                        finishedMsg: 'No more post to load.',
                            img: '/assets/loading.gif'
                    }
                },
                // call Isotope as a callback
                function( newElements ) {
                    $container.isotope('insert', $(newElements),function(){
                        $(".post .wrap").fitVids();
                        sfApp.reloadPortfolio();
                    });
                }
            );
        }
    },
    portfolioSetup:function(){
        // Portfolio setup
        if($('#portfolio-content').length){
            var $container = $('#portfolio-content');
            $('#portfolio-content').imagesLoaded(function( instance ) {
                sfApp.formatPortfolioWidth();
                if($('body').is('.enable-filter')){
                    $container.isotope({
                        itemSelector : '.portfolio-item',
                        resizable: false,
                        animationOptions: {
                            duration: 400,
                            easing: 'swing',
                            queue: false
                        },
                        masonry: {},
                        getSortData: {
                            date: function ($elem) {
                                return Date.parse($elem.data('publish-date'));
                            },
                            title:function($elem){
                                return $elem.find('.caption a').text().replace(' ','');
                            }
                        }
                    });
                }
                else{
                    $container.isotope({
                        itemSelector : '.portfolio-item',
                        resizable: false,
                        animationOptions: {
                            duration: 400,
                            easing: 'swing',
                            queue: false
                        },
                        masonry: {}
                    });
                }
                var afterLoad = function () {
                    $(this).remove();
                    if($('body').is('.enable-filter')){
                        $('.filter-control').fadeIn('fast', function() {
                            var marginTop=$('.filter-control').height()+40;
                            $('#portfolio-content').css('margin-top', marginTop+'px');
                            $('.filter-control').animate({'top': '0px'},400,
                                function() {
                                    $('#portfolio-content').fadeIn('slow').css({
                                        'visibility':'visible',
                                    });
                                    if($('.portfolio-pagination').length){
                                        $('.portfolio-pagination').css('display', 'inline-block');
                                    }
                                    sfApp.reloadIsotope();
                                });
                        });
                    }
                    else {
                        $('#portfolio-content').fadeIn('slow').css({
                            'visibility':'visible',
                        });
                        if($('.portfolio-pagination').length){
                            $('.portfolio-pagination').css('display', 'inline-block');
                        }
                        sfApp.reloadPortfolio();
                    }
                };

                if ($('#preloader').is(":visible")) {
                    $('#preloader').fadeOut('slow', afterLoad)
                } else {
                    afterLoad();
                }
            });
        }
    },
    reloadIsotope:function(){
        if($('#isotope-content').length){
            sfApp.formatWidth();
            if($('body').is('.gallery')){
                var columns=3;
                var contentWidth = $('.body-content').width();
                if (contentWidth<=480){
                    columns=1;
                }
                else if (contentWidth<=640){
                    columns=2;
                }
                else if (contentWidth<=800){
                    columns=3;
                }
                else if(contentWidth<=1140){
                    columns=4;
                }
                else if(contentWidth<=1380){
                    columns=5;
                }
                else if(contentWidth<=1620){
                    columns=6;
                }
                else if(contentWidth>1620){
                    columns=7;
                }
                sfApp.centerPostDesc();
                $('#isotope-content').isotope({
                        perfectMasonry: {
                            cols: columns
                        }
                });
            }
            else{
                $('#isotope-content').isotope();
            }
        }
    },
    reloadPortfolio:function(){
        if($('#portfolio-content').length){
            sfApp.formatPortfolioWidth();
            $('#portfolio-content').isotope();
        }
    },
    sliderSetup:function(){
        if($('.slider').length){
            $('.slider').each(function(index, el) {
                var cfItems=1;
                if($(this).data('items')){
                    cfItems=parseInt($(this).data('items'));
                }
                var cfNavigation=false;
                if($(this).data('navigation')){
                    cfNavigation=$(this).data('navigation');
                }
                var cfSlideSpeed=300;
                if($(this).data('slideSpeed')){
                    cfSlideSpeed=parseInt($(this).data('slideSpeed'));
                }
                var cfPaginationSpeed=400;
                if($(this).data('paginationSpeed')){
                    cfPaginationSpeed=parseInt($(this).data('paginationSpeed'));
                }
                var cfSingleItem=false;
                if($(this).data('singleItem')){
                    cfSingleItem=$(this).data('singleItem');
                }
                if(cfItems==1){
                    cfSingleItem=true;
                }
                var cfPagination=false;
                if($(this).data('pagination')){
                    cfPagination=$(this).data('pagination');
                }
                var cfTransitionStyle='fade';
                if($(this).data('transitionStyle')){
                    cfTransitionStyle=$(this).data('transitionStyle');
                }
                var cfAutoPlay=false;
                if($(this).data('autoPlay')){
                    cfAutoPlay=$(this).data('autoPlay');
                }
                var cfStopOnHover=false;
                if($(this).data('stopOnHover')){
                    cfStopOnHover=$(this).data('stopOnHover');
                }
                var cfResponsive=true;
                if($(this).data('responsive')){
                    cfResponsive=$(this).data('responsive');
                }
                var cfResponsiveRefreshRate=200;
                if($(this).data('responsiveRefreshRate')){
                    cfResponsiveRefreshRate=parseInt($(this).data('responsiveRefreshRate'));
                }
                $(this).owlCarousel({
                    items                   : cfItems,
                    responsive              : cfResponsive,
                    responsiveRefreshRate   : cfResponsiveRefreshRate,
                    navigation              : cfNavigation, // Show next and prev buttons
                    slideSpeed              : cfSlideSpeed,
                    paginationSpeed         : cfPaginationSpeed,
                    navigationText          : ['<i class="fa fa-chevron-left"></i>','<i class="fa fa-chevron-right"></i>'],
                    singleItem              : cfSingleItem,
                    pagination              : cfPagination,
                    transitionStyle         : cfTransitionStyle,
                    autoPlay                : cfAutoPlay,
                    stopOnHover             : cfStopOnHover,
                });
            });
            // External control
            $(document).on('click', '.carousel-external-control .next', function(event) {
                event.preventDefault();
                if($(this).parent().data('target')){
                    $("#"+$(this).parent().data('target')).trigger('owl.next');
                }
            });
            $(document).on('click', '.carousel-external-control .prev', function(event) {
                event.preventDefault();
                if($(this).parent().data('target')){
                    $("#"+$(this).parent().data('target')).trigger('owl.prev');
                }
            });
        }
    },
    fitVids:function(){
        $(".post .wrap").fitVids();
        $(".post").fitVids();
    },
    contentPopup:function(){
        if($('.content-popup').length){
            $('.content-popup').magnificPopup({
                type: 'inline',
                fixedContentPos: false,
                fixedBgPos: true,
                overflowY: 'auto',
                closeBtnInside: true,
                preloader: false,
                midClick: true,
                removalDelay: 300,
                mainClass: 'my-mfp-zoom-in'
            });
        }
    },
    newsletterSetup:function(){
        if($('#newsletter-form').length){
            // Contact validation and process
            $("#newsletter-form input").not("[type=submit]").jqBootstrapValidation({
                submitSuccess: function ($form, event) {
                    event.preventDefault();
                    var content = $form.serialize();
                    // Post to contact handler
                    $.post("server/newsletter_handler.php", { email: content }, function(data) {
                        alert(data);
                    });
                    return false;
                }
            });
        }
    },
    twitterSetup:function(){

    },
    contactFormHandle:function(){
        if($('#contact-form').length){
            // Contact validation and process
            $("#contact-form input,#contact-form select,#contact-form textarea").not("[type=submit]").jqBootstrapValidation({
                submitSuccess: function ($form, event) {
                    event.preventDefault();
                    var content = $form.serialize();
                    // Post to contact handler
                    $.post("server/contact_handler.php", { content: content }, function(data) {
                        alert(data);
                    });
                    return false;
                }
            });
        }
    },
    mainMenuEvents:function(){
        if($('.main-nav').length){
            $('.main-nav>li.has-sub>a').click(function(e) {
                e.preventDefault();
                var targetDropdown = $(this).next('.dropdown-menu');
                var targetParent = $(targetDropdown).closest('.has-sub');
                $.when($('.main-nav .dropdown-menu').slideUp(200)).done(function() {
                    $('.main-nav .has-sub').not(targetParent).removeClass('active');
                });
                if($(targetDropdown).is(':hidden')) {
                    $.when($(targetDropdown).slideToggle(200)).done(function() {
                        $(targetDropdown).closest('.has-sub').addClass('active');
                    });
                } else {
                    $.when($(targetDropdown).slideUp(200)).done(function() {
                        $(targetDropdown).closest('.has-sub').removeClass('active');
                    });
                }
            });
        }
    },
    postAnimation:function(){
        if($('body').is('.post-template')){
            var headerTop=0;
            var postMargin=0;
            if($(window).width()<=979){
                headerTop=1;
                postMargin=$('.post-header').height();
            }
            $('.body-content').imagesLoaded(function( instance ) {
                $('#preloader').remove();
                $('.post-header').animate({
                    top: headerTop+'px'
                }, 50 , function() {
                    $('.post-wrap').fadeIn(1000);
                    $('.body-content').css('margin-top', postMargin+'px');
                });
            });
        }
    },
    scrollEvent:function(){
        $(window).scroll(function() {
            "use strict";
            if($('body').is('.post-template')){
                var curPos = $(window).scrollTop();
                if (curPos >= $('.post-header').height()) {
                    $('.post-header').addClass('fixed-top');
                } else {
                    $('.post-header').removeClass('fixed-top');
                }
            }
            if($(window).scrollTop() + $(window).height() > $(document).height() - 221) {
               if(!$('.bottom-row').is('.runned')){
                   $('.bottom-row').find('.animation').addClass('animated');
                   $('.bottom-row').addClass('runned');
               }
            }
        });
    },
    gmapInitialize:function(){
        var mainColor=sfApp.hexColor($('.post-header').css('backgroundColor'));
        var myLatlng = new google.maps.LatLng(your_latitude,your_longitude);
        var mapOptions = {
            zoom: 13,
            scrollwheel: false,
            center: myLatlng,
            styles: [{"stylers":[{"hue": mainColor, "lightness" : 100}]}]
        }
        var map = new google.maps.Map(document.getElementById('gmap'), mapOptions);
        var marker = new google.maps.Marker({
            position: myLatlng,
            map: map,
            title: 'Form'
        });
    },
    hexColor:function(colorval) {
        var parts = colorval.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
        delete(parts[0]);
        for (var i = 1; i <= 3; ++i) {
            parts[i] = parseInt(parts[i]).toString(16);
            if (parts[i].length == 1) parts[i] = '0' + parts[i];
        }
        return '#' + parts.join('');
    },
    uiInit:function(){
        $('html, document, body').scrollTop(0);
        $('#isotope-content').hide();
        $('body').append('<div id="preloader"></div>');
        if($('body').is('.simple-style')){
            var introHeight=$('#main-sidebar .intro').height();
            $('#main-sidebar .intro').css({
                'margin-top': '-'+Math.floor(introHeight/2)+'px'
            }).fadeIn('slow', function() {});
        }
        // Center Intro
        if($('#main-sidebar .intro-wrap').length && $(window).width()<=979){
            var introHeight=$('#main-sidebar .intro-wrap').height();
            $('#main-sidebar .intro-wrap').css({
                'margin-top': '-'+Math.floor(introHeight/2)+'px'
            }).fadeIn('slow', function() {});
        }
    },
    reFormatUI:function(){
        if($('body').is('.simple-style')){
            var introHeight=$('#main-sidebar .intro').height();
            $('#main-sidebar .intro').css({
                'margin-top': '-'+Math.floor(introHeight/2)+'px'
            }).fadeIn('slow', function() {});
        }
        // Center Intro
        if($('#main-sidebar .intro-wrap').length && $(window).width()<=979){
            var introHeight=$('#main-sidebar .intro-wrap').height();
            $('#main-sidebar .intro-wrap').css({
                'margin-top': '-'+Math.floor(introHeight/2)+'px'
            }).fadeIn('slow', function() {});
        }
    },
    misc:function(){
        // Magnific Popup
        $('.magnific-popup-image').magnificPopup({
            type: 'image',
            closeOnContentClick: true,
            closeBtnInside: false,
            fixedContentPos: true,
            mainClass: 'mfp-no-margins mfp-with-zoom', // class to remove default margin from left and right side
            image: {
                verticalFit: true
            },
        });
        $('#mobile-menu').click(function(event) {
            if($('.post-header').length){
                if(!$('body').is('.open-menu')){
                    $('body').addClass('open-menu');
                    if($('body').is('.simple-style'))
                       $('.post-header').css('top', '54px');
                }
                else{
                    $('body').removeClass('open-menu');
                    $('.post-header').css('top', '1px');
                }
            }
        });
        $('#more-info').click(function(event) {
            if($('body').is('.open-more-info')){
                $(this).find('i.fa').removeClass('fa-minus');
                $(this).find('i.fa').addClass('fa-plus');
                $('body').removeClass('open-more-info');
                $('.nicescroll-rails').hide();
            }
            else{
                $(this).find('i.fa').removeClass('fa-plus');
                $(this).find('i.fa').addClass('fa-minus');
                $('body').addClass('open-more-info');
                if($('.nicescroll-rails').length)
                    $('.nicescroll-rails').show();
            }
        });
        // BackToTop Button click event
        $('.totop').click(function () {
            $("html, body").animate({scrollTop: 0}, 800);
            return false;
        });
        $('#turncomment').click(function(event) {
            if($('body').is('.opencomment')){
                $('body').removeClass('opencomment');
                $('.nicescroll-rails').hide();
            }
            else{
                $('body').addClass('opencomment');
                if($('.nicescroll-rails').length)
                    $('.nicescroll-rails').show();
            }
            if($(window).width()<=979){
                $('html, body').stop().animate({scrollTop: $('.comment-box').offset().top-$('.post-header').height()}, 1000,'easeInOutExpo');
            }
        });
        if($(window).width()>979){
            $('.comment-box').niceScroll();
        }
        $('#main-content').click(function(event) {
            if($('body').is('.open-more-info')){
                $('#more-info').trigger('click');
            }
        });
        $('#more-info-sidebar').niceScroll();
        if($('.gmap').length){
            sfApp.gmapInitialize();
            google.maps.event.addDomListener(window, 'load', sfApp.gmapInitialize);
            google.maps.event.addDomListener(window, 'resize', sfApp.gmapInitialize);
        }
        if($('.share-box').length){
            $('#btn-share').click(function(event) {
                event.preventDefault();
                if($('.share-box-content').is(':hidden')){
                    //$('body').addClass('open-share');
                    $('.share-box-content').fadeIn('fast');
                }
                else{
                    $('.share-box-content').fadeOut('fast');
                    //$('body').removeClass('open-share');
                }
            });
        }
        if($('.search-box').length){
            $('#btn-search').click(function(event) {
                event.preventDefault();
                if($('.search-form').is(':hidden')){
                    $('body').addClass('open-search');
                    $('.search-form').fadeIn('fast');
                }
                else{
                    $('.search-form').fadeOut('fast');
                    $('#search-keyword').val('');
                    $('#search-result').html('');
                    $('body').removeClass('open-search');
                }
            });
        }
    },
    init: function () {
        sfApp.uiInit();
        sfApp.mainMenuEvents();
        sfApp.reformatPost();
        sfApp.fitVids();
        sfApp.sliderSetup();
        sfApp.initFilter();
        sfApp.isotopeSetup();
        //sfApp.infiniteScrollSetup();
        sfApp.portfolioSetup();
        sfApp.contentPopup();
        sfApp.newsletterSetup();
        sfApp.postAnimation();
        sfApp.twitterSetup();
        sfApp.contactFormHandle();
        sfApp.misc();
        sfApp.scrollEvent();
    }
};

/*================================================================*/
/*  2. Initialing
/*================================================================*/
$(document).on('ready page:load', function() {
    "use strict";
    sfApp.init();
    sfApp.reloadPortfolio();
    sfApp.reFormatUI();

    var tabs = document.getElementById('tabs');
    if (tabs) {
        window.CBPFWTabsInstance = new CBPFWTabs(tabs);
    }

    $('[data-tab-idx]').click(function() {
        if (window.CBPFWTabsInstance) {
            CBPFWTabsInstance._show($(this).data('tab-idx'));
        }
    });

    initPhotostack();

    isotopeContent.imagesLoaded(function() {
        sfApp.reFormatUI();
    })

    setTimeout(sfApp.reloadIsotope, 1500);
});

/*
$(document).on('page:load', function() {
    DISQUSWIDGETS.getCount({reset: true});
});
*/

/*
$('input[name="testsearch"]').keyup(function() {
  setTimeout(function() {
    //console.log("test");
  }, 1000 );
});
*/

function photostackShowNextPhoto() {
  var nextPhotoIdx = window.ps.getCurrent() + 1;

  if (nextPhotoIdx >= window.ps.getTotalCount()) {
    nextPhotoIdx = 0;
  }

  window.ps.showPhoto(nextPhotoIdx);
};

function stopPhotostackAutorun() {
  if (window.psInterval) {
    clearInterval(window.psInterval);
    window.psInterval = null;
  }
}

function startPhotostackAutorun() {
  if (window.psInterval) {
    clearInterval(window.psInterval);
    window.psInterval = null;
  }

  window.psInterval = setInterval(photostackShowNextPhoto, 3000);
}

function initPhotostack() {
    var photostackElement = document.getElementById('photostack-3');

    if (!photostackElement) return;

    window.ps = new Photostack(photostackElement);

    $(".figure-container").hover(stopPhotostackAutorun, startPhotostackAutorun);

    startPhotostackAutorun();
};

function disablesubmit() {
    $('button[type="submit"]').attr("disabled", true)
    return true;
}

$(window).on("debouncedresize", function( event ) {
    "use strict";
    sfApp.reloadIsotope();
    sfApp.reloadPortfolio();
});

$(window).resize(function () {
    "use strict";
    sfApp.reloadIsotope();
    sfApp.reloadPortfolio();
    sfApp.reFormatUI();
});
