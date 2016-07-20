<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="newsletter.aspx.cs" Inherits="admin_newsletter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <h2 style="text-align:center;font-weight:bold">Newsletter</h2>
    <hr />
    <label for="message" style="color:black"><b>Type Newsletter :</b></label>
    <br />
   
        <asp:TextBox ID="message" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>
    <br />
    <asp:Button ID="Button1" CssClass="btn btn-info" runat="server" Text="Submit" OnClick="Button1_Click" Font-Bold="True" />
    &nbsp;<script>
        $('#textarea1').val('New Text');
        $('#textarea1').trigger('autoresize');
        </script><asp:Label ID="Label2" runat="server" Font-Bold="True"></asp:Label>
&nbsp;<asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#669900"></asp:Label>
    <br />
   
</asp:Content>

