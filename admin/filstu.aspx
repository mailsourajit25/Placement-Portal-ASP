<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="filstu.aspx.cs" Inherits="admin_filstu" %>

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
    <h2 style="text-align:center;font-weight:bold">Filter Students</h2>
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


    <br />
    <br />
    <asp:GridView ID="stulist" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" Width="100%" AutoGenerateColumns="False">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" />
            <asp:BoundField DataField="Roll" HeaderText="Roll No." ReadOnly="True" />
            <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" />
        </Columns>
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <SortedAscendingCellStyle BackColor="#FAFAE7" />
        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
        <SortedDescendingCellStyle BackColor="#E1DB9C" />
        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
    </asp:GridView>


    <br />
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button2" CssClass="btn btn-info" OnClick="excelexport_click" runat="server" Text="Download Excel file" Font-Bold="True" />


&nbsp;
    <asp:Label ID="status" runat="server" ForeColor="#CC3300"></asp:Label>


</asp:Content>

