using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_PackageCategoryMainForm : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["travelzCnn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindListView();
        }
        if (Session["Username"] != null)
        {
            string Username = (string)Session["Username"];
        }
        else
        {
            Response.Redirect("login.aspx");
        }
    }

    public void BindListView()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM Package_Category_Main", con);
        SqlDataReader reader = cmd.ExecuteReader();
        ListView1.DataSource = reader;
        ListView1.DataBind();
        con.Close();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO Package_Category_Main (package_category_name,status, rts) VALUES ('" + txtpackage_category_name.Text + "','1',getdate())", con);
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        con.Close();
        clear();
        BindListView();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        con.Open();
        string Idd = hdnvalue.Value;
        SqlCommand cmd = new SqlCommand("Update Package_Category_Main Set package_category_name='" + txtpackage_category_name.Text + "', status='1' where package_category_id='" + Idd + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        BindListView();
        clear();
        btnUpdate.Visible = false;
        btnSubmit.Visible = true;
    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            Label lblid = (Label)e.Item.FindControl("lblid");
            Label lblpackage_category_name = (Label)e.Item.FindControl("lblpackage_category_name");
            Label lblstatus = (Label)e.Item.FindControl("lblstatus");

            hdnvalue.Value = lblid.Text;
            txtpackage_category_name.Text = lblpackage_category_name.Text;
            btnUpdate.Visible = true;
            btnSubmit.Visible = false;
            BindListView();
        }

        if (e.CommandName == "delete")
        {
            Label lblid = (Label)e.Item.FindControl("lblid");
            con.Open();
            SqlCommand cmd = new SqlCommand("Delete From Package_Category_Main Where package_category_id='" + lblid.Text + "'", con);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
            BindListView();
            clear();
        }

        if (e.CommandName == "Active")
        {
            Label lblid = (Label)e.Item.FindControl("lblid");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update Package_Category_Main Set status='1' where package_category_id='" + lblid.Text + "'", con);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
            BindListView();

        }
        if (e.CommandName == "Deactive")
        {
            Label lblid = (Label)e.Item.FindControl("lblid");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update Package_Category_Main Set status='0' where package_category_id='" + lblid.Text + "'", con);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
            BindListView();

        }
    }

    protected void ChangeStatus(object sender, EventArgs e)
    {

    }

    protected void ListView1_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }

    protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        clear();
        btnUpdate.Visible = false;
        btnSubmit.Visible = true;
    }

    protected void clear()
    {
        txtpackage_category_name.Text = "";
    }

    protected void lbtnStatus_Click(object sender, EventArgs e)
    {

    }

}