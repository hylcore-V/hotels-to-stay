using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class events : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["travelzCnn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindListView();
        }
    }

    public void BindListView()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select et.* , hd.hotelimage from EventsTable as et Inner join hotel_details as hd on et.eventHotelNameId=hd.Id", con);
        SqlDataReader reader = cmd.ExecuteReader();
        lv_events.DataSource = reader;
        lv_events.DataBind();
        con.Close();
    }
}