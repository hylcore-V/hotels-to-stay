using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_RegularPackagesForm : System.Web.UI.Page
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
        SqlCommand cmd = new SqlCommand("SELECT * FROM regularpackageForm", con);
        SqlDataReader reader = cmd.ExecuteReader();
        ListView1.DataSource = reader;
        ListView1.DataBind();
        con.Close();

        SqlDataAdapter sda = new SqlDataAdapter(new SqlCommand("Select Id, place from place_table where status = 1", con));
        DataTable dt = new DataTable();
        sda.Fill(dt);
        ddl_selectplace.DataSource = dt;
        ddl_selectplace.DataBind();
    }

    protected void ddl_selectplace_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO regularpackageForm (place_id, place_name ,packageDuration, packageAvailableTickets, packageStartDate, packageEndDate, packageInclusions ,status, rts) VALUES ('" + ddl_selectplace.SelectedValue + "','" + ddl_selectplace.SelectedItem + "','" + txtpackageDuration.Text + "','" + txtpackageAvailableTickets.Text + "','" + txtpackageStartDate.Text + "','" + txtpackageEndDate.Text + "','" + txtpackageInclusions.Text + "','1',getdate())", con);
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
        SqlCommand cmd = new SqlCommand("Update regularpackageForm Set place_id='" + ddl_selectplace.SelectedValue + "',packageDuration='" + txtpackageDuration.Text + "',packageAvailableTickets='" + txtpackageAvailableTickets.Text + "', packageStartDate='" + txtpackageStartDate.Text + "', packageEndDate='" + txtpackageEndDate.Text + "',packageInclusions='" + txtpackageInclusions.Text + "', status='1' where Id='" + Idd + "'", con);
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
            Label lblplace_id = (Label)e.Item.FindControl("lblplace_id");
            Label lblpackageDuration = (Label)e.Item.FindControl("lblpackageDuration");
            Label lblpackageAvailableTickets = (Label)e.Item.FindControl("lblpackageAvailableTickets");
            Label lblpackageStartDate = (Label)e.Item.FindControl("lblpackageStartDate");
            Label lblpackageEndDate = (Label)e.Item.FindControl("lblpackageEndDate");

            Label lblpackageInclusions = (Label)e.Item.FindControl("lblpackageInclusions");
            Label lblstatus = (Label)e.Item.FindControl("lblstatus");

            hdnvalue.Value = lblid.Text;
            ddl_selectplace.SelectedValue = lblplace_id.Text;
            txtpackageDuration.Text = lblpackageDuration.Text;
            txtpackageAvailableTickets.Text = lblpackageAvailableTickets.Text;
            txtpackageStartDate.Text = lblpackageStartDate.Text;
            txtpackageEndDate.Text = lblpackageEndDate.Text;
            txtpackageInclusions.Text = lblpackageInclusions.Text;
            btnUpdate.Visible = true;
            btnSubmit.Visible = false;
            BindListView();
        }

        if (e.CommandName == "delete")
        {
            Label lblid = (Label)e.Item.FindControl("lblid");
            con.Open();
            SqlCommand cmd = new SqlCommand("Delete From regularpackageForm Where id='" + lblid.Text + "'", con);
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
            SqlCommand cmd = new SqlCommand("Update regularpackageForm Set status='1' where id='" + lblid.Text + "'", con);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
            BindListView();

        }
        if (e.CommandName == "Deactive")
        {
            Label lblid = (Label)e.Item.FindControl("lblid");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update regularpackageForm Set status='0' where id='" + lblid.Text + "'", con);
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
        ddl_selectplace.SelectedItem.Text = "";
        txtpackageDuration.Text = "";
        txtpackageAvailableTickets.Text = "";
        txtpackageStartDate.Text = "";
        txtpackageEndDate.Text = "";
        txtpackageInclusions.Text = "";
    }

    protected void lbtnStatus_Click(object sender, EventArgs e)
    {

    }

}