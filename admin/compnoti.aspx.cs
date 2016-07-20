using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Mail;

public partial class admin_compnoti : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminuser"] == "NotAvailable")
        {
            Response.Redirect("login.aspx");
        } 
        if (!IsPostBack)
        {
            string crse = "CSE";
            if (Request.QueryString["course"] != "" && Request.QueryString["course"] != null)
            {
                crse = Request.QueryString["course"];
            }
            string yr = "2014";
            if (Request.QueryString["yr"] != "" && Request.QueryString["yr"] != null)
            {
                yr = Request.QueryString["yr"];
            }
            string ten = "0";
            if (Request.QueryString["ten"] != "" && Request.QueryString["ten"] != null)
            {
                ten = Request.QueryString["ten"];
            }
            string twelve = "0";
            if (Request.QueryString["twe"] != "" && Request.QueryString["twe"] != null)
            {
                twelve = Request.QueryString["twe"];
            }
            string grad = "0";
            if (Request.QueryString["grad"] != "" && Request.QueryString["grad"] != null)
            {
                grad = Request.QueryString["grad"];
            }

            course.SelectedValue = crse;
            batch.SelectedValue = yr;
            tenc.Text = ten;
            twec.Text = twelve;
            gradc.Text = grad;
            binddata(crse, yr, ten, twelve, grad);
        }
    }

    private DataTable getstu(string crse, string yr, string ten, string twelve, string grad)
    {
        string cs = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        string com = "select Name,Roll,Email From students where Course='" + crse + "' AND Batch= '" + yr + "' AND tnper>='" + ten + "' AND twper>='" +
                twelve + "' AND grper>='" + grad + "' ORDER by sid DESC";
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand(com, con);
        try
        {

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            dt.Load(dr);

        }
        catch (Exception e)
        {
            status.Text = e.Message;
        }
        finally
        {
            con.Close();
        }
        return dt;
    }

    private void binddata(string crse, string yr, string ten, string twelve, string grad)
    {
        DataTable dt = new DataTable();
        dt = getstu(crse, yr, ten, twelve, grad);
        if (dt.Rows.Count > 0)
        {
            status.Text = dt.Rows.Count+" students found";
        }
        else
        {
            status.Text = "No records Found";
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string crse = course.SelectedValue;
        string yr = batch.SelectedValue;
        string ten = tenc.Text;
        string twelve = twec.Text;
        string grad = gradc.Text;
        Response.Redirect("compnoti.aspx?course=" + crse + "&yr=" + yr + "&ten=" + ten + "&twe=" + twelve + "&grad=" + grad);
    }

    //Mail Send Code
    void mailsnd(string emailid)
    {
        string uname = "bhambhambolebole@gmail.com";
        string pass = "arkaroypc";
        string to = emailid.Trim();
        string subject = "Placement Portal Newletter";
        string body = message.Text;
        bool flag1;
        if (uname!="" && pass!="" && subject!="" && body!="" && to!="")
        {
            flag1 = SendEmail(uname, pass, to, subject, body, System.Web.Mail.MailFormat.Html, "");

            if (flag1)
            {
               Label2.ForeColor = System.Drawing.Color.Green;
                Label2.Text ="Mail Sent Successfully";
            }
        }
        else
        {
            Label2.ForeColor = System.Drawing.Color.Red;
            Label2.Text = "Fill in the newsletter";
        }
    }

    public static bool SendEmail(string pGmailEmail, string pGmailPassword, string pTo, string pSubject, string pBody, MailFormat pFormat, string pAttachmentPath)
    {
        MailMessage myMail = new MailMessage();
        myMail.Fields.Add
            ("http://schemas.microsoft.com/cdo/configuration/smtpserver", "smtp.gmail.com");
        myMail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserverport", "465");
        myMail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusing", "2");
        myMail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", "1"); //Use 0 for anonymous
        myMail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusername", pGmailEmail);
        myMail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendpassword", pGmailPassword);
        myMail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpusessl", "true");
        myMail.Priority = MailPriority.High;
        myMail.From = pGmailEmail;
        myMail.To = pTo;
        myMail.Subject = pSubject;
        myMail.BodyFormat = pFormat;
        myMail.Body = pBody;
        if (pAttachmentPath.Trim() != "")
        {
            MailAttachment MyAttachment = new MailAttachment(pAttachmentPath);
            myMail.Attachments.Add(MyAttachment);
            myMail.Priority = MailPriority.High;
        } SmtpMail.SmtpServer = "smtp.gmail.com:465";
        System.Web.Mail.SmtpMail.Send(myMail);
        return true;
    }

    protected void send_Click(object sender, EventArgs e)
    {
        string crse = course.SelectedValue;
        string yr = batch.SelectedValue;
        string ten = tenc.Text;
        string twelve = twec.Text;
        string grad = gradc.Text;
        DataTable dt = new DataTable();
        dt = getstu(crse, yr, ten, twelve, grad);
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)//datatable iteration
            {
                mailsnd(row["Email"].ToString());
            }
        }
        else
        {
            status.Text = "No Record is Available to be sent";
        }
    }
}