using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class hotels_list : System.Web.UI.Page
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
        SqlCommand cmd = new SqlCommand("SELECT Id, hotel, hotelimage, city, state, country FROM hotel_details", con);
        SqlDataReader reader = cmd.ExecuteReader();
        lv_SuggestingPackages.DataSource = reader;
        lv_SuggestingPackages.DataBind();
        con.Close();
        citysearchfun();

        con.Open();
        SqlCommand cmd2 = new SqlCommand("select a.*,(select top 1 price_per_night from hotel_details_sub where hotel_id=a.Id) as price_per_night from hotel_details as a", con);
        SqlDataReader reader2 = cmd2.ExecuteReader();
        lv_hotels.DataSource = reader2;
        lv_hotels.DataBind();
        con.Close();
    }

    protected void Btn_package_search_Click(object sender, EventArgs e)
    {
        citysearchfun();
    }
    public void citysearchfun()
    {
        string cityquery = "";
        if (selectsearch.Text != "")
        {
            cityquery = "and city LIKE '%" + selectsearch.Text + "%'";
        }
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter("select a.*,(select top 1 price_per_night from hotel_details_sub where hotel_id=a.Id) as price_per_night from hotel_details as a where 1 = 1 " + cityquery + "", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        lv_hotels.DataSource = dt;
        lv_hotels.DataBind();
        clear();
        con.Close();
    }

    public void clear()
    {
        selectsearch.Text = "";
    }
}