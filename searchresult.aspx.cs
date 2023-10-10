 using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class searchresult : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["travelzCnn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        BindListView();
        if (Request.QueryString.Count == 0)
        {
            Response.Redirect("Default.aspx");
        }
    }
    public void BindListView()
    {
        if (Request.QueryString["SelectedCategory"] != null)
        {
            string value = Request.QueryString["SelectedCategory"];
            if (value == "Place")
            {
                place_result_section.Visible = true;
                hotel_result_section.Visible = false;
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from place_table where place = '" + Request.QueryString["place"] + "'", con);
                SqlDataReader reader = cmd.ExecuteReader();
                ListViewCity.DataSource = reader;
                ListViewCity.DataBind();
                con.Close();
            }
            else if (value == "Hotels")
            {
                place_result_section.Visible = false;
                hotel_result_section.Visible = true;
                con.Open();
                SqlCommand cmd2 = new SqlCommand("select a.*,(select top 1 price_per_night from hotel_details_sub where hotel_id=a.Id) as price_per_night from hotel_details as a where a.hotel= '" + Request.QueryString["hotel"] + "'", con);
                SqlDataReader reader2 = cmd2.ExecuteReader();
                ListViewHotels.DataSource = reader2;
                ListViewHotels.DataBind();
                con.Close();
            }
        }
    }
}