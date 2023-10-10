using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_TopEvents : System.Web.UI.Page
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
        SqlCommand cmd = new SqlCommand("SELECT * FROM EventsTable", con);
        SqlDataReader reader = cmd.ExecuteReader();
        ListView1.DataSource = reader;
        ListView1.DataBind();
        con.Close();

        SqlDataAdapter sda = new SqlDataAdapter(new SqlCommand("Select Id, hotel, city from  hotel_details where status = 1", con));
        DataTable dt = new DataTable();
        sda.Fill(dt);
        ddl_selecthotel.DataSource = dt;
        ddl_selecthotel.DataBind();
    }

    protected void ddl_selecthotel_SelectedIndexChanged(object sender, EventArgs e)
    {
        geteventLocationFun();
    }

    public void geteventLocationFun()
    {
        SqlCommand cmd2 = new SqlCommand("select city from hotel_details where Id = '" + ddl_selecthotel.SelectedValue + "'", con);
        con.Open();
        SqlDataReader reader = cmd2.ExecuteReader();
        if (reader.Read())
        {
            txteventLocation.Text = reader.GetValue(0).ToString();
        }
        con.Close();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO [EventsTable] (eventHotelNameId ,eventHotelName, eventDate, eventTime, eventLocation, status, rts) VALUES ('" + ddl_selecthotel.SelectedValue + "','" + ddl_selecthotel.SelectedItem + "','" + txteventDate.Text + "','" + txteventTime.Text + "','" + txteventLocation.Text + "','1',getdate())", con);
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
        SqlCommand cmd = new SqlCommand("Update [EventsTable] Set eventHotelNameId='" + ddl_selecthotel.SelectedValue + "',eventDate='" + txteventDate.Text + "', eventTime='" + txteventTime.Text + "', eventLocation='" + txteventLocation.Text + "', status='1' where Id='" + Idd + "'", con);
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
            Label lbleventHotelNameId = (Label)e.Item.FindControl("lbleventHotelNameId");
            Label lbleventHotelName = (Label)e.Item.FindControl("lbleventHotelName");
            Label lbleventDate = (Label)e.Item.FindControl("lbleventDate");
            Label lbleventTime = (Label)e.Item.FindControl("lbleventTime");
            Label lbleventLocation = (Label)e.Item.FindControl("lbleventLocation");
            Label lblstatus = (Label)e.Item.FindControl("lblstatus");

            hdnvalue.Value = lblid.Text;
            ddl_selecthotel.SelectedValue = lbleventHotelNameId.Text;
            ddl_selecthotel.SelectedItem.Text = lbleventHotelName.Text;
            txteventDate.Text = lbleventDate.Text;
            txteventTime.Text = lbleventHotelName.Text;
            txteventLocation.Text = lbleventTime.Text;
            btnUpdate.Visible = true;
            btnSubmit.Visible = false;
            BindListView();
        }

        if (e.CommandName == "delete")
        {
            Label lblid = (Label)e.Item.FindControl("lblid");
            con.Open();
            SqlCommand cmd = new SqlCommand("Delete From [EventsTable] Where id='" + lblid.Text + "'", con);
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
            SqlCommand cmd = new SqlCommand("Update [EventsTable] Set status='1' where id='" + lblid.Text + "'", con);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
            BindListView();

        }
        if (e.CommandName == "Deactive")
        {
            Label lblid = (Label)e.Item.FindControl("lblid");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update [EventsTable] Set status='0' where id='" + lblid.Text + "'", con);
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
        btnUpdate.Visible = false;
        btnSubmit.Visible = true;
        clear();
    }

    protected void clear()
    {
        ddl_selecthotel.SelectedItem.Text = "";
        txteventDate.Text = "";
        txteventTime.Text = "";
        txteventLocation.Text = "";
    }

    protected void lbtnStatus_Click(object sender, EventArgs e)
    {

    }
}