using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class tour_details : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["travelzCnn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindListView();
            lv_slider();
            lv_showpackages();
        }
    }
    protected void BtnRatingsForm_Click1(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO querytbl (name, phone, email, city, msg, rts) VALUES ('" + txname.Text + "','" + txnumber.Text + "','" + txmail.Text + "','" + txcity.Text + "','" + txmsg.Text + "',getdate())", con);
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        con.Close();
    }

    public void BindListView()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from place_table where place = '" + Request.QueryString["place"] + "' OR place='" + Request.QueryString["place_name"] + "'", con);
        SqlDataReader reader = cmd.ExecuteReader();
        lv_main.DataSource = reader;
        lv_main.DataBind();
        con.Close();

        con.Open();
        SqlCommand cmd6 = new SqlCommand("select * from place_table where place = '" + Request.QueryString["place"] + "' OR place='" + Request.QueryString["place_name"] + "'", con);
        SqlDataReader reader6 = cmd6.ExecuteReader();
        lv_sub.DataSource = reader6;
        lv_sub.DataBind();
        con.Close();

        con.Open();
        SqlCommand cmd2 = new SqlCommand("select * from AboutTheTourTable where placename = '" + Request.QueryString["place"] + "' OR placename = '" + Request.QueryString["place_name"] + "'", con);
        SqlDataReader reader2 = cmd2.ExecuteReader();
        lv_aboutTour.DataSource = reader2;
        lv_aboutTour.DataBind();
        con.Close();

        con.Open();
        SqlCommand cmd3 = new SqlCommand("select * from DayWise_schedule_table where place = '" + Request.QueryString["place"] + "' OR place = '" + Request.QueryString["place_name"] + "'", con);
        SqlDataReader reader3 = cmd3.ExecuteReader();
        lst_tourschedule.DataSource = reader3;
        lst_tourschedule.DataBind();
        con.Close();

        con.Open();
        SqlCommand cmd4 = new SqlCommand("SELECT pt.Id, pt.place ,pt.state, td.* FROM place_table AS pt INNER JOIN TourDetails AS td on pt.place=td.place_name where td.place_name = '" + Request.QueryString["place"] + "' OR td.place_name = '" + Request.QueryString["place_name"] + "'", con);
        SqlDataReader reader4 = cmd4.ExecuteReader();
        lv_tripInfo.DataSource = reader4;
        lv_tripInfo.DataBind();
        con.Close();
    }

    public void lv_slider()
    {
        for (int i = 0; i < lv_sub.Items.Count; i++)
        {
            ListView SubLV = lv_sub.Items[i].FindControl("lv_slider") as ListView;
            ListView SubLV2 = lv_sub.Items[i].FindControl("lv_slider_indicators") as ListView;
            Label lblid = lv_sub.Items[i].FindControl("lblid") as Label;

            using (SqlDataAdapter sda1 = new SqlDataAdapter("select * from TourDetailsSlider where place = '" + Request.QueryString["place"] + "' OR place='" + Request.QueryString["place_name"] + "'", con))
            {
                DataTable dtt = new DataTable();
                sda1.Fill(dtt);
                SubLV.DataSource = dtt;
                SubLV.DataBind();
                SubLV2.DataSource = dtt;
                SubLV2.DataBind();
            }
        }
    }

    public void lv_showpackages()
    {
        for (int i = 0; i < lv_tripInfo.Items.Count; i++)
        {
            ListView SubLV = lv_tripInfo.Items[i].FindControl("lv_showpackages") as ListView;
            Label lblid = lv_tripInfo.Items[i].FindControl("lblid") as Label;

            using (SqlDataAdapter sda1 = new SqlDataAdapter("SELECT t1.*, t2.packageDuration,t2.package_place_name,t2.package_price,t2.package_category_name, t3.* FROM place_table t1 INNER JOIN Packages_Category_Sub t2 ON t1.Id = t2.package_place_id INNER JOIN Package_Category_Main t3 ON t2.package_category_id = t3.package_category_id", con))
            {
                DataTable dtt = new DataTable();
                sda1.Fill(dtt);
                SubLV.DataSource = dtt;
                SubLV.DataBind();
            }
        }
    }
}