using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class verify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["studentuser"] == "NotAvailable")
        {
            Response.Redirect("login.aspx");
        }
        string cs = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
        using (SqlConnection con=new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("Select * From students where EmailVerification='1' AND Verification='1' AND Email=@email",con);
            cmd.Parameters.AddWithValue("@email", Session["studentuser"].ToString());
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
                Response.Redirect("profile.aspx");
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("logout.aspx");
    }
}