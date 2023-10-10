using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Travelz : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["travelzCnn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        }
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
