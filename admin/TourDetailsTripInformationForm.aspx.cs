using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_TourDetailsTripInformationForm : System.Web.UI.Page
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
        SqlCommand cmd = new SqlCommand("SELECT * FROM TourDetails where status = 1", con);
        SqlDataReader reader = cmd.ExecuteReader();
        ListView1.DataSource = reader;
        ListView1.DataBind();
        con.Close();

        SqlDataAdapter sda = new SqlDataAdapter(new SqlCommand("Select Id, place from place_table where status = 1", con));
        DataTable dt = new DataTable();
        sda.Fill(dt);
        ddmain.DataSource = dt;
        ddmain.DataBind();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string filename = Path.GetFileName(offer_image.PostedFile.FileName);
        string targetPath = Server.MapPath("~/images/offer_images/" + filename);
        Stream strm = offer_image.PostedFile.InputStream;

        ReduceImageSize(0.5, strm, targetPath);

        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO TourDetails (place_id, place_name, trip_price, arrival_date, departure_date, help_number, offer_image ,status, rts) VALUES ('" + ddmain.SelectedValue + "','" + ddmain.SelectedItem + "','" + txttrip_price.Text + "','" + txtarrival_date.Text + "','" + txtdeparture_date.Text + "','" + txthelp_number.Text + "','" + filename + "','1',getdate())", con);
        cmd.ExecuteNonQuery();
        con.Close();
        BindListView();
        clear();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string str_offer_image = "";
        if (offer_image.HasFile)
        {
            string filename = Path.GetFileName(offer_image.PostedFile.FileName);
            str_offer_image = " offer_image='" + filename + "',";
            string targetPath = Server.MapPath("~/images/offer_images/" + filename);
            Stream strm = offer_image.PostedFile.InputStream;
            ReduceImageSize(0.5, strm, targetPath);
        }
        con.Open();
        string Idd = hdnvalue.Value;
        SqlCommand cmd = new SqlCommand("Update TourDetails Set " + str_offer_image + " trip_price='" + txttrip_price.Text + "', arrival_date='" + txtarrival_date.Text + "', departure_date='" + txtdeparture_date.Text + "', help_number='" + txthelp_number.Text + "', status='1' where Id='" + Idd + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        BindListView();
        clear();
    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            Label lbltrip_price = (Label)e.Item.FindControl("lbltrip_price");
            Label lblarrival_date = (Label)e.Item.FindControl("lblarrival_date");
            Label lbldeparture_date = (Label)e.Item.FindControl("lbldeparture_date");
            Label lblhelp_number = (Label)e.Item.FindControl("lblhelp_number");
            FileUpload lbloffer_image = (FileUpload)e.Item.FindControl("lbloffer_image");
            Label lblstatus = (Label)e.Item.FindControl("lblstatus");

            hdnvalue.Value = lblId.Text;
            txttrip_price.Text = lbltrip_price.Text;
            txtarrival_date.Text = lblarrival_date.Text;
            txtdeparture_date.Text = lbldeparture_date.Text;
            txthelp_number.Text = lblhelp_number.Text;
            offer_image = lbloffer_image;
            btnUpdate.Visible = true;
            btnSubmit.Visible = false;
            BindListView();
        }

        if (e.CommandName == "delete")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Delete From TourDetails Where Id='" + lblId.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindListView();
            clear();
        }

        if (e.CommandName == "Active")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update TourDetails Set status='1' where Id='" + lblId.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindListView();

        }
        if (e.CommandName == "Deactive")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update TourDetails Set status='0' where Id='" + lblId.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindListView();
        }
    }

    public void clear()
    {
        txttrip_price.Text = "";
        txtarrival_date.Text = "";
        txtdeparture_date.Text = "";
        txthelp_number.Text = "";
    }

    private void ReduceImageSize(double scaleFactor, Stream sourcePath, string targetPath)
    {
        using (var offer_image = System.Drawing.Image.FromStream(sourcePath))
        {
            var newWidth = 120;
            var newHeight = 181;

            var thumbnailImg = new Bitmap(newWidth, newHeight);
            var thumbGraph = Graphics.FromImage(thumbnailImg);
            thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
            thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
            thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
            var imageRectangle = new Rectangle(0, 0, newWidth, newHeight);
            thumbGraph.DrawImage(offer_image, imageRectangle);
            thumbnailImg.Save(targetPath, offer_image.RawFormat);
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        clear();
        btnUpdate.Visible = false;
        btnSubmit.Visible = true;
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

    protected void lbtnStatus_Click(object sender, EventArgs e)
    {

    }

}