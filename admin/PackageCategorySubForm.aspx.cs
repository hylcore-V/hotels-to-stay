using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class admin_PackageCategorySubForm : System.Web.UI.Page
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
        SqlCommand cmd = new SqlCommand("SELECT * FROM Packages_Category_Sub", con);
        SqlDataReader reader = cmd.ExecuteReader();
        ListView1.DataSource = reader;
        ListView1.DataBind();
        con.Close();

        SqlDataAdapter sda = new SqlDataAdapter(new SqlCommand("Select Id, place from place_table where status = 1", con));
        DataTable dt = new DataTable();
        sda.Fill(dt);
        ddl_selectplace.DataSource = dt;
        ddl_selectplace.DataBind();

        SqlDataAdapter sda2 = new SqlDataAdapter(new SqlCommand("Select * from Package_Category_Main where status = 1", con));
        DataTable dt2 = new DataTable();
        sda2.Fill(dt2);
        ddl_select_package_category.DataSource = dt2;
        ddl_select_package_category.DataBind();
    }


    protected void ddl_selectplace_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO Packages_Category_Sub (package_category_id, package_category_name, package_place_id, package_place_name, packageDuration, packageAvailableTickets, packageStartDate, packageEndDate, packageInclusions, package_price, status, rts) VALUES ('" + ddl_select_package_category.SelectedValue + "','" + ddl_select_package_category.SelectedItem + "','" + ddl_selectplace.SelectedValue + "','" + ddl_selectplace.SelectedItem + "','" + txtpackageDuration.Text + "','" + txtpackageAvailableTickets.Text + "','" + txtpackageStartDate.Text + "','" + txtpackageEndDate.Text + "','" + txtpackageInclusions.Text + "','" + txtpackage_price.Text + "','1',getdate())", con);
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
        SqlCommand cmd = new SqlCommand("Update Packages_Category_Sub Set package_category_id='" + ddl_select_package_category.SelectedValue + "',package_category_name='" + ddl_select_package_category.SelectedItem + "', package_place_id='" + ddl_selectplace.SelectedValue + "',package_place_name='" + ddl_selectplace.SelectedItem + "',packageDuration='" + txtpackageDuration.Text + "',packageAvailableTickets='" + txtpackageAvailableTickets.Text + "', packageStartDate='" + txtpackageStartDate.Text + "', packageEndDate='" + txtpackageEndDate.Text + "',package_price='" + txtpackage_price.Text + "',packageInclusions='" + txtpackageInclusions.Text + "', status='1' where id='" + Idd + "'", con);
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
            Label lblpackage_category_id = (Label)e.Item.FindControl("lblpackage_category_id");
            Label lblpackage_category_name = (Label)e.Item.FindControl("lblpackage_category_name");
            Label lblpackage_place_id = (Label)e.Item.FindControl("lblpackage_place_id");
            Label lblpackage_place_name = (Label)e.Item.FindControl("lblpackage_place_name");
            Label lblpackageDuration = (Label)e.Item.FindControl("lblpackageDuration");
            Label lblpackageAvailableTickets = (Label)e.Item.FindControl("lblpackageAvailableTickets");
            Label lblpackageStartDate = (Label)e.Item.FindControl("lblpackageStartDate");
            Label lblpackageEndDate = (Label)e.Item.FindControl("lblpackageEndDate");
            Label lblpackage_price = (Label)e.Item.FindControl("lblpackage_price");
            Label lblpackageInclusions = (Label)e.Item.FindControl("lblpackageInclusions");
            Label lblstatus = (Label)e.Item.FindControl("lblstatus");

            hdnvalue.Value = lblid.Text;
            ddl_select_package_category.SelectedValue = lblpackage_category_id.Text;
            ddl_select_package_category.SelectedItem.Text = lblpackage_category_name.Text;
            ddl_selectplace.SelectedValue = lblpackage_place_id.Text;
            ddl_selectplace.SelectedItem.Text = lblpackage_place_name.Text;
            txtpackageDuration.Text = lblpackageDuration.Text;
            txtpackageAvailableTickets.Text = lblpackageAvailableTickets.Text;
            txtpackageStartDate.Text = lblpackageStartDate.Text;
            txtpackageEndDate.Text = lblpackageEndDate.Text;
            txtpackage_price.Text = lblpackage_price.Text;
            txtpackageInclusions.Text = lblpackageInclusions.Text;
            btnUpdate.Visible = true;
            btnSubmit.Visible = false;
            BindListView();
        }

        if (e.CommandName == "delete")
        {
            Label lblid = (Label)e.Item.FindControl("lblid");
            con.Open();
            SqlCommand cmd = new SqlCommand("Delete From Packages_Category_Sub Where id='" + lblid.Text + "'", con);
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
            SqlCommand cmd = new SqlCommand("Update Packages_Category_Sub Set status='1' where id='" + lblid.Text + "'", con);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
            BindListView();

        }
        if (e.CommandName == "Deactive")
        {
            Label lblid = (Label)e.Item.FindControl("lblid");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update Packages_Category_Sub set status='0' where id='" + lblid.Text + "'", con);
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
        ddl_select_package_category.SelectedItem.Text = "";
        ddl_selectplace.SelectedItem.Text = "";
        txtpackageDuration.Text = "";
        txtpackageAvailableTickets.Text = "";
        txtpackageStartDate.Text = "";
        txtpackageEndDate.Text = "";
        txtpackageInclusions.Text = "";
        txtpackage_price.Text = "";
    }

    protected void lbtnStatus_Click(object sender, EventArgs e)
    {

    }

    protected void ddl_select_package_category_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}