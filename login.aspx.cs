using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["studentuser"] != "NotAvailable")
        {
            Response.Redirect("verify.aspx");
        } 
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string usname,pass,res;
        usname=logemail.Text;
        pass=logpass.Text;
        res=checkauth(usname,pass);
        Boolean cu=checkuser(usname);
        if (res!="Fail" && cu==true)
        {
            Session["studentuser"] = res;
            Response.Redirect("verify.aspx");
        }
        else if(cu==false)
            error.Text = "Username does not exist";
        else
        {
            error.Text = "Invalid Username or Password";
        }
    }
    private Boolean checkuser(String email)
    { 
        string cs = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            string com = "Select * from students where Email=@emailid";
            SqlCommand cmd = new SqlCommand(com, con);
            cmd.Parameters.AddWithValue("@emailid",email);
            con.Open();
            int num = Convert.ToInt32(cmd.ExecuteScalar());
            if (num == 0)
                return false;
            else
                return true; 
        }
    }
    public string checkauth(string email,string passw)
    {
       string cs = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
       using (SqlConnection con = new SqlConnection(cs))
       {
           string com = "Select Email,password from students where Email=@emailid and password=@pass";
           SqlCommand cmd = new SqlCommand(com, con);
           cmd.Parameters.AddWithValue("@emailid", email);
           cmd.Parameters.AddWithValue("@pass", passw);
           con.Open();
           SqlDataReader dr = cmd.ExecuteReader();
           DataTable dt=new DataTable();
           dt.Load(dr);
           int num = dt.Rows.Count;
           if (num > 0)
           {
               String user = dt.Rows[0]["Email"].ToString();
               return user;
           }
           else
               return "Fail";

       }
    }
}