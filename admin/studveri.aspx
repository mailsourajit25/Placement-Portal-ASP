<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="studveri.aspx.cs" Inherits="admin_studveri" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
        <h2 style="text-align:center;font-weight:bold">Student Verification</h2>
    <hr />

<br />
<asp:GridView ID="GridView1" runat="server" CellPadding="2" ForeColor="Black" GridLines="None" AutoGenerateColumns="False" DataKeyNames="Sid" DataSourceID="SqlDataSource1" Width="100%" Font-Size="Large" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px">
    <AlternatingRowStyle BackColor="PaleGoldenrod" />
    <Columns>
        <asp:CommandField ShowEditButton="True" />
        <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
        <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" SortExpression="Email" />
        <asp:BoundField DataField="Course" HeaderText="Course" ReadOnly="True" SortExpression="Course" />
        <asp:BoundField DataField="Batch" HeaderText="Batch" ReadOnly="True" SortExpression="Batch" />
        <asp:BoundField DataField="Roll" HeaderText="Roll No." ReadOnly="True" SortExpression="Roll" />
        <asp:CheckBoxField DataField="EmailVerification" HeaderText="Email Verification" SortExpression="Email Verification" />
        <asp:CheckBoxField DataField="Verification" HeaderText="Student Verification" SortExpression="Verification" />
    </Columns>
    <FooterStyle BackColor="Tan" />
    <HeaderStyle BackColor="Tan" Font-Bold="True" />
    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
    <RowStyle Height="17px" />
    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
    <SortedAscendingCellStyle BackColor="#FAFAE7" />
    <SortedAscendingHeaderStyle BackColor="#DAC09E" />
    <SortedDescendingCellStyle BackColor="#E1DB9C" />
    <SortedDescendingHeaderStyle BackColor="#C2A47B" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>"
     DeleteCommand="DELETE FROM [students] WHERE [Sid] = @Sid"
     InsertCommand="INSERT INTO [students] ([Name], [Email], [Course], [Batch], [Roll], [EmailVerification], [Verification]) VALUES (@Name, @Email, @Course, @Batch, @Roll, @EmailVerification, @Verification)"
     SelectCommand="SELECT [Sid], [Name], [Email], [Course], [Batch], [Roll], [EmailVerification], [Verification] FROM [students]"
     UpdateCommand="UPDATE [students] SET  [EmailVerification] = @EmailVerification, [Verification] = @Verification WHERE [Sid] = @Sid">
    <DeleteParameters>
        <asp:Parameter Name="Sid" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="Course" Type="String" />
        <asp:Parameter Name="Batch" Type="String" />
        <asp:Parameter Name="Roll" Type="String" />
        <asp:Parameter Name="EmailVerification" Type="Boolean" />
        <asp:Parameter Name="Verification" Type="Boolean" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="Course" Type="String" />
        <asp:Parameter Name="Batch" Type="String" />
        <asp:Parameter Name="Roll" Type="String" />
        <asp:Parameter Name="EmailVerification" Type="Boolean" />
        <asp:Parameter Name="Verification" Type="Boolean" />
        <asp:Parameter Name="Sid" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>

</asp:Content>

