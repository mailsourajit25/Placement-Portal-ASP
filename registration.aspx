<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="registration.aspx.cs" Inherits="registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-md-offset-3 col-md-6 col-md-offset-3" style="border:solid black 1px;">
            <h4 style="padding-bottom:2px;text-align:center;border-bottom:solid 2px green;font-weight: bold; color: #990033; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;">New Registration</h4>            
            <h5 style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-size: medium; font-weight: bold;">&nbspName:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* Empty Field" Font-Names="Bodoni MT" Font-Size="Small" ForeColor="#CC3300" ControlToValidate="regname"></asp:RequiredFieldValidator>
            &nbsp;
                <asp:Label ID="error" runat="server" Font-Size="Small" ForeColor="#CC3300"></asp:Label>
            </h5>
            <asp:TextBox ID="regname" runat="server" Width="100%"></asp:TextBox>
            <br />
            <h5 style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-size: medium; font-weight: bold;">&nbspEmail:<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="* Empty Field" Font-Names="Bodoni MT" Font-Size="Small" ForeColor="#CC3300" ControlToValidate="regemail"></asp:RequiredFieldValidator>
            </h5>
            <asp:TextBox ID="regemail" runat="server" TextMode="Email" Width="100%"></asp:TextBox>
            <h5 style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-size: medium; font-weight: bold;">&nbspMobile No.:<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="* Empty Field" Font-Names="Bodoni MT" Font-Size="Small" ForeColor="#CC3300" ControlToValidate="regmob"></asp:RequiredFieldValidator>
            </h5>
            <asp:TextBox ID="regmob" runat="server" TextMode="Number" Width="100%"></asp:TextBox>
            <h5 style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-size: medium; font-weight: bold;">&nbspRoll No.:<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="* Empty Field" Font-Names="Bodoni MT" Font-Size="Small" ForeColor="#CC3300" ControlToValidate="regroll"></asp:RequiredFieldValidator>
            </h5>
            <asp:TextBox ID="regroll" runat="server" Width="100%"></asp:TextBox>
            <h5 style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-size: medium; font-weight: bold;">&nbspPassword:<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="* Empty Field" Font-Names="Bodoni MT" Font-Size="Small" ForeColor="#CC3300" ControlToValidate="regpass"></asp:RequiredFieldValidator>
            </h5>
            <asp:TextBox ID="regpass" runat="server" TextMode="Password" Width="100%"></asp:TextBox>
            <h5 style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-size: medium; font-weight: bold;">&nbspRe-type Password:<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="* Empty Field" Font-Names="Bodoni MT" Font-Size="Small" ForeColor="#CC3300" ControlToValidate="regrepass"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="regpass" ControlToValidate="regrepass" ErrorMessage="* Both the passwords should be same" Font-Names="Bodoni MT" ForeColor="#CC3300"></asp:CompareValidator>
            </h5>
            <asp:TextBox ID="regrepass" runat="server" TextMode="Password" Width="100%"></asp:TextBox>
            <h5 style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-size: medium; font-weight: bold;">&nbspStream :
                <asp:DropDownList ID="Stream" runat="server">
                    <asp:ListItem>CSE</asp:ListItem>
                    <asp:ListItem>ME</asp:ListItem>
                    <asp:ListItem>IT</asp:ListItem>
                </asp:DropDownList>
            </h5>
            <h5 style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-size: medium; font-weight: bold;">&nbspBatch(Final year) :
                <asp:DropDownList ID="Batch" runat="server">
                    <asp:ListItem>2014</asp:ListItem>
                    <asp:ListItem>2013</asp:ListItem>
                    <asp:ListItem>2012</asp:ListItem>
                    <asp:ListItem>2011</asp:ListItem>
                </asp:DropDownList>
            </h5>
            <asp:Button ID="Button2" CssClass="btn btn-warning btn-block" runat="server" Text="Register" Font-Bold="True" BackColor="#FF6600" OnClick="Button2_Click" />
            <br/>
            <asp:Label ID="lb" Visible="false" runat="server" Text="Label" ForeColor="#99CC00">
               <b>Registered Successfully.Go to </b>
             </asp:Label><b><asp:HyperLink ID="lnk" Visible="false" NavigateUrl="~/login.aspx" runat="server">Login</asp:HyperLink>
            <br />
            <br />
            </b>
         </div>    
    </div>
</asp:Content>

