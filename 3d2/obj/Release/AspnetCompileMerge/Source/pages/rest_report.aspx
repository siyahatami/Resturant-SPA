<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rest_report.aspx.cs" Inherits="_3d2.pages.rest_report" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="big_panel">
    
    <div style="direction: ltr" class="m">
        Resturant Report
        
        <asp:LinkButton CssClass="m" style="text-decoration:none;" ID="LinkButton1" runat="server" PostBackUrl="~/pages/login.aspx">برگشت به صفحه ی ورود</asp:LinkButton>
        <br />

        <asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="state_desc" 
            DataValueField="state_id" Height="20px" 
             Width="182px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_restConnectionString %>" 
            SelectCommand="SELECT [state_id], [state_desc] FROM [tbl_order_state]">
        </asp:SqlDataSource>
        
        <br />
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            Text="Form date" />
        <asp:Button ID="Button2" runat="server" Text="To ate" 
            onclick="Button2_Click" />
        <asp:Button ID="Button3" runat="server" Text="Search" onclick="Button3_Click" />
        <asp:Calendar ID="Calendar1" runat="server" Visible="False"></asp:Calendar>
        
        <asp:Calendar ID="Calendar2" runat="server" Visible="False"></asp:Calendar>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" ForeColor="#333333" GridLines="None" 
            onrowcommand="GridView1_RowCommand" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="order_title_id" HeaderText="Order ID" />
                <asp:BoundField DataField="just_date" HeaderText="Date" />
                <asp:BoundField DataField="order_time" HeaderText="Time" />
                <asp:BoundField DataField="total_price" HeaderText="Total Price" />
                <asp:BoundField DataField="user_phone" HeaderText="Mobile" />
                <asp:BoundField DataField="user_address" HeaderText="Address" />
                <asp:ButtonField CommandName="show_daitels" HeaderText="Order" 
                    Text="Show" />
                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:DropDownList ID="dropdownlist_state" runat="server" 
                            DataSourceID="SqlDataSource1" DataTextField="state_desc" 
                            DataValueField="state_id" Height="16px" Width="179px">
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:ButtonField CommandName="btn_change" HeaderText="Apply" 
                    Text="Edit" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="food_name" HeaderText="Food" />
                <asp:BoundField DataField="food_price" HeaderText="Price" />
                <asp:BoundField DataField="food_count" HeaderText="Count" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <br />
        <br />
        <br />
        <br />
        <br />

    </div>
    </div>
    </form>
</body>
</html>


<style type="text/css">

.big_panel
{
    padding:10px;
    height:600px;
    width:900px;
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
