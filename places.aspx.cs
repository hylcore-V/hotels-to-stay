using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class places : System.Web.UI.Page
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
        SqlCommand cmd = new SqlCommand("SELECT it.*,cn.* FROM TourDetails AS it INNER JOIN place_table AS cn on it.place_id=cn.Id", con);
        SqlDataReader reader = cmd.ExecuteReader();
        lv_place.DataSource = reader;
        lv_place.DataBind();
        con.Close();
    }
}