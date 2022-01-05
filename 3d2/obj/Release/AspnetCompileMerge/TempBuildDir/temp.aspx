<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="temp.aspx.cs" Inherits="_3d2.temp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    


    <input type="text" list="#t" />
         <datalist id="t">
            <option value="ali"/>
            <option value="reza"/>
            <option value="mahdi"/>
         </datalist>

        <div class="demo">
	
        <div id="a" class="ui-widget-content">
	        <p>Drag me to my target</p>
        </div>

        <div id="b" class="ui-widget-header">
	        <p>Drop here</p>
        </div>

        </div><!-- End demo -->
    </form>
</body>
</html>
<script src="files/script/jquery-1.3.2.min.js" type="text/javascript"></script>


<script src="jquery-ui-1.7.3.custom.min.js" type="text/javascript"></script>

<script type="text/javascript">
    $(function () {
        $("#a").draggable({ containment: 'document', revert: true });
        
        $("#b").droppable({
            drop: function (event, ui) {
                var answer = confirm('are u sure?');
                alert(answer);
            },
            over: function () {
                $(this).css('color', "red");

            },
            out: function () {
                $(this).css('color', "black");

            }

            ,hoverClass: "r"
            , activeClass: "r"
            , accept: ".box"
        });


    });

    


</script>



<style>
    .b
    {
        width:100px;
        height:100px;
        background-color:Green;
        
        }
    .r
    {
        border:3px solid red;
        }	
	
</style>




