<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <h1 style="text-align:center;border-bottom:solid 2px green; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-weight: bold; color: #990033;">Contact Us</h1>
    <div class="row">
        <div class="col-sm-5" >
            <h3>Kolkata Institute of Technology [KIT]</h3>
            <h6>Address: West Bengal,India</h6>
            <h6>Phone Number:(033)2658 1111</h6>
            <h6>Email:placement@kit.com </h6>
            
        </div>

        <div class="col-md-5 col-md-offset-2"  >
            <asp:Image ID="Image1" ImageUrl="~/images/images.jpg" CssClass="responsive-img" runat="server" />
        </div>

    </div>

</asp:Content>

