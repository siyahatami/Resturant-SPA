
$(document).ready(function () {

    $(".main_panel_wrapper").data("is_closed", true);
    $(".top_menu li").each(function () {
        $(this).click(function () {

            var c = $(this).attr('class');


            // if closed
            if ($(".main_panel_wrapper").data("is_closed") == true) { //make big
                $(".main_panel_wrapper .panel").css({ 'opacity': '0', 'height': '0px' });
                $(".main_panel_wrapper ." + c).css({ 'height': '260px', 'opacity': '1' });
                $(".main_panel_wrapper").css({ 'height': '260px', 'opacity': '1' });
                $(".main_panel_wrapper").data("is_closed", false);
                $(".main_panel_wrapper").data("what_class", c);
            }
            else if ($(".main_panel_wrapper").data('what_class') == c) {//make mini
                $(".main_panel_wrapper").css({ 'height': '0px', 'opacity': '0' });
                $(".main_panel_wrapper").data("is_closed", true);
            }
            else {  // change panel
                $(".main_panel_wrapper ." + $(".main_panel_wrapper").data("what_class")).css({ 'opacity': '0', 'height': '0px' });
                $(".main_panel_wrapper ." + c).css({ 'opacity': '1', 'height': '260px' });
                $(".main_panel_wrapper").data("what_class", c);
                console.log($(".main_panel_wrapper ." + c));
            }

        }); //ul click
    }); //ul each

    // for basket ------------------------------------------------------------------

    $('.basket_title').data('show', false);
    $('.basket_title').click(function () {
        $('.basket_title').data('show', !$('.basket_title').data('show'));
        if ($('.basket_title').data('show'))
            $(".basket_content").css({ 'height': '80%', 'opacity': '1' });
        else
            $(".basket_content").css({ 'height': '0px', 'opacity': '0' });
    });





    $(".basket_content").droppable({
        drop: function (event, ui) {
            var basket = $(this);
            var box = $(".train_container").data("selected_box");
            var rest_id = parseInt(box.find("#div_rest_id").text());

            var same_food = false;
            basket.find(".basket_food").each(function () {
                if ($(this).find('.basket_rest_food_id').text() == box.find("#div_food_id").text()) {
                    alert("این غذا قبلاً انتخای شده است.");
                    same_food = true;
                }
            }); // same food
            if (same_food) return;

            var is_similar_rest = false;
            basket.find("#rest_id").each(function () {
                if (parseInt($(this).text()) == rest_id) {
                    is_similar_rest = true;
                    var rest = $(this).parent();
                    var new_food = basket.find('.o').clone();
                    new_food.removeClass('o');

                    new_food.find(".basket_rest_food_id").text(box.find("#div_food_id").text());
                    new_food.find(".basket_food_name").text(box.find("#div_food_name").text());
                    new_food.find(".basket_food_price").text(box.find("#div_price").text());
                    new_food.find(".basket_food_count").attr('max', box.find("#div_max_number").text());

                    new_food.find(".btn_delete_food").click(function () {
                        if (!confirm("ایا مایل به حذف غذای مورد نظر هستید")) return;
                        if ($(this).parent().parent().find(".basket_food:not(.o)").length == 1)
                            $(this).parent().parent().remove();
                        else
                            $(this).parent().remove();

                    });

                    rest.append(new_food);
                }
            }); // similar rest searching

            if (is_similar_rest == false) {
                //insert new rest
                var new_rest = $('<fieldset  class="restaurant" ><legend ><div class="rest_name"></div> </legend><div id="rest_id" class="hidden"></div><div id="rest_address" class="hidden"></div></fieldset>');
                new_rest.find('.rest_name').text(' Resturant ' + box.find("#div_rest_name").text());
                new_rest.find('#rest_id').text(box.find("#div_rest_id").text());
                new_rest.find('#rest_address').text(box.find("#div_rest_address").text());

                $('.basket_content').append(new_rest);

                new_rest.find('.rest_name').click(function () {
                    $('.basket_camplate').show_overlay($(this).parent().parent());
                });

                //insert new food
                var new_food = basket.find('.o').clone();
                new_food.removeClass('o');

                new_food.find(".basket_rest_food_id").text(box.find("#div_food_id").text());
                new_food.find(".basket_food_name").text(box.find("#div_food_name").text());
                new_food.find(".basket_food_price").text(box.find("#div_price").text());
                new_food.find(".basket_food_count").attr('max', box.find("#div_max_number").text());

                new_food.find(".btn_delete_food").click(function () {
                    if (!confirm("ایا مایل به حذف غذای مورد نظر هستید")) return;
                    if ($(this).parent().parent().find(".basket_food:not(.o)").length == 1)
                        $(this).parent().parent().remove();
                    else
                        $(this).parent().remove();

                });

                new_rest.append(new_food);


            }



            box.remove();
        }
        , activeClass: "hover"
        , accept: ".box"
    });



    // for train ------------------------------------------------------------------

    $(".train_container").make_train_album();
    /*
    for (i = 0; i < 10; i++)
    $(".o").add_new_panel_to_album();
    $(".o").remove();
    */
    $(".train_container").train_arrow(-1);


    // for selected listes ------------------------------------------------------------------


    $('#listes').data('show', false);
    $('#listes').data('list_number', 0);
    $('#tbl_search .button').each(function () {
        $(this).click(function () {
            var list_num;
            if ($(this).hasClass('1'))
                list_num = 1;
            else if ($(this).hasClass('2'))
                list_num = 2;
            else if ($(this).hasClass('3'))
                list_num = 3;
            else if ($(this).hasClass('4'))
                list_num = 4;


            if ($('#listes').data('show') == true) {
                $('#listes .' + $('#listes').data('list_number')).css({ 'opacity': 0, 'height': '0px' });
                if ($('#listes').data('list_number') != list_num) {
                    $('#listes .' + list_num).css({ 'opacity': 1, 'height': '120px' });
                    $('#listes').data('list_number', list_num);
                }
                else {
                    $('#listes').data('show', false);
                    $('#listes').data('list_number', 0);
                }

            }
            else {
                $('#listes .' + list_num).css({ 'opacity': 1, 'height': '120px' });
                $('#listes').data('show', true);
                $('#listes').data('list_number', list_num);
            }
        }); // click
    }); // each button


    // for txt ------------------------------------------------------------------

    $('#tbl_search').data('list_number', 0);
    $('#tbl_search').data('show', false);
    $('.txt').each(function () {

        $(this).focus(function () {
            if ($('#tbl_search').data('show'))
                $('#tbl_search .txt_list').css({ 'height': '0px', 'opacity': '0' });

            var list_num;
            if ($(this).hasClass('1'))
                list_num = 1;
            else if ($(this).hasClass('2'))
                list_num = 2;
            else if ($(this).hasClass('3'))
                list_num = 3;
            else if ($(this).hasClass('4'))
                list_num = 4;

            $('#tbl_search .txt_list.' + list_num).css({ 'height': '100px', 'opacity': '1' });
            $('#tbl_search').data('list_number', list_num);
            $('#tbl_search').data('show', true);

            $(this).keyup();
            //search_func($('.txt.' + list_num).val(), list_num);
        }); // focus
        $(this).blur(function () {

        }); // focus
    }); // each txt

    // for txt ------------------------------------------------------------------

    $('.chk').each(function () {

        $(this).click(function () {
            var list_num;
            if ($(this).hasClass('1'))
                list_num = 1;
            else if ($(this).hasClass('2'))
                list_num = 2;
            else if ($(this).hasClass('3'))
                list_num = 3;
            else if ($(this).hasClass('4'))
                list_num = 4;

            var t = $(this).parent().next();


            if ($(this).attr('checked')) {
                t.find("." + list_num).removeClass('hidden');
                t.next().find("." + list_num).css({ 'display': 'inline-block' });
            }
            else {
                //t.find(".1").css({ 'visibility': 'hidden' });
                t.find("." + list_num).addClass('hidden');
                t.next().find("." + list_num).css({ 'display': 'none' });
            }
        }); // click

    }); // each checkbox

    // for txt auto searches ------------------------------------------------------------------


    $('.txt').each(function () {
        var timed_func;
        $(this).keyup(function () {
            clearTimeout(timed_func);

            var txt_num = 4;
            if ($(this).hasClass('1'))
                txt_num = 1;
            else if ($(this).hasClass('2'))
                txt_num = 2;
            else if ($(this).hasClass('3'))
                txt_num = 3;
            else if ($(this).hasClass('4'))
                list_num = 4;


            timed_func = setTimeout(function () { search_func($('.txt.' + txt_num).val(), txt_num); }, 1);
        }); // txt keyup
        function search_func(str_search, txt_num) {
            if (txt_num == 1) {
                $('.txt_list.1').load("pages/search_word.aspx?q=" + str_search + "&txt_num=1", function () {
                    $(this).find('li').each(function () {
                        $(this).click(function () {
                            $('#listes .' + txt_num).addNewItemToList($(this).html());
                            $(this).remove();
                        }); //li click
                    }); // each li

                }); // load done
            } // txt_num=1=txt_city
            else if (txt_num == 2) {
                var city_list = "";
                if ($('.chk.1').attr('checked'))
                    $('#listes .1 .selected_list_item').each(function () {
                        city_list += $(this).find('.hidden').text() + ",";
                    });

                $('.txt_list.2').load("pages/search_word.aspx?q=" + str_search + "&txt_num=2&city_list=" + city_list, function () {
                    $(this).find('li').each(function () {
                        $(this).click(function () {
                            $('#listes .' + txt_num).addNewItemToList($(this).html());
                            $(this).remove();
                        }); //li click
                    }); // each li

                }); // load done
            } // txt_num=2=txt_rest
            else if (txt_num == 3) {
                var rest_list = "";
                if ($('.chk.2').attr('checked'))
                    $('#listes .2 .selected_list_item').each(function () {
                        rest_list += $(this).find('.hidden').text() + ",";
                    });

                $('.txt_list.3').load("pages/search_word.aspx?q=" + str_search + "&txt_num=3&rest_list=" + rest_list, function () {
                    $(this).find('li').each(function () {
                        $(this).click(function () {
                            $('#listes .' + txt_num).addNewItemToList($(this).html());
                            $(this).remove();
                        }); //li click
                    }); // each li

                }); // load done


            } // txt_num=3=txt_area
            else if (txt_num == 4) {
                var city_list = "";
                if ($('.chk.1').attr('checked'))
                    $('#listes .1 .selected_list_item').each(function () {
                        city_list += $(this).find('.hidden').text() + ",";
                    });

                city_list = "";
                $('.txt_list.4').load("pages/search_word.aspx?q=" + $('.txt.4').val() + "&txt_num=4&rest_list=" + city_list, function () {
                    $(this).find('li').each(function () {
                        $(this).click(function () {
                            $('#listes .' + txt_num).addNewItemToList($(this).html());
                            $(this).remove();
                        }); //li click
                    }); // each li

                }); // load done

            } // txt_num=2=txt_rest

        } //txt search_func
    }); // each txt

    /* btn search food ------------------------------------------------------------------------ */

    var get_food_loading_func;
    $('#btn_food_search').click(function () {
        var city_list = "";
        if ($('.chk.1').attr('checked'))
            $('#listes .1 .selected_list_item').each(function () {
                city_list += $(this).find('.hidden').text() + ",";
            });

        var rest_list = "";
        if ($('.chk.2').attr('checked'))
            $('#listes .2 .selected_list_item').each(function () {
                rest_list += $(this).find('.hidden').text() + ",";
            });

        var food_ids = "";
        if ($('.chk.3').attr('checked'))
            $('#listes .3 .selected_list_item').each(function () {
                food_ids += $(this).find('.hidden').text() + ",";
            });


        if (!$('#chk_btn_search').attr('checked')) $(".train_container").reset_tran();
        clearTimeout(get_food_loading_func);
        $('.progres .pivot').css({
            'width': '0px'
        });
        $('#div_temp').load("pages/search_food_id.aspx?count_or_index=0&food_ids=" + food_ids + "&rest_list=" + rest_list + "&city_list=" + city_list, function () {
            max_num = parseInt($(this).find('#div_count').text());

            $(".main_panel_wrapper").css({ 'height': '0px', 'opacity': '0' });
            $(".main_panel_wrapper").data("is_closed", true);
            
            get_food_func = setTimeout(get_food(food_ids, rest_list, city_list, 1, max_num, 0), 1);
        });

        function get_food(food_ids, rest_list, city_list, current_num, max_num, desc) {
            if (current_num > max_num) return;

            $('#div_temp').load("pages/search_food_id.aspx?count_or_index=" + current_num + "&food_ids=" + food_ids + "&rest_list=" + rest_list + "&city_list=" + city_list + "&desc=" + desc, function () {
                $('.progres .pivot').css({
                    'width': ((current_num * 100) / max_num) + '%'
                });
                $(this).find('.box').add_new_panel_to_album();
                get_food_loading_func = setTimeout(function () { get_food(food_ids, rest_list, city_list, current_num + 1, max_num, desc); }, 1);

            });
        } /* get_food */

    });
    /*   progres ------------------------------------------------------------  */

    $('.progres').click(function () {
        clearTimeout(get_food_loading_func);
        $('.progres .pivot').css({
            'width': '0px'
        });
    });

    /*   b2 ------------------------------------------------------------  */




});                                                                       // load





(function ($) {
    $.fn.addNewItemToList = function (s) {
        var item = $('<div class="selected_list_item"><div class="list_item_deleter">۞</div>' + s + '</div>');
        item.find('.list_item_deleter').click(function () {
            //var k = confirm("آیا مایل به حذف ایتم مورد نظر هستید؟");
            //if (k)
                $(this).parent().remove();
        });

        item.appendTo($(this));
    }

    
})(jQuery);