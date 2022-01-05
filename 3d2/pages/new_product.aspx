<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="new_product.aspx.cs" Inherits="_3d2.pages.new_product" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            direction:ltr;
            _width: 100%;
            
        }
        .style1 td
        {
            vertical-align:top;
            
            }
        .style1 td:first-of-type
        {
            width:200px;
            
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="big_panel">
    
        Creating a new food 
         <asp:LinkButton style="text-decoration:none;" CssClass="m" ID="LinkButton1" runat="server" PostBackUrl="~/pages/login.aspx">Back to home</asp:LinkButton>
        <br />
        <table class="style1 m">
            <tr>
                <td>
                    Food name:<br />
                </td>
                <td>
                    <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource1" 
                        DataTextField="food_name" DataValueField="food_id" Height="144px" 
                        Width="176px"></asp:ListBox>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_restConnectionString %>" 
            SelectCommand="SELECT [food_id], [food_name] FROM [tbl_foods]">
        </asp:SqlDataSource>
    
                </td>
            </tr>
            <tr>
                <td>
    <p>
        You can add food name if can not find it</p>
                </td>
                <td>
        <asp:TextBox ID="txt_new_food" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Add" onclick="Button1_Click" />
                </td>
            </tr>
            
            <tr>
                <td>
        Price:</td>
                <td>
                    <asp:TextBox ID="txt_price" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
        Available counts:</td>
                <td>
                    <asp:TextBox ID="txt_count" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
    <p>
        Maximum order number</p>
                </td>
                <td>
        <asp:TextBox ID="txt_max" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
        Food description</td>
                <td>
                    
                    <textarea  id="txt_desc" runat="server" type="text" rows="4" style="min-width:250px; max-width:250px;"></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Add" 
                        Width="78px" />
                </td>
            </tr>
            
        </table>
    </div>
    </form>
</body>
</html>

<style type="text/css">

.big_panel
{
    padding:10px;
    height:500px;
    width:500px;
    padding:5px;
    _-webkit-transition: all 2s;
    _-moz-transition: all 2s;
    margin-left:auto;
    margin-right:auto;
    overflow:auto;
    direction:ltr;
    border-radius:20px;
    background: -webkit-linear-gradient(top, rgba(100,100,100,1) 0%
                                    ,rgba(255,255,255,1) 4%
                                    ,rgba(220,220,220,1) 50%
                                    ,rgba(255,255,255,1) 485px
                                    ,rgba(100,100,100,1) 100%
                                    );  
    background: -moz-linear-gradient(top, rgba(100,100,100,1) 0%
                                    ,rgba(255,255,255,1) 4%
                                    ,rgba(220,220,220,1) 50%
                                    ,rgba(255,255,255,1) 485px
                                    ,rgba(100,100,100,1) 100%
                                    );                                      
    box-shadow:5px 10px 20px rgba(0,0,0,0.7);
    
    
    }

    .m
    {
        margin-left:auto;
        margin-right:auto;
        
        }


body
{
    min-width:700px;
    background: -webkit-linear-gradient(left, rgba(0,0,0,1) 0%
                                             ,rgba(255,255,255,0) 32%
                                            ,rgba(255,255,255,1) 65%
                                            ,rgba(0,0,0,1) 100%
                                            ,transparent 100%
                                            );   
    background: -moz-linear-gradient(left, rgba(0,0,0,1) 0%
                                             ,rgba(255,255,255,0) 32%
                                            ,rgba(255,255,255,1) 65%
                                            ,rgba(0,0,0,1) 100%
                                            ,transparent 100%
                                            );   
    }


</style>
