using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class all_package : System.Web.UI.Page
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
        SqlCommand cmd2 = new SqlCommand("SELECT package_id, package_name, SUBSTRING(package_desc, 1, 25) AS package_desc, package_price, package_place, package_image, status, rts, package_rating FROM package_table where status = 1", con);
        SqlDataReader reader2 = cmd2.ExecuteReader();
        lv_SuggestingPackages.DataSource = reader2;
        lv_SuggestingPackages.DataBind();
        con.Close();
        citysearchfun();
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
            cityquery = "and package_place LIKE '%" + selectsearch.Text + "%'";
        }
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM package_table where 1 = 1 " + cityquery + "", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        lv_packages.DataSource = dt;
        lv_packages.DataBind();
        clear();
        con.Close();
    }

    protected void ddl_priceChk_SelectedIndexChanged(object sender, EventArgs e)
    {
        priceChkfun();
    }
    public void priceChkfun()
    {
        string priceChk = "";
        if (ddl_priceChk.SelectedValue == "1")
        {
            priceChk = " and package_price BETWEEN 0 and 50000";
        }
        else if (ddl_priceChk.SelectedValue == "2")
        {
            priceChk = " and package_price BETWEEN 50001 and 100000";
        }
        else if (ddl_priceChk.SelectedValue == "3")
        {
            priceChk = " and package_price BETWEEN 100001 and 250000";
        }
        else if (ddl_priceChk.SelectedValue == "4")
        {
            priceChk = " and package_price BETWEEN 250001 and 50000";
        }
        else if (ddl_priceChk.SelectedValue == "5")
        {
            priceChk = " and package_price >= 50001";
        }
      
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM package_table where 1 = 1 " + priceChk + "", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        lv_packages.DataSource = dt;
        lv_packages.DataBind();
        clear();
        con.Close();
    }

    protected void ddl_ratingChk_SelectedIndexChanged(object sender, EventArgs e)
    {
        ratingChkfun();
    }
    public void ratingChkfun()
    {
        string ratingChk = "";
        if (ddl_ratingChk.SelectedValue == "1")
        {
            ratingChk = " and package_rating >= 5.0";
        }
        else if (ddl_ratingChk.SelectedValue == "2")
        {
            ratingChk = " and package_rating >= 4.5";
        }
        else if (ddl_ratingChk.SelectedValue == "3")
        {
            ratingChk = " and package_rating >= 4.0";
        }
        else if (ddl_ratingChk.SelectedValue == "4")
        {
            ratingChk = " and package_rating >= 3.5";
        }
        else if (ddl_ratingChk.SelectedValue == "5")
        {
            ratingChk = " and package_rating >= 3.0";
        }
        else {
            ratingChk = "";
        }
        


        con.Open();
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM package_table where 1 = 1 " + ratingChk + "", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        lv_packages.DataSource = dt;
        lv_packages.DataBind();
        clear();
        con.Close();
    }

    public void clear()
    {
        selectsearch.Text = "";
    }
}