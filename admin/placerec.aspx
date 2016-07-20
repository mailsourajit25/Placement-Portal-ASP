<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="placerec.aspx.cs" Inherits="admin_placerec" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 232px;
            padding: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <h2 style="text-align:center;font-weight:bold">Add Placement Record</h2>
    <hr />

    <table class="nav-justified" style="padding: 2px">
        <tr>
            <td class="auto-style1" style="text-align: right; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-weight: bold;">Name:</td>
            <td>
                <asp:TextBox ID="name" runat="server" Width="310px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="name" ErrorMessage="*Empty Field" ForeColor="#CC3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" style="text-align: right; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-weight: bold;">Course :</td>
            <td>
                <asp:DropDownList ID="course" runat="server">
                    <asp:ListItem>CSE</asp:ListItem>
                    <asp:ListItem>ME</asp:ListItem>
                    <asp:ListItem>IT</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" style="text-align: right; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-weight: bold;">Batch :</td>
            <td>
                <asp:DropDownList ID="batch" runat="server">
                    <asp:ListItem>2014</asp:ListItem>
                    <asp:ListItem>2013</asp:ListItem>
                    <asp:ListItem>2012</asp:ListItem>
                    <asp:ListItem>2011</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" style="text-align: right; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-weight: bold;">Company :</td>
            <td>
                <asp:TextBox ID="company" runat="server" Width="310px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="company" ErrorMessage="*Empty Field" ForeColor="#CC3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" style="text-align: right; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-weight: bold;">Email :</td>
            <td>
                <asp:TextBox ID="email" runat="server" Width="310px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="email" ErrorMessage="*Empty Field" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="* Invalid" ForeColor="#CC3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" style="text-align: right; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-weight: bold;">Mobile :</td>
            <td>
                <asp:TextBox ID="mobile" runat="server" Width="310px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="mobile" ErrorMessage="*Empty Field" ForeColor="#CC3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    
    <asp:Label ID="msg" style="text-align:center" runat="server" Width="100%" Font-Bold="True" ForeColor="#669900"></asp:Label>
    <br />
    <asp:Button ID="Button1" CssClass="btn btn-warning center-block" runat="server" Text="Add" Font-Bold="True" OnClick="Button1_Click" Width="89px"  />
   
    <br />
    
</asp:Content>

