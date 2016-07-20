using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Mail;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_newsletter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminuser"] == "NotAvailable")
        {
            Response.Redirect("login.aspx");
        } 
    
    }
    void mailsnd(string emailid)
    {
        string uname = "bhambhambolebole@gmail.com";
        string pass = "arkaroypc";
        string to = emailid.Trim();
        string subject = "Placement Portal Newletter";
        string body = message.Text;
        bool flag1;
        if (uname != "" && pass != "" && subject != "" && body != "" && to != "")
        {
            flag1 = SendEmail(uname, pass, to,subject, body, System.Web.Mail.MailFormat.Html, "");

            if (flag1)
            {
                Label2.ForeColor = System.Drawing.Color.Green;
                Label2.Text="Mail Sent Successfully";
            }
        }
        else
        {
            Label2.ForeColor = System.Drawing.Color.Red;
            Label2.Text="Please fill in the newsletter";
        }
    }

    public static bool SendEmail(string pGmailEmail, string pGmailPassword, string pTo, string pSubject, string pBody, MailFormat pFormat, string pAttachmentPath)
    {
        MailMessage myMail = new MailMessage();
        myMail.Fields.Add
            ("http://schemas.microsoft.com/cdo/configuration/smtpserver","smtp.gmail.com");
        myMail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserverport", "465");
        myMail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusing", "2");
        myMail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", "1"); //Use 0 for anonymous
        myMail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusername",pGmailEmail);
        myMail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendpassword",pGmailPassword);
        myMail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpusessl","true");
        myMail.Priority = MailPriority.High;
        myMail.From = pGmailEmail;
        myMail.To = pTo;
        myMail.Subject = pSubject;
        myMail.BodyFormat = pFormat;
        myMail.Body = pBody;
        if (pAttachmentPath.Trim() != "")
        {MailAttachment MyAttachment =new MailAttachment(pAttachmentPath);
           myMail.Attachments.Add(MyAttachment);
            myMail.Priority = MailPriority.High;
        }SmtpMail.SmtpServer = "smtp.gmail.com:465";
        System.Web.Mail.SmtpMail.Send(myMail);
        return true;
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        string cs = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            string com = "Select Email from students";
            SqlCommand cmd = new SqlCommand(com, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            string emailid;
            int i = 0;
            while (dr.Read())
            {
                emailid = dr[0].ToString();
                if (emailid == "")
                    continue;
                mailsnd(emailid);
                i++;
            }
            Label1.Text =i.ToString()+ "Subscribers";
        }
         
    }
}