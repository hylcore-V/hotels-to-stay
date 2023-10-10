using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class group_package : System.Web.UI.Page
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
        SqlCommand cmd = new SqlCommand("SELECT t1.*, t2.*, t3.* FROM place_table t1 INNER JOIN Packages_Category_Sub t2 ON t1.Id = t2.package_place_id INNER JOIN Package_Category_Main t3 ON t2.package_category_id = t3.package_category_id where t2.package_category_name='Group Package'", con);
        SqlDataReader reader = cmd.ExecuteReader();
        lv_familypackage.DataSource = reader;
        lv_familypackage.DataBind();
        con.Close();
    }
}