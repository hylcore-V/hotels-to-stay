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

public partial class admin_PlaceInfoForm : System.Web.UI.Page
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
        SqlCommand cmd = new SqlCommand("SELECT * FROM place_table", con);
        SqlDataReader reader = cmd.ExecuteReader();
        ListView1.DataSource = reader;
        ListView1.DataBind();
        con.Close();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        string filename = Path.GetFileName(placeimage.PostedFile.FileName);
        string targetPath = Server.MapPath("~/images/Place_Images/" + filename);
        Stream strm = placeimage.PostedFile.InputStream;

        string filename2 = Path.GetFileName(placeimage2.PostedFile.FileName);
        string targetPath2 = Server.MapPath("~/images/Place_Images/" + filename2);
        Stream strm2 = placeimage2.PostedFile.InputStream;

        string filename3 = Path.GetFileName(placeimage3.PostedFile.FileName);
        string targetPath3 = Server.MapPath("~/images/Place_Images/" + filename3);
        Stream strm3 = placeimage3.PostedFile.InputStream;

        string filename4 = Path.GetFileName(placeimage4.PostedFile.FileName);
        string targetPath4 = Server.MapPath("~/images/Place_Images/" + filename4);
        Stream strm4 = placeimage4.PostedFile.InputStream;

        string filename5 = Path.GetFileName(placeimage5.PostedFile.FileName);
        string targetPath5 = Server.MapPath("~/images/Place_Images/" + filename5);
        Stream strm5 = placeimage5.PostedFile.InputStream;

        string filename6 = Path.GetFileName(bannerimage.PostedFile.FileName);
        string targetPath6 = Server.MapPath("~/images/banner/" + filename6);
        Stream strm6 = bannerimage.PostedFile.InputStream;

        ReduceImageSize(0.5, strm, targetPath);
        ReduceImageSize2(0.5, strm2, targetPath2);
        ReduceImageSize3(0.5, strm3, targetPath3);
        ReduceImageSize4(0.5, strm4, targetPath4);
        ReduceImageSize5(0.5, strm5, targetPath5);
        ReduceImageSize6(0.5, strm6, targetPath6);


        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO place_table (place, city, district, state, country, district_code, placeimage, placeimage2, placeimage3, placeimage4, placeimage5, place_bannerimage, nearby_places, nearby_hotels, nearby_restaurant, nearby_hospitals, nearby_malls, nearby_airport, nearby_railways, nearby_bus, place_map, place_desc, status, date) VALUES ('" + txtplace.Text + "','" + txtcity.Text + "','" + txtdistrict.Text + "','" + txtstate.Text + "','" + txtcountry.Text + "','" + txtdistrict_code.Text + "','" + filename + "','" + filename2 + "','" + filename3 + "','" + filename4 + "','" + filename5 + "','" + filename6 + "','" + txtnearby_places.Text + "','" + txtnearby_hotels.Text + "','" + txtnearby_restaurant.Text + "','" + txtnearby_hospitals.Text + "','" + txtnearby_malls.Text + "','" + txtnearby_airports.Text + "','" + txtnearby_railways.Text + "','" + txtnearby_bus.Text + "','" + txtplace_map.Text + "','" + description.Text + "','1',getdate())", con);
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        con.Close();
        clear();
        BindListView();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string str_placeimage = "";
        if (placeimage.HasFile)
        {
            string filename = Path.GetFileName(placeimage.PostedFile.FileName);
            str_placeimage = " placeimage='" + filename + "',";
            string targetPath = Server.MapPath("~/images/Place_Images/" + filename);
            Stream strm = placeimage.PostedFile.InputStream;
            ReduceImageSize(0.5, strm, targetPath);
        }

        string str_placeimage2 = "";
        if (placeimage2.HasFile)
        {
            string filename2 = Path.GetFileName(placeimage2.PostedFile.FileName);
            str_placeimage2 = " placeimage2='" + filename2 + "',";
            string targetPath2 = Server.MapPath("~/images/Place_Images/" + filename2);
            Stream strm2 = placeimage2.PostedFile.InputStream;
            ReduceImageSize2(0.5, strm2, targetPath2);
        }

        string str_placeimage3 = "";
        if (placeimage3.HasFile)
        {
            string filename3 = Path.GetFileName(placeimage3.PostedFile.FileName);
            str_placeimage3 = " placeimage3='" + filename3 + "',";
            string targetPath3 = Server.MapPath("~/images/Place_Images/" + filename3);
            Stream strm3 = placeimage3.PostedFile.InputStream;
            ReduceImageSize3(0.5, strm3, targetPath3);
        }

        string str_placeimage4 = "";
        if (placeimage4.HasFile)
        {
            string filename4 = Path.GetFileName(placeimage4.PostedFile.FileName);
            str_placeimage4 = " placeimage4='" + filename4 + "',";
            string targetPath4 = Server.MapPath("~/images/Place_Images/" + filename4);
            Stream strm4 = placeimage4.PostedFile.InputStream;
            ReduceImageSize4(0.5, strm4, targetPath4);
        }

        string str_placeimage5 = "";
        if (placeimage5.HasFile)
        {
            string filename5 = Path.GetFileName(placeimage5.PostedFile.FileName);
            str_placeimage5 = " placeimage5='" + filename5 + "',";
            string targetPath5 = Server.MapPath("~/images/Place_Images/" + filename5);
            Stream strm5 = placeimage5.PostedFile.InputStream;
            ReduceImageSize5(0.5, strm5, targetPath5);
        }

        string str_placeimage6 = "";
        if (bannerimage.HasFile)
        {
            string filename6 = Path.GetFileName(bannerimage.PostedFile.FileName);
            str_placeimage6 = " place_bannerimage='" + filename6 + "',";
            string targetPath6 = Server.MapPath("~/images/banner/" + filename6);
            Stream strm6 = bannerimage.PostedFile.InputStream;
            ReduceImageSize(0.5, strm6, targetPath6);
        }

        con.Open();
        string Idd = hdnvalue.Value;
        SqlCommand cmd = new SqlCommand("Update place_table Set " + str_placeimage + " " + str_placeimage2 + " " + str_placeimage3 + " " + str_placeimage4 + " " + str_placeimage5 + " " + str_placeimage6 + " place='" + txtplace.Text + "', city='" + txtcity.Text + "', district='" + txtdistrict.Text + "', state='" + txtstate.Text + "', country='" + txtcountry.Text + "', district_code='" + txtdistrict_code.Text + "', nearby_places='" + txtnearby_places.Text + "', nearby_restaurant='" + txtnearby_restaurant.Text + "', nearby_hotels='" + txtnearby_hotels.Text + "', nearby_railways='" + txtnearby_railways.Text + "', nearby_airport='" + txtnearby_airports.Text + "', nearby_hospitals='" + txtnearby_hospitals.Text + "', nearby_malls='" + txtnearby_malls.Text + "', nearby_bus='" + txtnearby_bus.Text + "', place_map='" + txtplace_map.Text + "',place_desc='" + description.Text + "', status='1' where Id='" + Idd + "'", con);
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
            Label lblplace = (Label)e.Item.FindControl("lblplace");
            Label lblcity = (Label)e.Item.FindControl("lblcity");
            Label lbldistrict = (Label)e.Item.FindControl("lbldistrict");
            Label lblstate = (Label)e.Item.FindControl("lblstate");
            Label lblcountry = (Label)e.Item.FindControl("lblcountry");
            Label lbldistrict_code = (Label)e.Item.FindControl("lbldistrict_code");
            FileUpload lblplaceimage = (FileUpload)e.Item.FindControl("lblplaceimage");
            FileUpload lblplaceimage2 = (FileUpload)e.Item.FindControl("lblplaceimage2");
            FileUpload lblplaceimage3 = (FileUpload)e.Item.FindControl("lblplaceimage3");
            FileUpload lblplaceimage4 = (FileUpload)e.Item.FindControl("lblplaceimage4");
            FileUpload lblplaceimage5 = (FileUpload)e.Item.FindControl("lblplaceimage5");
            FileUpload lblbannerimage = (FileUpload)e.Item.FindControl("lblbannerimage");
            Label lblnearby_places = (Label)e.Item.FindControl("lblnearby_places");
            Label lblnearby_hotels = (Label)e.Item.FindControl("lblnearby_hotels");
            Label lblnearby_restaurant = (Label)e.Item.FindControl("lblnearby_restaurant");
            Label lblnearby_hospitals = (Label)e.Item.FindControl("lblnearby_hospitals");
            Label lblnearby_malls = (Label)e.Item.FindControl("lblnearby_malls");
            Label lblnearby_airport = (Label)e.Item.FindControl("lblnearby_airport");
            Label lblnearby_railways = (Label)e.Item.FindControl("lblnearby_railways");
            Label lblnearby_bus = (Label)e.Item.FindControl("lblnearby_bus");
            Label lblplace_map = (Label)e.Item.FindControl("lblplace_map");
            Label lblplace_desc = (Label)e.Item.FindControl("lblplace_desc");
            Label lblstatus = (Label)e.Item.FindControl("lblstatus");

            hdnvalue.Value = lblId.Text;
            txtplace.Text = lblplace.Text;
            txtcity.Text = lblcity.Text;
            txtdistrict.Text = lbldistrict.Text;
            txtstate.Text = lblstate.Text;
            txtcountry.Text = lblcountry.Text;
            txtdistrict_code.Text = lbldistrict_code.Text;
            placeimage = lblplaceimage;
            placeimage2 = lblplaceimage2;
            placeimage3 = lblplaceimage3;
            placeimage4 = lblplaceimage4;
            placeimage5 = lblplaceimage5;
            bannerimage = lblbannerimage;
            txtnearby_places.Text = lblnearby_places.Text;
            txtnearby_hotels.Text = lblnearby_hotels.Text;
            txtnearby_restaurant.Text = lblnearby_restaurant.Text;
            txtnearby_hospitals.Text = lblnearby_hospitals.Text;
            txtnearby_malls.Text = lblnearby_malls.Text;
            txtnearby_airports.Text = lblnearby_airport.Text;
            txtnearby_railways.Text = lblnearby_railways.Text;
            txtnearby_bus.Text = lblnearby_bus.Text;
            txtplace_map.Text = lblplace_map.Text;
            description.Text = lblplace_desc.Text;
            btnUpdate.Visible = true;
            btnSubmit.Visible = false;
            BindListView();
        }

        if (e.CommandName == "delete")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Delete From place_table Where Id='" + lblId.Text + "'", con);
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
            SqlCommand cmd = new SqlCommand("Update place_table Set status='1' where Id='" + lblId.Text + "'", con);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
            BindListView();

        }
        if (e.CommandName == "Deactive")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update place_table Set status='0' where Id='" + lblId.Text + "'", con);
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
        txtplace.Text = "";
        txtcity.Text = "";
        txtdistrict.Text = "";
        txtstate.Text = "";
        txtcountry.Text = "";
        txtdistrict_code.Text = "";
        txtnearby_places.Text = "";
        txtnearby_hotels.Text = "";
        txtnearby_restaurant.Text = "";
        txtnearby_hospitals.Text = "";
        txtnearby_malls.Text = "";
        txtnearby_airports.Text = "";
        txtnearby_railways.Text = "";
        txtnearby_bus.Text = "";
        txtplace_map.Text = "";
        description.Text = "";
    }

    protected void lbtnStatus_Click(object sender, EventArgs e)
    {

    }

    private void ReduceImageSize(double scaleFactor, Stream sourcePath, string targetPath)
    {
        using (var placeimage = System.Drawing.Image.FromStream(sourcePath))
        {
            var newWidth = 550;
            var newHeight = 353;

            var thumbnailImg = new Bitmap(newWidth, newHeight);
            var thumbGraph = Graphics.FromImage(thumbnailImg);
            thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
            thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
            thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
            var imageRectangle = new Rectangle(0, 0, newWidth, newHeight);
            thumbGraph.DrawImage(placeimage, imageRectangle);
            thumbnailImg.Save(targetPath, placeimage.RawFormat);
        }
    }

    private void ReduceImageSize2(double scaleFactor, Stream sourcePath, string targetPath2)
    {
        using (var placeimage2 = System.Drawing.Image.FromStream(sourcePath))
        {
            var newWidth = 550;
            var newHeight = 353;

            var thumbnailImg = new Bitmap(newWidth, newHeight);
            var thumbGraph = Graphics.FromImage(thumbnailImg);
            thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
            thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
            thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
            var imageRectangle = new Rectangle(0, 0, newWidth, newHeight);
            thumbGraph.DrawImage(placeimage2, imageRectangle);
            thumbnailImg.Save(targetPath2, placeimage2.RawFormat);
        }
    }

    private void ReduceImageSize3(double scaleFactor, Stream sourcePath, string targetPath3)
    {
        using (var placeimage3 = System.Drawing.Image.FromStream(sourcePath))
        {
            var newWidth = 550;
            var newHeight = 353;

            var thumbnailImg = new Bitmap(newWidth, newHeight);
            var thumbGraph = Graphics.FromImage(thumbnailImg);
            thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
            thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
            thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
            var imageRectangle = new Rectangle(0, 0, newWidth, newHeight);
            thumbGraph.DrawImage(placeimage3, imageRectangle);
            thumbnailImg.Save(targetPath3, placeimage3.RawFormat);
        }
    }

    private void ReduceImageSize4(double scaleFactor, Stream sourcePath, string targetPath4)
    {
        using (var placeimage4 = System.Drawing.Image.FromStream(sourcePath))
        {
            var newWidth = 550;
            var newHeight = 353;

            var thumbnailImg = new Bitmap(newWidth, newHeight);
            var thumbGraph = Graphics.FromImage(thumbnailImg);
            thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
            thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
            thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
            var imageRectangle = new Rectangle(0, 0, newWidth, newHeight);
            thumbGraph.DrawImage(placeimage4, imageRectangle);
            thumbnailImg.Save(targetPath4, placeimage4.RawFormat);
        }
    }

    private void ReduceImageSize5(double scaleFactor, Stream sourcePath, string targetPath5)
    {
        using (var placeimage5 = System.Drawing.Image.FromStream(sourcePath))
        {
            var newWidth = 550;
            var newHeight = 353;

            var thumbnailImg = new Bitmap(newWidth, newHeight);
            var thumbGraph = Graphics.FromImage(thumbnailImg);
            thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
            thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
            thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
            var imageRectangle = new Rectangle(0, 0, newWidth, newHeight);
            thumbGraph.DrawImage(placeimage5, imageRectangle);
            thumbnailImg.Save(targetPath5, placeimage5.RawFormat);
        }
    }

    private void ReduceImageSize6(double scaleFactor, Stream sourcePath, string targetPath6)
    {
        using (var place_bannerimage = System.Drawing.Image.FromStream(sourcePath))
        {
            var newWidth = 550;
            var newHeight = 353;

            var thumbnailImg = new Bitmap(newWidth, newHeight);
            var thumbGraph = Graphics.FromImage(thumbnailImg);
            thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
            thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
            thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
            var imageRectangle = new Rectangle(0, 0, newWidth, newHeight);
            thumbGraph.DrawImage(place_bannerimage, imageRectangle);
            thumbnailImg.Save(targetPath6, place_bannerimage.RawFormat);
        }
    }
}