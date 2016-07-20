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
public partial class admin_filstu : System.Web.UI.Page
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



    protected void Button1_Click(object sender, EventArgs e)
    {
        string crse = course.SelectedValue;
        string yr = batch.SelectedValue;
        string ten = tenc.Text;
        string twelve = twec.Text;
        string grad = gradc.Text;
        Response.Redirect("filstu.aspx?course=" + crse + "&yr=" + yr + "&ten=" + ten + "&twe=" + twelve + "&grad=" + grad);
    }

    private DataTable getstu(string crse, string yr, string ten, string twelve, string grad)
    { 
        string cs=ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
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
        dt=getstu(crse, yr, ten, twelve, grad);
        if (dt.Rows.Count > 0)
        {
            stulist.DataSource = dt;
            stulist.DataBind();
        }
        else
        {
            stulist.DataSource = null;
            stulist.DataBind();
            status.Text = "No such record";
        }
        
    }


    protected void excelexport_click(object sender, EventArgs e)
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
            exporttoexcel(dt);
        }
        else
        {
            status.Text = "No Record is Available to Download";
        }

    }

    private void exporttoexcel(DataTable dt)
    {
        if (dt.Rows.Count > 0)
        {
            string filename = "student record.xls";
            System.IO.StringWriter tw = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter hw = new System.Web.UI.HtmlTextWriter(tw);
            DataGrid dg = new DataGrid();
            dg.DataSource = dt;
            dg.DataBind();
            dg.RenderControl(hw);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + filename + "");
            this.EnableViewState = false;
            Response.Write(tw.ToString());
            Response.End(); 
        }
    }
}