<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        h4 
        {
            color:darkorange;
        }
        
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2 style="text-align:center;font-weight:bold">Profile</h2>
    <hr />
    <asp:Button ID="Button1" CssClass="btn btn-warning"  runat="server" Text="Logout" Font-Bold="True" OnClick="Button1_Click" />
    <hr />
    <h4 style="text-align:left;font-weight:bold">Basic Information</h4>
    <hr />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="Sid" DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            <asp:Image ID="image" Style="float: left; padding-right: 20px; width: 200px;" runat="server" ImageUrl='<%# Eval("image", "students/{0}") %>' AlternateText="No Image Available" /> 
            <b>Name:</b>
            <asp:TextBox Text='<%# Bind("Name") %>' runat="server" ID="NameTextBox" /><br />
            <b>Course:</b>
            <asp:TextBox Text='<%# Bind("Course") %>' runat="server" ID="CourseTextBox" /><br />
            <b>Batch:</b>
            <asp:TextBox Text='<%# Bind("Batch") %>' runat="server" ID="BatchTextBox" /><br />
            <b>Place:</b>
            <asp:TextBox Text='<%# Bind("place") %>' runat="server" ID="placeTextBox" /><br />
            <b>Mother's Name:</b>
            <asp:TextBox Text='<%# Bind("mname") %>' runat="server" ID="mnameTextBox" /><br />
            <b>Father's Name:</b>
            <asp:TextBox Text='<%# Bind("fname") %>' runat="server" ID="fnameTextBox" /><br />
            
            <br />
            <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
        </EditItemTemplate>
        <ItemTemplate>
           <asp:Image ID="image" Style="float: left; padding-right: 20px; width: 200px;" runat="server"      ImageUrl='<%# Eval("image", "students/{0}") %>' AlternateText="No Image Available" />  
            <b>Name:</b>
            <asp:Label Text='<%# Bind("Name") %>' runat="server" ID="NameLabel" /><br />
            <b>Course:</b>
            <asp:Label Text='<%# Bind("Course") %>' runat="server" ID="CourseLabel" /><br />
            <b>Batch:</b>
            <asp:Label Text='<%# Bind("Batch") %>' runat="server" ID="BatchLabel" /><br />
            <b>Place:</b>
            <asp:Label Text='<%# Bind("place") %>' runat="server" ID="placeLabel" /><br />
            <b>Mother's Name:</b>
            <asp:Label Text='<%# Bind("mname") %>' runat="server" ID="mnameLabel" /><br />
            <b>Father's Name:</b>
            <asp:Label Text='<%# Bind("fname") %>' runat="server" ID="fnameLabel" /><br />
            <br />
            <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:DB %>'
         DeleteCommand="DELETE FROM [students] WHERE [Sid] = @Sid"
         InsertCommand="INSERT INTO [students] ([Name], [Course], [Batch], [place], [mname], [fname], [image]) VALUES (@Name, @Course, @Batch, @place, @mname, @fname, @image)"
         SelectCommand="SELECT [Sid], [Name], [Course], [Batch], [place], [mname], [fname], [image] FROM [students] where [Email] = @email" UpdateCommand="UPDATE [students] SET [Name] = @Name, [Course] = @Course, [Batch] = @Batch, [place] = @place, [mname] = @mname, [fname] = @fname WHERE [Sid] = @Sid">
        <SelectParameters>
				<asp:SessionParameter SessionField="studentuser" Name="email" Type="String" />
		</SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="Sid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Course" Type="String" />
            <asp:Parameter Name="Batch" Type="String" />
            <asp:Parameter Name="place" Type="String" />
            <asp:Parameter Name="mname" Type="String" />
            <asp:Parameter Name="fname" Type="String" />
            <asp:Parameter Name="image" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="Course" Type="String"></asp:Parameter>
            <asp:Parameter Name="Batch" Type="String"></asp:Parameter>
            <asp:Parameter Name="place" Type="String"></asp:Parameter>
            <asp:Parameter Name="mname" Type="String"></asp:Parameter>
            <asp:Parameter Name="fname" Type="String"></asp:Parameter>
            <asp:Parameter Name="image" Type="String" />
            <asp:Parameter Name="Sid" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:FileUpload ID="FileUpload1" runat="server" BackColor="White" ForeColor="Black" />
    <br>
    <asp:LinkButton ID="LinkButton1"  style="margin-left:15px;" runat="server" CausesValidation="True" ValidationGroup="profile"    OnClick="change_Click" Text="Change Image" Font-Bold="True" ForeColor="White" CssClass="btn btn-info" /> 
      &nbsp;
       <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="FileUpload1"    ErrorMessage="*" ForeColor="Red" ValidationGroup="profile"></asp:RequiredFieldValidator> &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="! Invalid Image Type"    ValidationExpression="^.*\.((j|J)(p|P)(e|E)?(g|G)|(g|G)(i|I)(f|F)|(p|P)(n|N)(g|G))$"    ControlToValidate="FileUpload1" ForeColor="Red" ValidationGroup="profile">
       </asp:RegularExpressionValidator>
    &nbsp;<br />
    <br />
    <asp:Label ID="Label1" runat="server" style="margin-left:15px;" Text=""></asp:Label>
    
    <h4 style="text-align:left;font-weight:bold">Educational Qualification</h4>
    <hr />
    <asp:FormView ID="FormView2" runat="server" DataKeyNames="Sid" DataSourceID="SqlDataSource2">
        <EditItemTemplate>
            <table>
						<tr>
							<th></th>
							<th>Stream
							</th>
							<th>Passout Year
							</th>
							<th>Board/University
							</th>
							<th>Aggregate Percentage
							</th>
						</tr>
						<tr>
							<th>10th</th>
							<td>
								<asp:DropDownList ID="DropDownList2" runat="server" Width="100px" SelectedValue='<%# Bind("tnstream") %>'>
									<asp:ListItem Text="Select" Value="">
									</asp:ListItem>
									<asp:ListItem Text="English" Value="English"></asp:ListItem>
									<asp:ListItem Text="Hindi" Value="Hindi"></asp:ListItem>
								</asp:DropDownList>
							</td>
							<td>
								<asp:TextBox ID="tnpassTextBox" runat="server" Text='<%# Bind("tnpass") %>' />
							</td>
							<td>
								<asp:TextBox ID="tnschTextBox" runat="server" Text='<%# Bind("tnsch") %>' />
							</td>
							<td>
								<asp:TextBox ID="tnperTextBox" runat="server" Text='<%# Bind("tnper") %>' />
							</td>
						</tr>
						<tr>
							<th>12th</th>
							<td>
								<asp:DropDownList ID="DropDownList3" runat="server" Width="100px" SelectedValue='<%# Bind("twstream") %>'>
									<asp:ListItem Text="Select" Value="">
									</asp:ListItem>
									<asp:ListItem Text="Science" Value="Science"></asp:ListItem>
									<asp:ListItem Text="Commerce" Value="Commerce"></asp:ListItem>
									<asp:ListItem Text="Arts" Value="Arts"></asp:ListItem>
								</asp:DropDownList></td>
							<td>
								<asp:TextBox ID="twpassTextBox" runat="server" Text='<%# Bind("twpass") %>' /></td>

							<td>
								<asp:TextBox ID="twschTextBox" runat="server" Text='<%# Bind("twsch") %>' /></td>
							<td>
								<asp:TextBox ID="twperTextBox" runat="server" Text='<%# Bind("twper") %>' /></td>
						</tr>
						<tr>
							<th>Graduation</th>
							<td>
								<asp:DropDownList ID="DropDownList4" runat="server" Width="100px" SelectedValue='<%# Bind("grstream") %>'>
									<asp:ListItem Text="Select" Value="">
									</asp:ListItem>
									<asp:ListItem Text="CSE" Value="CSE"></asp:ListItem>
									<asp:ListItem Text="ME" Value="ME"></asp:ListItem>
									<asp:ListItem Text="IT" Value="IT"></asp:ListItem>
								</asp:DropDownList></td>
							<td>
								<asp:TextBox ID="grpassTextBox" runat="server" Text='<%# Bind("grpass") %>' /></td>
                            <td></td>
							<td>
								<asp:TextBox ID="grperTextBox" runat="server" Text='<%# Bind("grper") %>' /></td>
						</tr>
                </table>
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <ItemTemplate>
           <table>
						<tr>
							<th></th>
							<th>Stream
							</th>
							<th>Passout Year
							</th>
							<th>Board/University
							</th>
							<th>Aggregate Percentage
							</th>
						</tr>
						<tr>
							<th>10th</th>
							<td>
								<asp:DropDownList ID="DropDownList2" runat="server" Width="100px" SelectedValue='<%# Bind("tnstream") %>'>
									<asp:ListItem Text="Select" Value="">
									</asp:ListItem>
									<asp:ListItem Text="English" Value="English"></asp:ListItem>
									<asp:ListItem Text="Hindi" Value="Hindi"></asp:ListItem>
								</asp:DropDownList>
							</td>
							<td>
								<asp:TextBox ID="tnpassTextBox" runat="server" Text='<%# Bind("tnpass") %>' />
							</td>
							<td>
								<asp:TextBox ID="tnschTextBox" runat="server" Text='<%# Bind("tnsch") %>' />
							</td>
							<td>
								<asp:TextBox ID="tnperTextBox" runat="server" Text='<%# Bind("tnper") %>' />
							</td>
						</tr>
						<tr>
							<th>12th</th>
							<td>
								<asp:DropDownList ID="DropDownList3" runat="server" Width="100px" SelectedValue='<%# Bind("twstream") %>'>
									<asp:ListItem Text="Select" Value="">
									</asp:ListItem>
									<asp:ListItem Text="Science" Value="Science"></asp:ListItem>
									<asp:ListItem Text="Commerce" Value="Commerce"></asp:ListItem>
									<asp:ListItem Text="Arts" Value="Arts"></asp:ListItem>
								</asp:DropDownList></td>
							<td>
								<asp:TextBox ID="twpassTextBox" runat="server" Text='<%# Bind("twpass") %>' /></td>

							<td>
								<asp:TextBox ID="twschTextBox" runat="server" Text='<%# Bind("twsch") %>' /></td>
							<td>
								<asp:TextBox ID="twperTextBox" runat="server" Text='<%# Bind("twper") %>' /></td>
						</tr>
						<tr>
							<th>Graduation</th>
							<td>
								<asp:DropDownList ID="DropDownList4" runat="server" Width="100px" SelectedValue='<%# Bind("grstream") %>'>
									<asp:ListItem Text="Select" Value="">
									</asp:ListItem>
									<asp:ListItem Text="CSE" Value="CSE"></asp:ListItem>
									<asp:ListItem Text="ME" Value="ME"></asp:ListItem>
									<asp:ListItem Text="IT" Value="IT"></asp:ListItem>
								</asp:DropDownList></td>
							<td>
								<asp:TextBox ID="grpassTextBox" runat="server" Text='<%# Bind("grpass") %>' /></td>
                            <td></td>
							<td>
								<asp:TextBox ID="grperTextBox" runat="server" Text='<%# Bind("grper") %>' /></td>
						</tr>
                </table>
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" 
        DeleteCommand="DELETE FROM [students] WHERE [Sid] = @Sid" 
        InsertCommand="INSERT INTO [students] ([tnstream], [tnpass], [tnsch], [tnper], [twstream], [twpass], [twsch], [twper], [grstream], [grpass], [grper]) VALUES (@tnstream, @tnpass, @tnsch, @tnper, @twstream, @twpass, @twsch, @twper, @grstream, @grpass, @grper)"
        SelectCommand="SELECT [Sid], [tnstream], [tnpass], [tnsch], [tnper], [twstream], [twpass], [twsch], [twper], [grstream], [grpass], [grper] FROM [students] where [Email] = @email" 
        UpdateCommand="UPDATE [students] SET [tnstream] = @tnstream, [tnpass] = @tnpass, [tnsch] = @tnsch, [tnper] = @tnper, [twstream] = @twstream, [twpass] = @twpass, [twsch] = @twsch, [twper] = @twper, [grstream] = @grstream, [grpass] = @grpass, [grper] = @grper WHERE [Sid] = @Sid">
       <SelectParameters>
					<asp:SessionParameter SessionField="studentuser" Name="email" Type="String" />
				</SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="tnstream" Type="String" />
            <asp:Parameter Name="tnpass" Type="String" />
            <asp:Parameter Name="tnsch" Type="String" />
            <asp:Parameter Name="tnper" Type="Int32" />
            <asp:Parameter Name="twstream" Type="String" />
            <asp:Parameter Name="twpass" Type="Int32" />
            <asp:Parameter Name="twsch" Type="String" />
            <asp:Parameter Name="twper" Type="String" />
            <asp:Parameter Name="grstream" Type="String" />
            <asp:Parameter Name="grpass" Type="String" />
            <asp:Parameter Name="grper" Type="Int32" />
            <asp:Parameter Name="Sid" Type="Int32" />
        </UpdateParameters>
        
    </asp:SqlDataSource>
    <h4 style="text-align:left;font-weight:bold">&nbsp;</h4>
    <h4 style="text-align:left;font-weight:bold">Technical Skills</h4>
    <hr />
    <asp:FormView ID="FormView3" runat="server" DataKeyNames="Sid" DataSourceID="SqlDataSource3">
        <EditItemTemplate>
            <table>
						<tr>
							<td>
								<b>Programming<br />
									Languages</b>
							</td>
							<td>:
									<asp:TextBox ID="progTextBox" TextMode="MultiLine" runat="server" Text='<%# Bind("prog") %>' />
							</td>
						</tr>
						<tr>
							<td>
								<b>Training<br />
									(If any)</b>
							</td>
							<td>:
									<asp:TextBox ID="trainingTextBox" TextMode="MultiLine" runat="server" Text='<%# Bind("training") %>' />
							</td>
						</tr>
                </table>
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <ItemTemplate>
            <table>
						<tr>
							<td>
								<b>Programming<br />
									Languages</b>
							</td>
							<td>:
									<asp:TextBox ID="progTextBox" TextMode="MultiLine" runat="server" Text='<%# Bind("prog") %>' />
							</td>
						</tr>
						<tr>
							<td>
								<b>Training<br />
									(If any)</b>
							</td>
							<td>:
									<asp:TextBox ID="trainingTextBox" TextMode="MultiLine" runat="server" Text='<%# Bind("training") %>' />
							</td>
						</tr>
                </table>
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>"
         DeleteCommand="DELETE FROM [students] WHERE [Sid] = @Sid"
         InsertCommand="INSERT INTO [students] ([training], [prog]) VALUES (@training, @prog)" 
        SelectCommand="SELECT [Sid], [training], [prog] FROM [students] where [Email] = @email"
         UpdateCommand="UPDATE [students] SET [training] = @training, [prog] = @prog WHERE [Sid] = @Sid">       
        <SelectParameters>
		    <asp:SessionParameter SessionField="studentuser" Name="email" Type="String" />
		</SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="training" Type="String" />
            <asp:Parameter Name="prog" Type="String" />
            <asp:Parameter Name="Sid" Type="Int32" />
        </UpdateParameters>
        
    </asp:SqlDataSource>
    <h4 style="text-align:left;font-weight:bold">Technical Achievements</h4>
    <hr />
    <asp:FormView ID="FormView5" runat="server" DataKeyNames="Sid" DataSourceID="SqlDataSource5">
        <EditItemTemplate>
            <b>Achievement:</b>
            <asp:TextBox Text='<%# Bind("achievement") %>' runat="server" ID="achievementTextBox" TextMode="MultiLine" /><br />
            <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
        </EditItemTemplate>
        <ItemTemplate>
            <b>Achievement:</b>
            <asp:Label Text='<%# Bind("achievement") %>' runat="server" ID="achievementLabel" /><br />
            <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" />
        </ItemTemplate>
    </asp:FormView>

    <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:DB %>' 
        DeleteCommand="DELETE FROM [students] WHERE [Sid] = @Sid" 
        InsertCommand="INSERT INTO [students] ([achievement]) VALUES (@achievement)" 
        SelectCommand="SELECT [achievement], [Sid] FROM [students] where [Email]=@email"
         UpdateCommand="UPDATE [students] SET [achievement] = @achievement WHERE [Sid] = @Sid">
        <SelectParameters>
                <asp:SessionParameter SessionField="studentuser" Name="email" Type="String" />
           </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="achievement" Type="String"></asp:Parameter>
            <asp:Parameter Name="Sid" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

    <h4 style="text-align:left;font-weight:bold">Contact Information</h4>
    <hr />
    <asp:FormView ID="FormView4" runat="server" DataKeyNames="Sid" DataSourceID="SqlDataSource4">
        <EditItemTemplate>
            <b>Name:</b>
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
            <br />
            <b>Email:</b>
            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
            <br />
            <b>Place:</b>
            <asp:TextBox ID="placeTextBox" runat="server" Text='<%# Bind("place") %>' />
            <br />
            <b>Address:</b>
            <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
            <br />
            <b>Alternate Email:</b>
            <asp:TextBox ID="aemailTextBox" runat="server" Text='<%# Bind("aemail") %>' />
            <br />
            <b>Phone Number:</b>
            <asp:TextBox ID="phTextBox" runat="server" Text='<%# Bind("ph") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <ItemTemplate>
            <b>Name:</b>
            <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
            <br />
            <b>Email:</b>
            <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
            <br />
            <b>Place:</b>
            <asp:Label ID="placeLabel" runat="server" Text='<%# Bind("place") %>' />
            <br />
            <b>Address:</b>
            <asp:Label ID="addressLabel" runat="server" Text='<%# Bind("address") %>' />
            <br />
            <b>Alternate Email:</b>
            <asp:Label ID="aemailLabel" runat="server" Text='<%# Bind("aemail") %>' />
            <br />
            <b>Phone Number:</b>
            <asp:Label ID="phLabel" runat="server" Text='<%# Bind("ph") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DB %>" 
        DeleteCommand="DELETE FROM [students] WHERE [Sid] = @Sid"
         InsertCommand="INSERT INTO [students] ([Name], [Email], [place], [address], [aemail], [ph]) VALUES (@Name, @Email, @place, @address, @aemail, @ph)"
         SelectCommand="SELECT [Name], [Email], [place], [address], [aemail], [ph], [Sid] FROM [students] where [Email] = @email"
         UpdateCommand="UPDATE [students] SET [Name] = @Name, [Email] = @Email, [place] = @place, [address] = @address, [aemail] = @aemail, [ph] = @ph WHERE [Sid] = @Sid">
       <SelectParameters>
					<asp:SessionParameter SessionField="studentuser" Name="email" Type="String" />
				</SelectParameters> 
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="place" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="aemail" Type="String" />
            <asp:Parameter Name="ph" Type="String" />
            <asp:Parameter Name="Sid" Type="Int32" />
        </UpdateParameters>
        
    </asp:SqlDataSource>

    <br />
</asp:Content>

