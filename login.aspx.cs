using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["travelzCnn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void txtusername_TextChanged(object sender, EventArgs e)
    {

    }
    protected void txtpassword_TextChanged(object sender, EventArgs e)
    {

    }
    protected void BtnLogIn_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM SignUp WHERE Email = '" + txtusername.Text + "' AND Password = '" + txtpassword.Text + "'", con);
        SqlDataReader reader = cmd.ExecuteReader();

        if (reader.HasRows)
        {
            Session["username"] = txtusername.Text;
            Response.Redirect("Default.aspx");
        }
        else
        {
            lblmsg.Visible = true;
            lblmsg.Text = "Incorrect email or password";
        }
        con.Close();
    }
}

