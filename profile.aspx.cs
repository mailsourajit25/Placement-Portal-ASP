using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if ( Session["studentuser"]=="NotAvailable")
        {
            Response.Redirect("login.aspx");
        }
        
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("logout.aspx");
    }

    protected void change_Click(object sender, EventArgs e) {
        string cs=ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        string virtualFolder;
        string physicalFolder;
        string ext;
        string imgname;
        Label1.Text = "";
        try         
        {
            //LCase(Right(file.FileName, 3));
            virtualFolder = "~/students/";
            physicalFolder = Server.MapPath(virtualFolder);
            ext = Path.GetExtension(physicalFolder + FileUpload1.FileName);
            System.Guid guid = System.Guid.NewGuid();
            String iname = guid.ToString();
            imgname = iname + ext;
            FileUpload1.SaveAs(physicalFolder + imgname);
            deleteprevfile();
            //Label1.Text = "Your file " + FileUpload1.FileName + " has been uploaded.";   
            string email = Session["studentuser"].ToString();
            //Request.Cookies["StudentUser"].Value;
            SqlCommand cmd = new SqlCommand("update students SET image = ('" + imgname + "') where (Email='" + email + "')", con); 
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }             
            if (con.State == ConnectionState.Open)
            {
                int dr = cmd.ExecuteNonQuery();
                if (dr > 0)
                {
                    Response.Redirect("profile.aspx");
                    //Label1.ForeColor = System.Drawing.Color.Green;
                    //Label1.Text = "Time Table Successfully Updated";
                }
                else
                {
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "Some Error Occur";
                }
            }
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
        catch (Exception ex)
        {
            Label1.ForeColor = System.Drawing.Color.Red;
            Label1.Text = "Some Error Occured Try Again";
        }
    }
    private void deleteprevfile()
    {
        string cs = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("Select image from students where Email=@email", con);
            string em = Session["studentuser"].ToString();
            cmd.Parameters.AddWithValue("@email",em);
            con.Open();
            string filenm = cmd.ExecuteScalar().ToString();
            string strPhysicalFolder = Server.MapPath("~/students/");

            string strFileFullPath = strPhysicalFolder + filenm;

            if (System.IO.File.Exists(strFileFullPath))
            {
                System.IO.File.Delete(strFileFullPath);
            }
        }
    }
}