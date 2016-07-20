<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="verify.aspx.cs" Inherits="verify" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3 style="color: #CC3300; font-weight: bold; margin-left: 40px;">&nbsp;</h3>
    <h3 style="color: #CC3300; font-weight: bold; margin-left: 40px;">Your Email is not yet Verified</h3>
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" CssClass="btn btn-warning" runat="server" Text="Logout" Font-Bold="True" OnClick="Button1_Click" />
    <br />
</asp:Content>

