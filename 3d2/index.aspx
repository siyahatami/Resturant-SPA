<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="_3d2.index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
            <table class="main_bone_table" style="width:100%;" >
                <tr style="z-index: 10; position: relative;">
                    <td>       
                         <ul class="top_menu" >
                                
                                 <li style="z-index:10"><img style="margin:-12px 0px 0px -15px; height:150%; width:100%;" src="files/images/form/serving_tray_steam_ha.png" /></li>
                                
                                
                             <li class="pnl1" style="z-index:9;">Search</li>
                                <li class="pnl2" style="z-index:8;">Resturants</li>
                             
                             <li class="pnl3" style="z-index:7;">Blog</li>
                                
                                
                                <li class="pnl4" style="z-index:6;">About</li>
                                <li class="pnl5" style="z-index:5;">Contact us</li>
                            </ul>
                    </td>
                </tr>
               <tr style="z-index: 5; position: relative;">
                    <td style="display: flex; justify-content: center;">
                        <div class="main_panel_wrapper" style="">
                            <div class="panel pnl1" pn="pnl1" >
                                <table  >
                                    <tr style="vertical-align:top;">
                                        <td>
                                            <table id="tbl_search" >
                                                <%--<tr style="vertical-align:top;">
                                                    <td>
                                                        <input id="chk_city" type="checkbox" class="chk 1" checked="checked" />
                                                        Cities
                                                    </td>
                                                    <td>
                                                        <input id="txt_city" class="txt 1 mytxt" type="text" size=23  placeholder="City" />
                                                        <div  class="selected_list txt_list city_list 1" > </div>
                                                    </td>
                                                    <td>
                                                        <div id="btn_city" style="width:80px; height:25px; display:inline-block; font-size:15px;" class="button 1">Selected</div>
                                                    </td>
                                                </tr>--%>
                                                <tr style="vertical-align:top;">
                                                    <td>
                                                        <input id="chk_city" type="checkbox" class="chk 1" checked="checked" />
                                                        Areas
                                                    </td>
                                                    <td>
                                                        <input id="txt_city" class="txt 1 mytxt" type="text" size=23  placeholder="Area" />
                                                        <div  class="selected_list txt_list city_list 1" > </div>
                                                    </td>
                                                    <td>
                                                        <div id="btn_city" style="width:80px; height:25px; display:inline-block; font-size:15px;" class="button 1">Selected</div>
                                                    </td>
                                                </tr>
                                               <%-- <tr style="vertical-align:top;">
                                                    <td>
                                                        <input id="chk4" type="checkbox" class="chk 4" checked="checked" />
                                                        Areas:
                                                    </td>
                                                    <td>
                                                        <input id="txt_area" type="text" size=23 class="txt 4 mytxt" placeholder="Area" />
                                                        <div  class="selected_list txt_list area_list 4" > </div>
                                                    </td>
                                                    <td>
                                                        <div id="btn_area" style="width:80px; height:25px; display:inline-block; font-size:15px;" class="button 4">Selected</div>
                                                    </td>
                                                </tr>--%>
                                                <tr style="vertical-align:top;">
                                                    <td>
                                                        <input id="Chk_rest" type="checkbox" class="chk 2" checked="checked" />
                                                        Resturants:
                                                    </td>
                                                    <td>
                                                        <input id="txt_rest" type="text" size=23  class="txt 2 mytxt" placeholder="Resturant"/>
                                                        <div  class="selected_list txt_list city_list 2" > </div>
                                                    </td>
                                                    <td>
                                                        <div id="btn_rest" style="width:80px;  height:25px; display:inline-block; font-size:15px;" class="button 2">Selected</div>
                                                    </td>
                                                </tr>
                                                <tr style="vertical-align:top;">
                                                    <td>
                                                        <input id="chk_food" type="checkbox" class="chk 3" checked="checked" />
                                                        Foods:
                                                    </td>
                                                    <td>
                                                        <input id="txt_food" type="text" size=23 class="txt 3 mytxt" placeholder="Food" />
                                                        <div  class="selected_list txt_list city_list 3" > </div>
                                                    </td>
                                                    <td>
                                                        <div id="btn_food" style="width:80px; height:25px; display:inline-block; font-size:15px;" class="button 3">Selected</div>
                                                    </td>
                                                </tr>

                                            </table>
                                            
                                            <div id="btn_food_search" style="width:100px; height:25px; display:inline-block; font-size:15px; margin-left:70px; " class="button">Search</div>
                                            
                                            <div style="display:inline-block;">
                                                <input id="chk_btn_search" type="checkbox" checked="false" style="display:inline;" />
                                                Preserve previous resutls</div>
                                            
                                        </td>
                                        <td id="listes" style=""padding-left: 7px;">
                                            <div  class="selected_list city_list 1" > </div>
                                            <div class="selected_list area_list 4" > </div>
                                            <div class="selected_list rest_list 2" > </div>
                                            <div class="selected_list food_list 3" > </div>
                                        </td>
                                    </tr>
                                </table>
                                
                                <br />
                                
                                
                            </div>


                            <div class="panel pnl2">
                                22222222222222222
                                askdhflkashdjflaskjfas;kldfjs;ldkjf<br />;aslkdjfas;dlfkjasldkfjasldfkjsadlkf<br />jasdlfksjadflasjd;fasjdf;asdjf;a<br />sjdfs;dfjas;dfsajfd;sajdfas<br />;fdjsa;fasfjasf;
                                dfjs;ldkjf<br />;aslkdjfas;dlfkjasldkfjasldfkjsadlkf<br />jasdlfksjadflasjd;fasjdf;asdjf;a<br />sjdfs;dfjas;dfsajfd;sajdfas<br />;fdjsa;fasfjasf;
                            </div>
                            <div class="panel pnl3">
                                <%--<div style="margin:10px;">
                                    <div id="btn_new_rest" style="width:120px; height:25px; font-size:15px; " class="button" >Register a new resturant</div>
                                    <a href="pages/login.aspx" target=_blank style="text-decoration:none;"> <div  style="width:120px; height:25px; font-size:15px; " class="button" >Login</div></a>

                                </div>--%>

                                3333333333333333333
                                dfjs;ldkjf<br />;aslkdjfas;dlfkjasldkfjasldfkjsadlkf<br />jasdlfksjadflasjd;fasjdf;asdjf;a<br />sjdfs;dfjas;dfsajfd;sajdfas<br /><br />;
                                askdhflkashdjflaskjfas;kldfjs;ldkjf<br />;aslkdjfas;dlfkjasldkfjasldfkjsadlkf<br />jasdlfksjadflasjd;fasjdf;asdjf;a<br />sjdfs;dfjas;dfsajfd;sajdfas<br />;fdjsa;fasfjasf;

                            </div>
                            <div class="panel pnl4">
                                444444444444444444
                                dfjs;ldkjf<br />;aslkdjfas;dlfkjasldkfjasldfkjsadlkf<br />jasdlfksjadflasjd;fasjdf;asdjf;a<br />sjdfs;dfjas;dfsajfd;sajdfas<br /><br />;
                                askdhflkashdjflaskjfas;kldfjs;ldkjf<br />;aslkdjfas;dlfkjasldkfjasldfkjsadlkf<br />jasdlfksjadflasjd;fasjdf;asdjf;a<br />sjdfs;dfjas;dfsajfd;sajdfas<br />;fdjsa;fasfjasf;
                            </div>
                            <div class="panel pnl5">
                                555555555555555555555
                                askdhflkashdjflaskjfas;kldfjs;ldkjf<br />;aslkdjfas;dlfkjasldkfjasldfkjsadlkf<br />jasdlfksjadflasjd;fasjdf;asdjf;a<br />sjdfs;dfjas;dfsajfd;sajdfas<br />;fdjsa;fasfjasf;
                            </div>
                        </div>
                        
                
                    </td>
                </tr>

            </table>
            

        <div class="train_container hover">

            <div class="progres">
                        <div class="pivot"></div>
                    </div>

        </div>

        <table class="tbl_basket" >
                        <tr>
                            <td ><div class="basket_title button">Order</div></td>
                        </tr>
                        <tr>
                            <td>
                                <div class="basket_content">
                                    <div style="text-align: center; padding-top:8px;">Drag foods here...</div>
                                    
                                        <div class="basket_food o" >
                                            Food Name: 
                                            <div class="BID basket_food_name">asdasasdsd as</div>
                                            <br />
                                            Price:
                                            <div class="BID basket_food_price">12323</div>
                                            $
                                            <br />
                                            Count:
                                            <input class="BID basket_food_count" type="number" min="1" max="10"  style="width:50px;" value="1" />
                                            <input class="btn_delete_food button " style="display:inline-block; font-size:13px; width:60px; height:23px; margin-left:5px; padding-left:5px; padding-right:5px" type="button" value="Remove" />
                                            <div class="basket_rest_food_id hidden" ></div>
                                            <hr />
                                        </div>
                                
                                    
                                </div>
                            </td>
                        </tr>
                    </table>
    
            
    <div class="overlay">
        <div class="basket_camplate  big_panel">
            <br />
            <div class="food_item hidden" >
                    Food Name:
                    <div class="food_name" style="display:inline-block;">asdasasdsd as</div>
                    <br />
                    Price:
                    <div class="food_price" style="display:inline-block;">12323</div>
                    $
                    <br />
                    Count:
                    <div class="food_count" style="display:inline-block;">12323</div>
                    <br />
                    Total Price
                    <div class="food_total_price" style="display:inline-block;">1212</div>
                    $
                    <div class="rest_food_id hidden" ></div>
                    <hr style="width:70%;" />
                </div>
            <fieldset  class="food_list" >
                <legend >Foods List</legend>
                                    
            </fieldset>
            <div style="margin:10px;">
                Total price:
                <div class="total_price" style="display:inline-block;">1221</div>
                 $
             </div>
             <div style="margin:10px;">
                Mobile:
                <input class="txt_mobile mytxt" type="text" size=20  placeholder="To inform the status of the order" />
                <input class="button" style="width:110px; height:30px; display:inline-block; font-size:14px" type="button" value="Confirm and send" />
                 <table >
                     <tr>
                         <td style="vertical-align:top;">
                            Address:
                         </td>
                         <td>
                             <textarea class="txt_address mytxt" type="text" rows="2" size=20 col="42" style="min-width:300px; max-width:300px;"></textarea>
                             <div  class="selected_list list_address" style="max-height:200px; height:auto; opacity:1; border-color:White; width:310px; margin-right:5px;" > </div>
                         </td>
                     </tr>
                 </table>
                
                 
             </div>
            <fieldset  class="restaurant" >
                <legend >Resturant Information</legend>
                <div class="rest_name" style="display:inline-block;">asdasasdsd as</div>
                <div class="submit" style="display:none;">Submit</div>
                <br />
                Address:
                <div class="rest_address">ad as dasdx\zx\x\x\zx\x\ DA DASDAS DAS DAS  DA SD DASDAS DA Sasda sd as d d sdasdAS DAS  DA SD DASDAS DA Sasda sd as d d sdasdAS DAS  DA SD DASDAS DA Sasda sd as d d sdasdAS DAS  DA SD DASDAS DA Sasda sd as d d sdasdAS DAS  DA SD DASDAS DA Sasda sd as d d sdasdAS DAS  DA SD DASDAS DA Sasda sd as d d sdasdAS DAS  DA SD DASDAS DA Sasda sd as d d sdasdd sad adasDSA </div>
                <div class="rest_id hidden" ></div>
            </fieldset>
            
        </div>
        <div class="basket_camplate_result2  big_panel" style="padding:10px;" ></div>
        <div class=" create_new_rest  big_panel" ></div>

    </div>

    <div id="div_temp" class="hidden"> </div>
            
            
    </form>
</body>
</html>


<script src="files/script/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="files/script/index_page.js" type="text/javascript"></script>
<script src="files/script/overlay_to_last.js" type="text/javascript"></script>
<link href="files/css/css_index_page.css" rel="stylesheet" type="text/css" />
<link href="files/css/overlay_to_last.css" rel="stylesheet" type="text/css" />

<script src="files/script/jquery-ui-1.7.3.custom.min.js" type="text/javascript"></script>
<script src="files/script/jquery.mousewheel.js" type="text/javascript"></script>
<script src="files/script/train_album_script1.js" type="text/javascript"></script>
<link href="files/css/train_album.css" rel="stylesheet" type="text/css" />


<script type="text/javascript">
    $(function () {

        $(',train_container').train_arrow(-1);

        $('#btn_food_search').click();

    });
</script>





