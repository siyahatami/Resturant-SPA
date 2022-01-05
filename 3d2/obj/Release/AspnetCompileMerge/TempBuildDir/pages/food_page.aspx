<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="food_page.aspx.cs" Inherits="_3d2.pages.food_page" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
        <div id="div_food" runat="server">
            <div class="box"> 
                <div class="over over_small">◄</div>
                <br />
                <div class="header" >
                    <table class="box_inner_content" style="direction:ltr; margin-top:-10px; ">
                        <tr>
                            <td class="td_culomn_name">Food Name:</td>
                            <td><div id="div_food_name" runat="server" style="display:inline;"></div></td>
                        </tr>
                        <tr>
                            <td class="td_culomn_name">Price</td>
                            <td><div id="div_price" runat="server" style="display:inline;"></div>
                            $
                            </td>
                        </tr>
                        <tr>
                            <td class="td_culomn_name">Resturant:</td>
                            <td><div id="div_rest_name" runat="server" style="display:inline;"></div></td>
                        </tr>
                        <tr>
                            <td class="td_culomn_name">Address</td>
                            <td><div id="div_rest_address" runat="server" style="display:inline;"> </div></td>
                        </tr>
                        <tr>
                            <td class="td_culomn_name">Orderable:</td>
                            <td><div id="div_can_order" runat="server" style="display:inline;"></div></td>
                        </tr>
                    </table>
            
                        <div id="div_food_id" class="hidden" runat="server"></div>
                        <div id="div_rest_id" class="hidden" runat="server"></div>
                        <div id="div_max_number" class="hidden" runat="server"></div>
                    
                </div>
                <div class="content" > 
                    
                </div>

        </div>
        </div>
        <br />
        <div id="div_desc" runat="server">
            <hr />
            Food Details:
            <br />
            <div id="div_food_desc" runat="server" ></div>
            <br />
            
            Resturant Details:
            <br />
            <div id="div_rest_desc" runat="server" ></div>
        </div>            


    </form>
</body>
</html>
