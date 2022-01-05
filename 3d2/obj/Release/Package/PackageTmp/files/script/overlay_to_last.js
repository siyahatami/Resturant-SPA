

$(document).ready(function () {
    $('.overlay').data("is_overlay_shown", false);

    $('.basket_camplate .button').click(function () {
        $('.basket_camplate_result2').html("لطفاً منتظر بمانید");
        if ($('.basket_camplate .txt_mobile').val() == "" || $('.basket_camplate .txt_address').val() == "") $('.basket_camplate .txt_mobile').focus();
        else $('.basket_camplate_result2').show_overlay($('.basket_camplate'));

    });

    $('.basket_camplate .txt_mobile').blur(function () {
        $('.basket_camplate .list_address').load("pages/user_address.aspx?phone_number=" + $(this).val(), function () {
            $(this).find('div').click(function () {
                $('.basket_camplate .txt_address').val($(this).text());
            });
        });
    });



    $('#btn_new_rest').click(function () {
        $('.create_new_rest').html("لطفاً منتظر بمانید");
        $('.create_new_rest').show_overlay("create_new_rest");

    });



});


(function ($) {
    $.fn.show_overlay = function (what) {
        var panel=$(this);
        var overlay=$('.overlay');

        if (overlay.data("is_overlay_shown")==false)
        {
            
            overlay.css({"display":"block",
                    "height": $(window).height(),
                    "width": $(window).width()
                    });
            overlay.animate({
                "opacity":"1"
                },2000);
        
            overlay.data("is_overlay_shown",true)
            $(window).resize(function () {
                overlay.css({
                    "height": $(window).height(),
                    "width": $(window).width()
                    });
                
                panel.css({"margin-top": parseInt($(window).height())/2-250+"px"});
            });
            overlay.dblclick(function(){
                overlay.hide_overlay();
            });
            $(window).keydown(function (e) {
                if (overlay.data("is_overlay_shown")==true && e.which==27)
                    overlay.hide_overlay();
            });
        }

        overlay.find(".big_panel").css({'display':'none',
                                        "margin-top":"0px",
                                        "opacity":"0"});
        
        panel.css('display','block');
        panel.css({
                "margin-top": parseInt($(window).height())/2-($(this).height()/2)+"px",
                "opacity":"1"
                });
            
       if(what=="create_new_rest")  $(this).create_new_rest();
       if (what.hasClass('restaurant')) $(what).rest_of_basket_complating();
       if(what.hasClass('basket_camplate')) $(this).rest_of_basket_complating_result(what);
                // payin cod nazar
    }//show overlay  -------------------------------------------

    
    $.fn.hide_overlay = function () {
        var overlay=$(this);
        overlay.animate({
            "opacity": "0"
        }, 1200);
        
        overlay.find('.big_panel').css({"margin-top":"0px","opacity":"0"});
        overlay.data("is_overlay_shown",false);
        setTimeout(function () { overlay.css("display", "none"); }, 1200);
    }
    /*    ------------------------------------------------------------------------------------------*/

    $.fn.rest_of_basket_complating= function () {
        var rest=$(this);
        
        $('.basket_camplate .restaurant .rest_id').html( rest.find('#rest_id').html() );
        $('.basket_camplate .restaurant .rest_name').html( rest.find('.rest_name').html() );
        $('.basket_camplate .restaurant .rest_address').html( rest.find('#rest_address').html() );

        var total_price=0;
        $('.basket_camplate .food_list').html("");
        $(this).find('.basket_food').each(function(){
            var selected_food=$(this);
            var new_food = $('.basket_camplate .food_item.hidden').clone();
            new_food.removeClass('hidden');

            new_food.find('.food_name').html(selected_food.find('.basket_food_name').html());
            var food_price=parseInt( selected_food.find('.basket_food_price').html());
            new_food.find('.food_price').html(food_price);
            var food_count=parseInt( selected_food.find('.basket_food_count').attr('value'));
            new_food.find('.food_count').html(food_count);
            new_food.find('.rest_food_id').html(selected_food.find('.basket_rest_food_id').html());
            new_food.find('.food_total_price').html(food_count*food_price);
            
            total_price+=food_count*food_price;
            $('.basket_camplate .food_list').append(new_food);
        });
        $('.basket_camplate .food_list .food_item:last-of-type hr').remove();

        $('.basket_camplate .total_price').html( total_price );

        
    } //rest_of_basket_complating
        /*   for complate page 2    ------------------------------------------------------------------------------------------*/
     
     $.fn.rest_of_basket_complating_result= function (pnl_complate) {
     
        pnl_result=$(this);
        
        var rest_id = pnl_complate.find(".rest_id").html();
        var user_mobile = pnl_complate.find(".txt_mobile").val();
        var user_address = pnl_complate.find(".txt_address").val();
        var food_list = '';
   
        pnl_complate.find('.food_list .food_item').each(function () {
            food_list += $(this).find('.rest_food_id').text() + ",";
            food_list += $(this).find('.food_count').text() + ",";
        });
        

        pnl_result.load("pages/record_new_order.aspx?rest_id="+rest_id+"&user_phone="+user_mobile+"&user_address="+user_address+"&food_list="+food_list, function () {
            pnl_result.find('#rest_name').html(pnl_complate.find(".rest_name").html());
            pnl_result.find('#rest_address').html(pnl_complate.find(".rest_address").html());
        });
        
           
     }

             /*   create new rest    ------------------------------------------------------------------------------------------*/
     
     $.fn.create_new_rest= function () {
     
        pnl_new_rest=$(this);
        
        pnl_new_rest.load("pages/create_new_rest.aspx", function () {
             var div_new_rest=$(this).find('#div_new_rest');
             
             
        div_new_rest.find("#city").focus(function () {

            var selection_list=div_new_rest.find('.selected_list');
            selection_list.css({ 'height': '100px', 'opacity': '1',"width":"175px" });
            

            $(this).keyup(function(){
                var s_addres="pages/search_word.aspx?q=" + $(this).val() + "&txt_num=1";
                selection_list.load(s_addres, function () {
                    $(this).find('ul').css("padding-right","10px");
                    $(this).find('li').each(function () {
                    $(this).css({"list-style":"none", "cursor": "pointer","margin":"0px"});
                        $(this).click(function () {
                            div_new_rest.find("#city").data("city_id",$(this).find('div').html())
                            div_new_rest.find("#city").val($(this).text());
                            //$(this).remove();
                        }); //li click
                    }); // each li

                }); // load done
            
            });
            

            $(this).keyup();
        }); // focus










             $(this).find('#btn_create_rest').click(function(){
             
                var address= "pages/create_new_rest.aspx?postback=1&rest_name="+div_new_rest.find('#rest_name').val()+"&user="+div_new_rest.find('#user_name').val()+"&pass="+div_new_rest.find('#pass1').val()+"&city_id="+div_new_rest.find('#city').data('city_id')+"&area_id="+div_new_rest.find('#area_id').val()+"&area_name="+div_new_rest.find('#area_name').val()+"&address="+div_new_rest.find('#address').val()+"&email="+div_new_rest.find('#email').val()+"&phone="+div_new_rest.find('#phone').val()+"&desc="+div_new_rest.find('#desc').val()+"&captcha="+div_new_rest.find('#txt_captcha').val();
                
                if (div_new_rest.find('#pass1').val()!=div_new_rest.find('#pass2').val())
                {
                    alert("عدم تطابق پسوردها");                
                    return;
                }
                
                pnl_new_rest.load(address, function () {
                    
                });

             
             });

        });   
     }

})(jQuery);


