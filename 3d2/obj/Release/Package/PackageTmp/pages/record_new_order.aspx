<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="record_new_order.aspx.cs" Inherits="_3d2.pages.record_new_order" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="div_fault" runat="server">
            The operation failed.
        </div>
        


        <div  id="div_result"  runat="server">
            <br />
            Thanks for your choice, the order has been registered.
            <h3>Order ID: 
                <div id="order_id" style="display:inline;" runat="server" runat="server"></div>
            </h3>
            <h3 style="display:inline;" >Total Price: </h3>
            <div id="total_price" style="display:inline;" runat="server" ></div>
            $

            <h3 id="rest_name" runat="server"></h3 >
            
            <h3 style="display:inline;" >آدرس: </h2>
            <div id="rest_address" style="display:inline;" runat="server" ></div>
            
            <h3>Resturant Phone: </h3>
            <ul id="rest_phone" runat="server" style="list-style:none; margin-top:0px; padding-top:0px;">
                
            </ul>

            <div style="text-align:justify;">
                You can find out the status of your last order by sending a blank SMS to #############.
           </div>
        </div>
    </form>
</body>
</html>

<style type="text/css">
h3
{
    margin-bottom:1px;
    margin-bottom:3px;
    }
</style>
