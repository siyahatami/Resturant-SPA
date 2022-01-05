
var first_pos_x = 100, first_tran_z = 0, current_index = 0, last_pox_x=100,last_tran_z=0,child_count=0,is_any_big=false;
var x_delta = 30, z_delta = 100;

(function ($) {
    var container;

    $.fn.make_train_album = function () {
        container = $(this);
        
        container.hover(function(){
            container.addClass("hover");
            },function(){
            container.removeClass("hover");
            });
            
        container.find(".box").each(function () {
            $(this).make_mini_train();
        }); // set default views
    //---------------------------------------------------        mouse wheel       --------------------
        container.mousewheel(function (event, delta) {
            $(this).train_arrow(delta);
            return false;
        }); // mouse wheel
        
    //---------------------------------------------------        key down       --------------------
        $(document).keydown(function (e) {
            //var v=String.fromCharCode(e.keyCode);
            if (container.hasClass("hover")){
                var v=e.keyCode;
                if (v==37 || v==38){
                    container.train_arrow(-1);
                    return false;
                }
                if (v==40 || v==39){
                    container.train_arrow(1);
                    return false;
                }
            }// hass class
        }); // key down
    //..................................................................................................
        
    }; // make_train_album
//-------------------------------------------------------       mouse click       -----------------------
    $.fn.make_clickable=function(){
       var box=$(this);
        
        box.find(".over_small").click(function(){
            
            if (box.data("is_big")==false)
            {
                //if (is_any_big==true)
                    while(box.data("tran_z")<z_delta)
                        box.parent().train_arrow(1);

                box.change_box_view(1);
            }
            else
                box.change_box_view(0);
        });// click
        
    };// make_clickable

    
//----------------------------------------------------------     make_mini_train     ----------------------
     $.fn.change_box_view=function(size){
        var box=$(this);
       
        if (size==1 )
        {   // make it big
            //box.draggable('disable');
            box.draggable("option", "disabled", true);

            box.addClass("box_big");
            
            box.css({
                "-webkit-transform": "rotateY(0deg)",
                "-moz-transform": "rotateY(0deg)",
                "left": "50%",
                "z-index":11111
                });
                
            box.data("is_big",true);
            is_any_big=true;


            box.find(".content").css("display","block");

            box.find(".over").removeClass("over_small");
            box.find(".over").addClass("over_big");

            if (box.data("is_desc_loaded")==false)
            {
                box.data("is_desc_loaded",true);
                var food_id=parseInt( box.find('#div_food_id').text());
                box.find(".content").html("Please wait...");
                box.find(".content").load("pages/food_page.aspx?rest_food_id="+food_id+"&desc=1");
            }
        }
        else{   // make it small
            box.draggable("option", "disabled", false);
            box.find(".content").css("display","none");
            is_any_big=false;
            box.find(".over").removeClass("over_big");
            box.find(".over").addClass("over_small");

            box.removeClass("box_big");
            box.css({
                "-webkit-transform": "perspective(1000px) translate3d(0px,0px," + $(this).data("tran_z") + "px) rotateY(0deg) ",
                "-moz-transform": "perspective(1000px) translate3d(0px,0px," + $(this).data("tran_z") + "px) rotateY(0deg) ",
                "left":box.data("pos_x"),
                "z-index":box.data('z-index')
            });
            box.data("is_big",false);
            
        }
        
    };// change box view

//----------------------------------------------------------     make_mini_train     ----------------------
     $.fn.make_mini_train=function(){
        var box =$(this);
        box.draggable({  axis: "x", containment:'document'});
        
        box.mousedown(function(){
            container.data("selected_box",box);
        }).mouseup(function(){
            container.data("selected_box",null);
        });


        box.css({"-webkit-transform": "perspective(1000px) translate3d(0px,0px," + last_tran_z + "px) rotateY(0deg) ",
                "-moz-transform": "perspective(1000px) translate3d(0px,0px," + last_tran_z + "px) rotateY(0deg) "
            });
        box.css("left", last_pox_x);

        child_count++;
        box.css("z-index", -child_count );
        box.data('z-index',-child_count )
        box.make_clickable();

        box.data("is_big", false);
        box.data("pos_x", last_pox_x);
        box.data("tran_z", last_tran_z);
        box.data("is_desc_loaded",false);

        last_pox_x += x_delta;
        last_tran_z -= z_delta;

        
    };// make_mini_train

//-----------------------------------------------------------     one arrow     -------------------------
     $.fn.train_arrow=function(k){
            var container=$(this);
            var direc=k || 1;

            if (last_tran_z +(z_delta * direc)>z_delta)
                if (delta > 0)
                    return false;

            if (first_tran_z+(z_delta * direc) < -(z_delta*5))
                if (delta < 0)
                    return false;

            last_pox_x -= x_delta * direc;
            last_tran_z += z_delta * direc;

            first_pos_x-= x_delta * direc;
            first_tran_z+= z_delta * direc;
            
            var temp_x=first_pos_x;
            var temp_z=first_tran_z;
            
            container.find(".box").each(function () {
                var box=$(this);
                                                                
                if (box.data("is_big") == true) {
                    box.change_box_view(0);
                }

                if (direc > 0) {
                    temp_x += x_delta * direc;
                    temp_z -= z_delta * direc;
                } else {
                    temp_x -= x_delta * direc;
                    temp_z += z_delta * direc;
                }

                box.css({"-webkit-transform": "perspective(1000px) translate3d(0px,0px," + temp_z + "px) rotateY(0deg) ",
                        "-moz-transform": "perspective(1000px) translate3d(0px,0px," + temp_z + "px) rotateY(0deg) "
                        });
                
                box.css("left", temp_x);
                if (temp_z > z_delta+1) {
                    box.css({
                        "-webkit-opacity": "0",
                        "-moz-opacity": "0",
                        "-webkit-transform": "translateY(400px)",
                        "-moz-transform": "translateY(400px)"
                    });
                }
                else {
                    box.css({"-webkit-opacity": 1,
                        "-moz-opacity": 1
                        });
                }

                box.data("pos_x", temp_x);
                box.data("tran_z", temp_z);

            }); // each
            
        };// train arrow

//----------------------------------------------------------     make_mini_train     ----------------------
     $.fn.add_new_panel_to_album=function(){
        var new_box =$(this).clone();
        
        container.append(new_box);
        new_box.make_mini_train();
        new_box.removeClass('o');
        
    };// add_new_panel_to_album
    

    //----------------------------------------------------------     reset     ----------------------
    $.fn.reset_tran=function(){
        $(this).find('.box').remove();

        first_pos_x = 100;
        first_tran_z = 0;
        current_index = 0;
        last_pox_x=100;
        last_tran_z=0;
        child_count=0;
        is_any_big=false;

    };
    


})(jQuery);