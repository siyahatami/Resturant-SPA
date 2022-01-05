<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="_3d2.pages.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="big_panel"  >
        <asp:LinkButton  ID="LinkButton3" runat="server" onclick="LinkButton3_Click">خروج</asp:LinkButton>
        <br />
        <asp:Login CssClass="m" ID="Login1" runat="server" BackColor="#F7F6F3" BorderColor="#E6E2D8" 
            BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
            Font-Size="0.8em" ForeColor="#333333" Height="127px" 
            onauthenticate="Login1_Authenticate" Width="222px">
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" 
                BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
            <TextBoxStyle Font-Size="0.8em" />
            <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" 
                ForeColor="White" />
        </asp:Login>
        
        <asp:LinkButton style="text-decoration:none;" CssClass="m" ID="LinkButton1" runat="server" PostBackUrl="~/pages/new_product.aspx">َAdd food</asp:LinkButton>
        <br />
        <asp:LinkButton style="text-decoration:none;" CssClass="m" ID="LinkButton2" runat="server" PostBackUrl="~/pages/rest_report.aspx">Report</asp:LinkButton>
        <br />
        <br />
    </div>
    
    </form>
    
</body>
</html>

<style type="text/css">

    .big_panel
{
    padding:10px;
    height:300px;
    width:250px;
    padding:5px;
    -webkit-transition: all 2s;
    -moz-transition: all 2s;
    margin-left:auto;
    margin-right:auto;
    overflow:auto;
    direction:ltr;
    border-radius:20px;
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
