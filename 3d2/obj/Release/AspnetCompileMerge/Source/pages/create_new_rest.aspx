<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="create_new_rest.aspx.cs" Inherits="_3d2.pages.create_new_rest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="div_new_rest" runat="server">
        <table class="tbl_new_rest">
            <tr>
                <td>
                    Resturant
                </td>
                <td>
                    <input type="text" class="mytxt" id="rest_name" placeholder="Resturant name (without resturant keyword)"/>
                </td>
            </tr>
            <tr>
                <td style="text-align:justify;">
                    Resturant ID - this ID is used for the direct identificaiton of users:
                </td>
                <td>
                    <input type="text" class="mytxt" id="user_name"  placeholder="User ID"/>
                </td>
            </tr>
            <tr>
                <td>
                    Password: 
                </td>
                <td>
                    <input type="password" class="mytxt" id="pass1" placeholder="at least 6 characters"/>
                </td>
            </tr>
            <tr>
                <td>
                    تPassword confirma:

                </td>
                <td>
                    <input type="password" class="mytxt" id="pass2" />
                </td>
            </tr>
            <tr>
                <td>
                City: 
                </td>
                <td>
                    <input type="text" id="city" class="mytxt" placeholder="Please select the city from the list"/>
                    <div  class="selected_list" style="width:200px; max-height:200px;" > </div>
                </td>
            </tr>
            <tr>
                <td>
                    Area number
                </td>
                <td>
                    <input type="text" class="mytxt" id="area_id" placeholder="in number"/>
                </td>
            </tr>
            <tr>
                <td>
                    Area name:
                </td>
                <td>
                <input type="text" class="mytxt" id="area_name" />
                </td>
            </tr>
            <tr>
                <td>
                    Address:
                </td>
                <td>
                    <textarea class="mytxt" class="mytxt" id="address" type="text" rows="4" style="min-width:250px; max-width:250px;"></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    Email: 
                </td>
                <td>
                    <input type="type" class="mytxt" id="email" placeholder="Optional"/>
                </td>
            </tr>
            <tr>
                <td>
                    Mobile: 
                </td>
                <td>
                    <input type="text" class="mytxt" id="phone" placeholder="Required"/>
                </td>
            </tr>
            <tr>
                <td>
                    Resturant Description:
                </td>
                <td>
                    <textarea class="mytxt" class="mytxt" id="desc" type="text" rows="4"   style="min-width:250px; max-width:250px;"></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    Captcha:
                </td>
                <td>
                    <img id="img_chaptcha"  runat="server"  />
                    <input type="text" id="txt_captcha" class="mytxt" placeholder="Please enter above characters"/>
                </td>
            </tr>
        </table>

        <div id="btn_create_rest" style="width:150px; height:25px; font-size:15px; margin-left:auto; margin-right:auto;" class="button" >Create Resturant</div>

     
        
        
        
        
        
        
        
        
        
        
        
        
    </div>
    </form>
</body>
</html>

<style type="text/css">
    
.tbl_new_rest 
{
    direction:ltr;
    }

.tbl_new_rest tr td
{
    vertical-align:top;
    }    
.tbl_new_rest tr td:first-of-type
{
    width:250px;
    }

.tbl_new_rest tr td:last-of-type
{
    min-width:250px;
    max-width:250px;
    }

</style>
