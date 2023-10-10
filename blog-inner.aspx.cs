using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class blog_inner_html : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["travelzCnn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        BindListView();
    }
    public void BindListView(string query = "")
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM blogs where heading = '" + Request.QueryString["heading"] + "'", con);
        SqlDataReader reader = cmd.ExecuteReader();
        lv_innerblogs.DataSource = reader;
        lv_innerblogs.DataBind();
        con.Close();
    }
}