using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_placerec : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminuser"] == "NotAvailable")
        {
            Response.Redirect("login.aspx");
        } 
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        msg.Text = "";
        string cs = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            string com = "insert into placements (Name,Course,Session,Company,Email,Mobile) values ('"+name.Text+"','"+
            course.SelectedValue+"','"+batch.SelectedValue+"','"+company.Text+"','"+email.Text+"','"+mobile.Text+"')";
            SqlCommand cmd = new SqlCommand(com,con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            msg.Text = "Successfully Added";
        }
    }
}