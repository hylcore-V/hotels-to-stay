using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_TourDetails_AboutTheTour : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["travelzCnn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindListView_ListView_AboutTour();
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
    public void BindListView_ListView_AboutTour()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM AboutTheTourTable", con);
        SqlDataReader reader = cmd.ExecuteReader();
        ListView_AboutTour.DataSource = reader;
        ListView_AboutTour.DataBind();
        con.Close();
    }
    protected void btnSubmit_AboutTour_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO AboutTheTourTable (placename, Placescovered, Inclusions, Exclusions, EventDate, status, date) VALUES ('" + txtplacename.Text + "','" + txtPlacescovered.Text + "','" + txtInclusions.Text + "','" + txtExclusions.Text + "','" + txtEventDate.Text + "', '1' ,getdate())", con);
        cmd.ExecuteNonQuery();
        con.Close();
        BindListView_ListView_AboutTour();
        clear_AboutTour();
    }
    public void clear_AboutTour()
    {
        txtplacename.Text = "";
        txtPlacescovered.Text = "";
        txtInclusions.Text = "";
        txtExclusions.Text = "";
        txtEventDate.Text = "";
    }
    protected void btnUpdate_AboutTour_Click(object sender, EventArgs e)
    {
        con.Open();
        string Idd = hdnvalue.Value;
        SqlCommand cmd = new SqlCommand("Update AboutTheTourTable Set placename='" + txtplacename.Text + "',Placescovered='" + txtPlacescovered.Text + "',Inclusions='" + txtInclusions.Text + "',Exclusions='" + txtExclusions.Text + "',EventDate='" + txtEventDate.Text + "', status='1' where Id='" + Idd + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        BindListView_ListView_AboutTour();
        clear_AboutTour();
        btnUpdate_AboutTour.Visible = false;
        btnSubmit_AboutTour.Visible = true;
    }
    protected void btnCancel_AboutTour_Click(object sender, EventArgs e)
    {
        clear_AboutTour();
    }
    protected void ListView_AboutTour_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            Label lblplacename = (Label)e.Item.FindControl("lblplacename");
            Label lblPlacescovered = (Label)e.Item.FindControl("lblPlacescovered");
            Label lblInclusions = (Label)e.Item.FindControl("lblInclusions");
            Label lblExclusions = (Label)e.Item.FindControl("lblExclusions");
            Label lblEventDate = (Label)e.Item.FindControl("lblEventDate");
            Label lblstatus = (Label)e.Item.FindControl("lblstatus");

            hdnvalue.Value = lblId.Text;
            txtplacename.Text = lblplacename.Text;
            txtPlacescovered.Text = lblPlacescovered.Text;
            txtInclusions.Text = lblInclusions.Text;
            txtExclusions.Text = lblExclusions.Text;
            txtEventDate.Text = lblEventDate.Text;
            btnUpdate_AboutTour.Visible = true;
            btnSubmit_AboutTour.Visible = false;
            BindListView_ListView_AboutTour();
        }
        if (e.CommandName == "delete")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Delete From AboutTheTourTable Where Id='" + lblId.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindListView_ListView_AboutTour();
        }
        if (e.CommandName == "Active")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update AboutTheTourTable Set status='1' where Id='" + lblId.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindListView_ListView_AboutTour();

        }
        if (e.CommandName == "Deactive")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update AboutTheTourTable Set status='0' where Id='" + lblId.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindListView_ListView_AboutTour();
        }
    }
    protected void ListView_AboutTour_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
    protected void ListView_AboutTour_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }
}