<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="compnoti.aspx.cs" Inherits="admin_compnoti" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 102px;
        }
    .auto-style4 {
        width: 154px
    }
    .auto-style5 {
        width: 116px
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <h2 style="text-align:center;font-weight:bold">Company Notification</h2>
    <p style="text-align:center;font-weight:bold; color: #808080;">(For Selected Students)</p>
    <hr />


    <table class="nav-justified">
        <tr>
            <td class="auto-style1" style="font-weight: bold">Select Batch :</td>
            <td class="auto-style4">
                <asp:DropDownList ID="batch" runat="server">
                    <asp:ListItem>2014</asp:ListItem>
                    <asp:ListItem>2013</asp:ListItem>
                    <asp:ListItem>2012</asp:ListItem>
                    <asp:ListItem>2011</asp:ListItem>
                    <asp:ListItem>2010</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style5" style="font-weight: bold">Select Stream :</td>
            <td>
                <asp:DropDownList ID="course" runat="server">
                    <asp:ListItem>CSE</asp:ListItem>
                    <asp:ListItem>ME</asp:ListItem>
                    <asp:ListItem>IT</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
    </table>


    <br />
    
    <b>Set Criteria</b> (Enter 0 if no criteria)<b> :<br />
    </b>
    <table class="nav-justified">
        <tr>
            <td style="font-weight: bold">10th&nbsp;
                <asp:TextBox ID="tenc" runat="server"></asp:TextBox>
            </td>
            <td style="font-weight: bold">12th&nbsp;
                <asp:TextBox ID="twec" runat="server"></asp:TextBox>
            </td>
            <td style="font-weight: bold">Graduation&nbsp;
                <asp:TextBox ID="gradc" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
    <br />
    
    <br />
    <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" Text="Submit" Font-Bold="True" OnClick="Button1_Click" />


&nbsp;
    <asp:Label ID="status" runat="server" ForeColor="#FF9933" Font-Bold="True"></asp:Label>


    <br />
    <br />
    <b>&nbsp;&nbsp;&nbsp; Type NewsLetter:</b>


    <br />
    <asp:TextBox ID="message" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>
    <br />
    <br />
&nbsp;<asp:Button ID="send" runat="server" CssClass="btn btn-info" Font-Bold="True" OnClick="send_Click" Text="Send" />
&nbsp;
    <asp:Label ID="Label2" runat="server" Font-Bold="True"></asp:Label>


</asp:Content>


