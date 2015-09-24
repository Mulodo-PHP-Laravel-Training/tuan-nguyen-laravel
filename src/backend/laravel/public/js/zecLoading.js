/* zecLoading
/* Written by : ronantuantvt@gmail.com
/* 04-2014
*/

jQuery.fn.zecLoading = function(config) {
    defaults = {
        load : false,
        hide : false,
        imgId : 'loadingImg',
        imgWidth : 80,
        imgHeight : 40,
        zone : null,
        zoIndex :5000,
        zIndex : 5001,
    }
    config = jQuery.extend({}, defaults, config);
    if (config.load) {
        var display = this.parent().css("display");
        // Loading
        var height = this.height();
        var width = this.width();
        if (display == 'none') {
            //console.log('none');
        } else {
            if (height == 0) {
                var fromTop = ($(window).height() - this.offset().top)/2;
                var fromLeft = this.offset().left + width/2 - config.imgWidth/2;
            } else {
                if (config.zone != '') {
                    if($(config.zone,this).length == 1) {
                        // has scroll
                        var width  = $(config.zone,this).width();
                        var height = $(config.zone,this).height();
                        var top = $(config.zone,this).offset().top;
                        var left = $(config.zone,this).offset().left;
                        var fromTop = top + height/2 - config.imgHeight/2;
                        var fromLeft = left + width/2 - config.imgWidth/2;

                    } else {
                        // no scroll
                        var width  = $('tbody',this).width();
                        var height = $('tbody',this).height();
                        var top = $('tbody',this).offset().top;
                        var left = $('tbody',this).offset().left;
                        var fromTop = top + height/2 - config.imgHeight/2;
                        var fromLeft = left + width/2 - config.imgWidth/2;

                    }
                        // Add overlay
                        $div = $('<div class="overlayDiv loading-indicator-overlay"></div>');
                        $div.css({"z-index" : config.zoIndex, "position" : "absolute", "width" : width, "height" : height,
                                  "top" : top, "left" : left});
                        jQuery(document.body).append($div);

                } else {
                    console.log('here');
                }
            }
            // add Loading zone
            $div = $('<div class="imgLoading"></div>');
            $div.attr("id",config.imgId);
            $div.css({"z-index" : config.zIndex, "position": "absolute" , width : config.imgWidth , height : config.imgHeight,
                    top : fromTop, left: fromLeft});
            //$div.html('Loading...');
            jQuery(document.body).append($div);

        }

    }
    if (config.hide) {
        $('#'+config.imgId).remove();
        $('.overlayDiv').remove();
    }
}