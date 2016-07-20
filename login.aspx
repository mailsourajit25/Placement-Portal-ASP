<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
           
            <div class="col-sm-offset-3 col-sm-6 col-sm-offset-3" style="border:1px solid black">
                <h4 style="padding-bottom:2px;text-align:center;border-bottom:solid 2px green;font-weight: bold; color: #990033; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;">&nbsp;Log In</h4>
                <h4 style="padding-bottom:2px;text-align:center;border-bottom:solid 2px green;font-weight: bold; color: #990033; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-size: small;">(Click for
                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" ForeColor="#99CC00" NavigateUrl="~/registration.aspx">* New User Registration</asp:HyperLink>
                    )</h4>            
            <h5 style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-size: medium; font-weight: bold;">&nbspEmail:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Empty Field" Font-Names="Bodoni MT" Font-Size="Small" ForeColor="#CC3300" ControlToValidate="logemail"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="logemail" ErrorMessage="* Invalid" Font-Names="Bodoni MT" ForeColor="#CC3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <asp:Label ID="error" runat="server" Font-Names="Bell MT" ForeColor="#CC3300"></asp:Label>
            </h5>
            <asp:TextBox ID="logemail" runat="server" TextMode="Email" Width="100%"></asp:TextBox>
            <br />
            <h5 style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-size: medium; font-weight: bold;">&nbspPassword:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Empty Field" Font-Names="Bodoni MT" Font-Size="Small" ForeColor="#CC3300" ControlToValidate="logpass"></asp:RequiredFieldValidator>
            </h5>
            <asp:TextBox ID="logpass" runat="server" TextMode="Password" Width="100%"></asp:TextBox>
                <br />
                <br />
            <asp:Button ID="Button1" CssClass="btn btn-warning center-block" runat="server" Text="Submit" Font-Bold="True" BackColor="#FF6600" OnClick="Button1_Click" Width="102px" />
                <br />
            <br/><br/>
                </div>
        </div>
</asp:Content>

