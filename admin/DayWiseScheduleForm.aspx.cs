using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_DayWiseScheduleForm : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["travelzCnn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindListView_ListView_DayWise_schedule();
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
    public void BindListView_ListView_DayWise_schedule()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM DayWise_schedule_table", con);
        SqlDataReader reader = cmd.ExecuteReader();
        ListView_DayWise_schedule.DataSource = reader;
        ListView_DayWise_schedule.DataBind();
        con.Close();

        SqlDataAdapter sda = new SqlDataAdapter(new SqlCommand("Select Id,place from  place_table", con));
        DataTable dt = new DataTable();
        sda.Fill(dt);
        dd_place.DataSource = dt;
        dd_place.DataBind();
    }
    protected void btnSubmit_AboutTour_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO DayWise_schedule_table (place, day, daytitle, daydetails,status, date) VALUES ('" + dd_place.SelectedItem + "','" + txtday.Text + "','" + txtdaytitle.Text + "','" + txtdaydetails.Text + "', '1' ,getdate())", con);
        cmd.ExecuteNonQuery();
        con.Close();
        BindListView_ListView_DayWise_schedule();
        clear_AboutTour();
    }
    public void clear_AboutTour()
    {
        txtday.Text = "";
        txtdaytitle.Text = "";
        txtdaydetails.Text = "";
    }
    protected void btnUpdate_AboutTour_Click(object sender, EventArgs e)
    {
        con.Open();
        string Idd = hdnvalue.Value;
        SqlCommand cmd = new SqlCommand("Update DayWise_schedule_table Set place='" + dd_place.SelectedValue + "', day='" + txtday.Text + "',daytitle='" + txtdaytitle.Text + "',daydetails='" + txtdaydetails.Text + "', status='1' where Id='" + Idd + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        BindListView_ListView_DayWise_schedule();
        clear_AboutTour();
        btnUpdate_AboutTour.Visible = false;
        btnSubmit_AboutTour.Visible = true;
    }
    protected void btnCancel_AboutTour_Click(object sender, EventArgs e)
    {
        clear_AboutTour();
    }
    protected void ListView_DayWise_schedule_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            Label lblplace = (Label)e.Item.FindControl("lblplace");
            Label lblday = (Label)e.Item.FindControl("lblday");
            Label lbldaytitle = (Label)e.Item.FindControl("lbldaytitle");
            Label lbldaydetails = (Label)e.Item.FindControl("lbldaydetails");
            Label lblstatus = (Label)e.Item.FindControl("lblstatus");

            hdnvalue.Value = lblId.Text;
            lblplace.Text = lblplace.Text;
            txtday.Text = lblday.Text;
            txtdaytitle.Text = lbldaytitle.Text;
            txtdaydetails.Text = lbldaydetails.Text;
            btnUpdate_AboutTour.Visible = true;
            btnSubmit_AboutTour.Visible = false;
            BindListView_ListView_DayWise_schedule();
        }
        if (e.CommandName == "delete")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Delete From DayWise_schedule_table Where Id='" + lblId.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindListView_ListView_DayWise_schedule();
        }
        if (e.CommandName == "Active")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update DayWise_schedule_table Set status='1' where Id='" + lblId.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindListView_ListView_DayWise_schedule();

        }
        if (e.CommandName == "Deactive")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update DayWise_schedule_table Set status='0' where Id='" + lblId.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindListView_ListView_DayWise_schedule();
        }
    }
    protected void ListView_DayWise_schedule_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }
    protected void ListView_DayWise_schedule_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }
}