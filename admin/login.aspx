<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="admin_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    
    <link href="../content/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <title></title>
    <style>
        .wraped {
            margin-top:10px;
        }
        </style>
</head>
<body>
    <div class="wraped">
       <div class="container">  
    
    <form id="form1" runat="server">
        
        <hr />

    <div class="row">
           
            <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3" style="border:1px solid black">
                <h4 style="padding-bottom:2px;text-align:center;border-bottom:solid 2px green;font-weight: bold; color: #990033; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-size: large;">Admin Log In</h4>
                <h4 style="padding-bottom:2px;text-align:center;border-bottom:solid 2px green;font-weight: bold; color: #990033; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;">(<asp:HyperLink ID="HyperLink1" NavigateUrl="~/Default.aspx" runat="server" Font-Size="Small">Go to Main page</asp:HyperLink>
                    )</h4>            
            <h5 style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-size: medium; font-weight: bold;">&nbspEmail:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Empty Field" Font-Names="Bodoni MT" Font-Size="Small" ForeColor="#CC3300" ControlToValidate="logemail"></asp:RequiredFieldValidator>
                <asp:Label ID="error" runat="server" Font-Names="Bell MT" ForeColor="#CC3300"></asp:Label>
            </h5>
            <asp:TextBox ID="logemail" runat="server" TextMode="SingleLine" Width="100%"></asp:TextBox>
            <br />
            <h5 style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-size: medium; font-weight: bold;">&nbspPassword:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Empty Field" Font-Names="Bodoni MT" Font-Size="Small" ForeColor="#CC3300" ControlToValidate="logpass"></asp:RequiredFieldValidator>
            </h5>
            <asp:TextBox ID="logpass" runat="server" TextMode="Password" Width="100%"></asp:TextBox>
                <br />
                <br />
            <asp:Button ID="Button1" CssClass="btn btn-warning center-block" runat="server" Text="Submit" Font-Bold="True" BackColor="#FF6600" OnClick="Button1_Click" Width="116px" />
            <br/><br/>
                </div>
        </div>
    </form>
           </div>
        </div>
   
</body>
</html>
