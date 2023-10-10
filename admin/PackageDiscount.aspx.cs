using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_PackageDiscount : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["travelzCnn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindListView();
        }
        if (Session["Username"] != null)
        {
            string Username = (string)Session["Username"];
        }
        else
        {
            Response.Redirect("login.aspx");
        }
    }

    public void BindListView()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM [DiscountTable]", con);
        SqlDataReader reader = cmd.ExecuteReader();
        ListView1.DataSource = reader;
        ListView1.DataBind();
        con.Close();

        SqlDataAdapter sda = new SqlDataAdapter(new SqlCommand("Select package_id, package_name, package_price from  package_table where status = 1", con));
        DataTable dt = new DataTable();
        sda.Fill(dt);
        ddl_selectpackage.DataSource = dt;
        ddl_selectpackage.DataBind();
    }

    protected void ddl_selectpackage_SelectedIndexChanged(object sender, EventArgs e)
    {
        getOriginalPrieFun();
    }

    public void getOriginalPrieFun()
    {
        SqlCommand cmd2 = new SqlCommand("select package_price from package_table where package_id = '" + ddl_selectpackage.SelectedValue + "'", con);
        con.Open();
        SqlDataReader reader = cmd2.ExecuteReader();
        if (reader.Read())
        {
            txtoriginal_price.Text = reader.GetValue(0).ToString();
        }
        con.Close();
    }

    protected void txtdiscount_price_TextChanged(object sender, EventArgs e)
    {
        calculateDiscount();
    }
    public void calculateDiscount()
    {
        double originalPrice = Convert.ToDouble(txtoriginal_price.Text);
        double discountPrice = Convert.ToDouble(txtdiscount_price.Text);
        double discountAmount = (originalPrice - discountPrice);
        double discountPercentage = (discountAmount / originalPrice) * 100;
        txtdiscount_percentage.Text = discountPercentage.ToString("0.##") + "%";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO DiscountTable (discount_package_id ,discount_package, discount_original_price, discount_price, discount_percentage, status, rts) VALUES ('" + ddl_selectpackage.SelectedValue + "','" + ddl_selectpackage.SelectedItem + "','" + txtoriginal_price.Text + "','" + txtdiscount_price.Text + "','" + txtdiscount_percentage.Text + "','1',getdate())", con);
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        con.Close();
        clear();
        BindListView();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        con.Open();
        string Idd = hdnvalue.Value;
        SqlCommand cmd = new SqlCommand("Update DiscountTable Set discount_package_id='" + ddl_selectpackage.SelectedValue + "',discount_original_price='" + txtoriginal_price.Text + "', discount_price='" + txtdiscount_price.Text + "', discount_percentage='" + txtdiscount_percentage.Text + "', status='1' where Id='" + Idd + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        BindListView();
        clear();
    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            Label lbldiscount_id = (Label)e.Item.FindControl("lbldiscount_id");
            Label lbldiscount_package_id = (Label)e.Item.FindControl("lbldiscount_package_id");
            Label lbldiscount_package = (Label)e.Item.FindControl("lbldiscount_package");
            Label lbldiscount_price = (Label)e.Item.FindControl("lbldiscount_price");
            Label lblstatus = (Label)e.Item.FindControl("lblstatus");

            hdnvalue.Value = lbldiscount_id.Text;
            ddl_selectpackage.SelectedValue = lbldiscount_package_id.Text;
            ddl_selectpackage.SelectedItem.Text = lbldiscount_package.Text;

            txtdiscount_price.Text = lbldiscount_package.Text;
            txtdiscount_percentage.Text = lbldiscount_price.Text;
            btnUpdate.Visible = true;
            btnSubmit.Visible = false;
            BindListView();
        }

        if (e.CommandName == "delete")
        {
            Label lbldiscount_id = (Label)e.Item.FindControl("lbldiscount_id");
            con.Open();
            SqlCommand cmd = new SqlCommand("Delete From DiscountTable Where discount_id='" + lbldiscount_id.Text + "'", con);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
            BindListView();
            clear();
        }

        if (e.CommandName == "Active")
        {
            Label lbldiscount_id = (Label)e.Item.FindControl("lbldiscount_id");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update DiscountTable Set status='1' where discount_id='" + lbldiscount_id.Text + "'", con);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
            BindListView();

        }
        if (e.CommandName == "Deactive")
        {
            Label lbldiscount_id = (Label)e.Item.FindControl("lbldiscount_id");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update DiscountTable Set status='0' where discount_id='" + lbldiscount_id.Text + "'", con);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
            BindListView();

        }
    }

    protected void ChangeStatus(object sender, EventArgs e)
    {

    }

    protected void ListView1_ItemEditing(object sender, ListViewEditEventArgs e)
    {

    }

    protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        clear();
    }

    protected void clear()
    {
        ddl_selectpackage.SelectedItem.Text = "";
        txtoriginal_price.Text = "";
        txtdiscount_price.Text = "";
        txtdiscount_percentage.Text = "";
    }

    protected void lbtnStatus_Click(object sender, EventArgs e)
    {

    }

}