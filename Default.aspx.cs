using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["travelzCnn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindListView();
          //  lv_hotels_sub();
        }
    }

    public void BindListView()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT it.*,cn.* FROM TourDetails AS it INNER JOIN place_table AS cn on it.place_id=cn.Id", con);
        SqlDataReader reader = cmd.ExecuteReader();
        lv_place.DataSource = reader;
        lv_place.DataBind();
        con.Close();

        con.Open();
        SqlCommand cmd2 = new SqlCommand("select a.*,(select top 1 price_per_night from hotel_details_sub where hotel_id=a.Id) as price_per_night from hotel_details as a  where a.status =1 ", con);
        SqlDataReader reader2 = cmd2.ExecuteReader();
        lv_hotels.DataSource = reader2;
        lv_hotels.DataBind();
        con.Close();

        con.Open();
        SqlCommand cmd3 = new SqlCommand("select et.* , hd.hotelimage from EventsTable as et Inner join hotel_details as hd on et.eventHotelNameId=hd.Id", con);
        SqlDataReader reader3 = cmd3.ExecuteReader();
        lv_events.DataSource = reader3;
        lv_events.DataBind();
        con.Close();

        con.Open();
        SqlCommand cmd4 = new SqlCommand("select t1.*, t2.* from place_table t1 inner join Packages_Category_Sub t2 on t1.Id = t2.package_place_id", con);
        SqlDataReader reader4 = cmd4.ExecuteReader();
        lv_honey.DataSource = reader4;
        lv_honey.DataBind();
        con.Close();

        con.Open();
        SqlCommand cmd8 = new SqlCommand("SELECT Id, hotel, hotelimage, city, state, country FROM hotel_details", con);
        SqlDataReader reader8 = cmd8.ExecuteReader();
        lv_SuggestingPackages.DataSource = reader8;
        lv_SuggestingPackages.DataBind();
        con.Close();

        con.Open();
        SqlCommand cmd9 = new SqlCommand("SELECT package_id, package_name, SUBSTRING(package_desc, 1, 25) AS package_desc, package_price, package_place, package_image, status, rts, package_rating FROM package_table where status = 1", con);
        SqlDataReader reader9 = cmd9.ExecuteReader();
        lv_SuggestingPackages2.DataSource = reader9;
        lv_SuggestingPackages2.DataBind();
        con.Close();
    }



    protected void search_category_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (search_category.SelectedValue == "Place")
        {
            AutoCity.Visible = true;
            AutoHotel.Visible = false;
        }
        else if (search_category.SelectedValue == "Hotels")
        {
            AutoCity.Visible = false;
            AutoHotel.Visible = true;
        }
    }

    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        if (selectsearch.Text == "" || selectsearchhotel.Text == "")
        {
            lblemptysearch.Visible = true;
            lblemptysearch.Text = "Enter search query to get result";
            lblemptysearchhotel.Visible = true;
            lblemptysearchhotel.Text = "Enter search query to get result";
        }
        if (selectsearch.Text != "" && search_category.SelectedValue == "Place")
        {
            lblemptysearch.Visible = true;
            lblemptysearch.Text = "Enter search query to get result";
            AutoCity.Visible = true;
            AutoHotel.Visible = false;
            Response.Redirect(string.Format("searchresult.aspx?SelectedCategory={0}&place={1}", search_category.SelectedValue, selectsearch.Text));
        }
        else if (selectsearchhotel.Text != "" && search_category.SelectedValue == "Hotels")
        {
            AutoCity.Visible = false;
            AutoHotel.Visible = true;
            Response.Redirect(string.Format("searchresult.aspx?SelectedCategory={0}&hotel={1}", search_category.SelectedValue, selectsearchhotel.Text));
        }
    }
}