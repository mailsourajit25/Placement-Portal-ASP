using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string name = regname.Text;
        string email = regemail.Text;
        string mob = regmob.Text;
        string roll = regroll.Text;
        string pass = regpass.Text;
        string stream = Stream.SelectedValue;
        string batch = Batch.SelectedValue;
        Boolean chkroll = checkroll(roll);
        Boolean chkemail = checkemail(email);
        if (chkroll == false && chkemail == false)
        { 
            string cs = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string com = "Insert into students (Name,Email,mob,Roll,password,Course,Batch) values (@Name,@Email,@mob,@Roll,@password,@Course,@Batch)";
                SqlCommand cmd = new SqlCommand(com, con);
                cmd.Parameters.AddWithValue("@Name",name);
                cmd.Parameters.AddWithValue("@Email",email);
                cmd.Parameters.AddWithValue("@mob",mob);
                cmd.Parameters.AddWithValue("@Roll",roll);
                cmd.Parameters.AddWithValue("@password",pass);
                cmd.Parameters.AddWithValue("@Course",stream);
                cmd.Parameters.AddWithValue("@Batch",batch);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            lb.Visible = true;
            lnk.Visible = true;
        }
        else if (chkroll == true && chkemail == false)
        {
            error.Text = "* Roll number already exists ";
        }
        else if (chkroll == false && chkemail == true)
        {
            error.Text = "* Email already exists";
        }
        else
        {
            error.Text = "* Roll number and Email already exists";
        }  
    }

    private Boolean checkroll(string roll)
    {
        string cs = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            string com = "Select * from students where Roll=@roll";
            SqlCommand cmd = new SqlCommand(com, con);
            cmd.Parameters.AddWithValue("@roll",roll);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            int num = dt.Rows.Count;
            if (num == 0)
                return false;
            else
                return true;
        }
    }


    private Boolean checkemail(string email)
    {
        string cs = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            string com = "Select * from students where Email=@email";
            SqlCommand cmd = new SqlCommand(com, con);
            cmd.Parameters.AddWithValue("@email", email);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            int num = dt.Rows.Count;
            if (num == 0)
                return false;
            else
                return true;
        }
    }
   
}