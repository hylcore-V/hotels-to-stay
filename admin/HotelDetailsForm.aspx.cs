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

public partial class admin_HotelDetailsForm : System.Web.UI.Page
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
        SqlCommand cmd = new SqlCommand("SELECT * FROM hotel_details", con);
        SqlDataReader reader = cmd.ExecuteReader();
        ListView1.DataSource = reader;
        ListView1.DataBind();
        con.Close();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string filename = Path.GetFileName(hotelimage.PostedFile.FileName);
        string targetPath = Server.MapPath("~/images/Hotel_Images/" + filename);
        Stream strm = hotelimage.PostedFile.InputStream;

        string filename6 = Path.GetFileName(bannerimage.PostedFile.FileName);
        string targetPath6 = Server.MapPath("~/images/Hotel_Images/" + filename6);
        Stream strm6 = bannerimage.PostedFile.InputStream;

        ReduceImageSize(0.5, strm, targetPath);
        ReduceImageSize6(0.5, strm6, targetPath6);

        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO hotel_details (hotel ,city ,district ,state ,country ,district_code ,hotelimage ,hotel_bannerimage ,nearby_hospitals, nearby_malls, nearby_airport, nearby_railways, nearby_bus, hotel_map, hotel_desc ,status, date) VALUES ('" + txthotel.Text + "','" + txtcity.Text + "','" + txtdistrict.Text + "','" + txtstate.Text + "','" + txtcountry.Text + "','" + txtdistrict_code.Text + "','" + filename + "','" + filename6 + "','" + txtnearby_hospitals.Text + "','" + txtnearby_malls.Text + "','" + txtnearby_airports.Text + "','" + txtnearby_railways.Text + "','" + txtnearby_bus.Text + "','" + txthotel_map.Text + "','" + description.Text + "','1',getdate())", con);
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        con.Close();
        clear();
        BindListView();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string str_hotelimage = "";
        if (hotelimage.HasFile)
        {
            string filename = Path.GetFileName(hotelimage.PostedFile.FileName);
            str_hotelimage = " hotelimage='" + filename + "',";
            string targetPath = Server.MapPath("~/images/Hotel_Images/" + filename);
            Stream strm = hotelimage.PostedFile.InputStream;
            ReduceImageSize(0.5, strm, targetPath);
        }

        string str_hotelimage6 = "";
        if (bannerimage.HasFile)
        {
            string filename6 = Path.GetFileName(bannerimage.PostedFile.FileName);
            str_hotelimage6 = " hotel_bannerimage='" + filename6 + "',";
            string targetPath6 = Server.MapPath("~/images/Hotel_Images/" + filename6);
            Stream strm6 = bannerimage.PostedFile.InputStream;
            ReduceImageSize(0.5, strm6, targetPath6);
        }

        con.Open();
        string Idd = hdnvalue.Value;
        SqlCommand cmd = new SqlCommand("Update hotel_details Set " + str_hotelimage + " " + str_hotelimage6 + " city='" + txtcity.Text + "', district='" + txtdistrict.Text + "', state='" + txtstate.Text + "', country='" + txtcountry.Text + "', district_code='" + txtdistrict_code.Text + "', nearby_hospitals='" + txtnearby_hospitals.Text + "', nearby_malls='" + txtnearby_malls.Text + "', nearby_airport='" + txtnearby_airports.Text + "', nearby_railways='" + txtnearby_railways.Text + "', nearby_bus='" + txtnearby_bus.Text + "', hotel_map='" + txthotel_map.Text + "', status='1' where Id='" + Idd + "'", con);
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
            Label lblId = (Label)e.Item.FindControl("lblId");
            Label lblhotel = (Label)e.Item.FindControl("lblhotel");
            Label lblcity = (Label)e.Item.FindControl("lblcity");
            Label lbldistrict = (Label)e.Item.FindControl("lbldistrict");
            Label lblstate = (Label)e.Item.FindControl("lblstate");
            Label lblcountry = (Label)e.Item.FindControl("lblcountry");
            Label lbldistrict_code = (Label)e.Item.FindControl("lbldistrict_code");
            FileUpload lblhotelimage = (FileUpload)e.Item.FindControl("lblhotelimage");
            FileUpload lblbannerimage = (FileUpload)e.Item.FindControl("lblbannerimage");
            Label lblnearby_hospitals = (Label)e.Item.FindControl("lblnearby_hospitals");
            Label lblnearby_malls = (Label)e.Item.FindControl("lblnearby_malls");
            Label lblnearby_airport = (Label)e.Item.FindControl("lblnearby_airport");
            Label lblnearby_railways = (Label)e.Item.FindControl("lblnearby_railways");
            Label lblnearby_bus = (Label)e.Item.FindControl("lblnearby_bus");
            Label lblhotel_map = (Label)e.Item.FindControl("lblhotel_map");
            Label lblhotel_desc = (Label)e.Item.FindControl("lblhotel_desc");
            Label lblstatus = (Label)e.Item.FindControl("lblstatus");

            hdnvalue.Value = lblId.Text;
            txthotel.Text = lblhotel.Text;
            txtcity.Text = lblcity.Text;
            txtdistrict.Text = lbldistrict.Text;
            txtstate.Text = lblstate.Text;
            txtcountry.Text = lblcountry.Text;
            txtdistrict_code.Text = lbldistrict_code.Text;
            hotelimage = lblhotelimage;
            bannerimage = lblbannerimage;

            txtnearby_hospitals.Text = lblnearby_hospitals.Text;
            txtnearby_malls.Text = lblnearby_malls.Text;
            txtnearby_airports.Text = lblnearby_airport.Text;
            txtnearby_railways.Text = lblnearby_railways.Text;
            txtnearby_bus.Text = lblnearby_bus.Text;
            txthotel_map.Text = lblhotel_map.Text;
            description.Text = lblhotel_desc.Text;
            btnUpdate.Visible = true;
            btnSubmit.Visible = false;
            BindListView();
        }

        if (e.CommandName == "delete")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Delete From hotel_details Where Id='" + lblId.Text + "'", con);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
            BindListView();
            clear();
        }

        if (e.CommandName == "Active")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update hotel_details Set status='1' where Id='" + lblId.Text + "'", con);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
            BindListView();

        }
        if (e.CommandName == "Deactive")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update hotel_details Set status='0' where Id='" + lblId.Text + "'", con);
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
        btnUpdate.Visible = false;
        btnSubmit.Visible = true;
    }

    protected void clear()
    {
        txthotel.Text = "";
        txtcity.Text = "";
        txtdistrict.Text = "";
        txtstate.Text = "";
        txtcountry.Text = "";
        txtdistrict_code.Text = "";

        txtnearby_hospitals.Text = "";
        txtnearby_malls.Text = "";
        txtnearby_airports.Text = "";
        txtnearby_railways.Text = "";
        txtnearby_bus.Text = "";
        txthotel_map.Text = "";
        description.Text = "";
    }

    protected void lbtnStatus_Click(object sender, EventArgs e)
    {

    }

    private void ReduceImageSize(double scaleFactor, Stream sourcePath, string targetPath)
    {
        using (var hotelimage = System.Drawing.Image.FromStream(sourcePath))
        {
            var newWidth = 821;
            var newHeight = 550;

            var thumbnailImg = new Bitmap(newWidth, newHeight);
            var thumbGraph = Graphics.FromImage(thumbnailImg);
            thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
            thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
            thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
            var imageRectangle = new Rectangle(0, 0, newWidth, newHeight);
            thumbGraph.DrawImage(hotelimage, imageRectangle);
            thumbnailImg.Save(targetPath, hotelimage.RawFormat);
        }
    }

    private void ReduceImageSize6(double scaleFactor, Stream sourcePath, string targetPath6)
    {
        using (var hotel_bannerimage = System.Drawing.Image.FromStream(sourcePath))
        {
            var newWidth = 1350;
            var newHeight = 500;

            var thumbnailImg = new Bitmap(newWidth, newHeight);
            var thumbGraph = Graphics.FromImage(thumbnailImg);
            thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
            thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
            thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
            var imageRectangle = new Rectangle(0, 0, newWidth, newHeight);
            thumbGraph.DrawImage(hotel_bannerimage, imageRectangle);
            thumbnailImg.Save(targetPath6, hotel_bannerimage.RawFormat);
        }
    }
}