using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_AllPackagesForm : System.Web.UI.Page
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

    public void BindListView(string query = "")
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM package_table", con);
        SqlDataReader reader = cmd.ExecuteReader();
        ListView1.DataSource = reader;
        ListView1.DataBind();
        con.Close();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string filename = Path.GetFileName(package_image.PostedFile.FileName);
        string targetPath = Server.MapPath("~/images/package_image/" + filename);
        Stream strm = package_image.PostedFile.InputStream;

        ReduceImageSize(0.5, strm, targetPath);

        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO package_table (package_name, package_desc, package_price ,package_place ,package_image ,status, rts) VALUES ('" + txtpackage_name.Text + "','" + txtpackage_desc.Text + "','" + txtpackage_price.Text + "','" + txtpackage_place.Text + "','" + filename + "','1',getdate())", con);
        cmd.ExecuteNonQuery();
        con.Close();
        clear();
        BindListView();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string str_package_image = "";
        if (package_image.HasFile)
        {
            string filename = Path.GetFileName(package_image.PostedFile.FileName);
            str_package_image = " package_image='" + filename + "',";
            string targetPath = Server.MapPath("~/images/package_image/" + filename);
            Stream strm = package_image.PostedFile.InputStream;
            ReduceImageSize(0.5, strm, targetPath);
        }
        con.Open();
        string Idd = hdnvalue.Value;
        SqlCommand cmd = new SqlCommand("Update package_table Set " + str_package_image + "package_name='" + txtpackage_name.Text + "', package_desc='" + txtpackage_desc.Text + "', package_price='" + txtpackage_price.Text + "', package_place='" + txtpackage_place.Text + "', status='1' where package_id='" + Idd + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        BindListView();
        clear();
        btnUpdate.Visible = false;
        btnSubmit.Visible = true;
    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            Label lblpackage_id = (Label)e.Item.FindControl("lblpackage_id");
            Label lblpackage_name = (Label)e.Item.FindControl("lblpackage_name");
            Label lblpackage_desc = (Label)e.Item.FindControl("lblpackage_desc");
            Label lblpackage_price = (Label)e.Item.FindControl("lblpackage_price");
            Label lblpackage_place = (Label)e.Item.FindControl("lblpackage_place");
            FileUpload lblpackage_image = (FileUpload)e.Item.FindControl("lblpackage_image");
            Label lblstatus = (Label)e.Item.FindControl("lblstatus");

            hdnvalue.Value = lblpackage_id.Text;
            txtpackage_name.Text = lblpackage_name.Text;
            txtpackage_desc.Text = lblpackage_desc.Text;
            txtpackage_price.Text = lblpackage_price.Text;
            txtpackage_place.Text = lblpackage_place.Text;
            package_image = lblpackage_image;
            btnUpdate.Visible = true;
            btnSubmit.Visible = false;
            BindListView();
        }

        if (e.CommandName == "delete")
        {
            Label lblpackage_id = (Label)e.Item.FindControl("lblpackage_id");
            con.Open();
            SqlCommand cmd = new SqlCommand("Delete From package_table Where package_id='" + lblpackage_id.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindListView();
            clear();
        }

        if (e.CommandName == "Active")
        {
            Label lblpackage_id = (Label)e.Item.FindControl("lblpackage_id");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update package_table Set status='1' where package_id='" + lblpackage_id.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindListView();
        }

        if (e.CommandName == "Deactive")
        {
            Label lblpackage_id = (Label)e.Item.FindControl("lblpackage_id");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update package_table Set status='0' where package_id='" + lblpackage_id.Text + "'", con);
            cmd.ExecuteNonQuery();
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
        btnUpdate.Visible = false;
        btnSubmit.Visible = true;
    }

    protected void clear()
    {
        txtpackage_name.Text = "";
        txtpackage_price.Text = "";
        txtpackage_place.Text = "";
        txtpackage_desc.Text = "";
    }

    protected void lbtnStatus_Click(object sender, EventArgs e)
    {

    }

    private void ReduceImageSize(double scaleFactor, Stream sourcePath, string targetPath)
    {
        using (var package_image = System.Drawing.Image.FromStream(sourcePath))
        {
            var newWidth = 821;
            var newHeight = 550;

            var thumbnailImg = new Bitmap(newWidth, newHeight);
            var thumbGraph = Graphics.FromImage(thumbnailImg);
            thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
            thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
            thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
            var imageRectangle = new Rectangle(0, 0, newWidth, newHeight);
            thumbGraph.DrawImage(package_image, imageRectangle);
            thumbnailImg.Save(targetPath, package_image.RawFormat);
        }
    }
}