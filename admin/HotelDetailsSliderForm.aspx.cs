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

public partial class admin_HotelDetailsSliderForm : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["travelzCnn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindListView();
            lv_main();
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
        SqlCommand cmd = new SqlCommand("SELECT * FROM hotelSlider where status = 1", con);
        SqlDataReader reader = cmd.ExecuteReader();
        ListView1.DataSource = reader;
        ListView1.DataBind();
        con.Close();
    }

    public void lv_main()
    {
        SqlDataAdapter sda = new SqlDataAdapter(new SqlCommand("Select Id, hotel from  hotel_details where status = 1", con));
        DataTable dt = new DataTable();
        sda.Fill(dt);
        ddmain.DataSource = dt;
        ddmain.DataBind();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string filename = Path.GetFileName(placeimage.PostedFile.FileName);
        string targetPath = Server.MapPath("~/images/Hotel_Images/" + filename);
        Stream strm = placeimage.PostedFile.InputStream;

        ReduceImageSize(0.5, strm, targetPath);

        con.Open();

        string count = "0";
        SqlCommand cmdc = new SqlCommand("select count(*) from hotelSlider where hotel_name='" + ddmain.SelectedItem + "' ",con);
        count = cmdc.ExecuteScalar().ToString();


        if (count == "0")
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO hotelSlider (place_id, placeimage, status, date, hotel_name,active ) VALUES('" + ddmain.SelectedValue + "','" + filename + "','1',getdate(),'" + ddmain.SelectedItem + "',1)", con);
            cmd.ExecuteNonQuery();
        }
        else
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO hotelSlider (place_id, placeimage, status, date, hotel_name,active ) VALUES('" + ddmain.SelectedValue + "','" + filename + "','1',getdate(),'" + ddmain.SelectedItem + "',0)", con);
            cmd.ExecuteNonQuery();
        }
            
           
        con.Close();
        BindListView();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string str_placeimage = "";
        if (placeimage.HasFile)
        {
            string filename = Path.GetFileName(placeimage.PostedFile.FileName);
            str_placeimage = " placeimage='" + filename + "',";
            string targetPath = Server.MapPath("~/images/Hotel_Images/" + filename);
            Stream strm = placeimage.PostedFile.InputStream;
            ReduceImageSize(0.5, strm, targetPath);
        }

        con.Open();
        string Idd = hdnvalue.Value;
        SqlCommand cmd = new SqlCommand("Update hotelSlider Set " + str_placeimage + " hotel_name='" + ddmain.SelectedItem + "', status='1' where Id='" + Idd + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        BindListView();
    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            Label lblplace_id = (Label)e.Item.FindControl("lblplace_id");
            FileUpload lblplaceimage = (FileUpload)e.Item.FindControl("lblplaceimage");
            Label lblstatus = (Label)e.Item.FindControl("lblstatus");

            hdnvalue.Value = lblId.Text;
            lblplace_id.Text = lblplace_id.Text;
            placeimage = lblplaceimage;
            btnUpdate.Visible = true;
            btnSubmit.Visible = false;
            BindListView();
        }

        if (e.CommandName == "delete")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Delete From hotelSlider Where Id='" + lblId.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindListView();
        }

        if (e.CommandName == "Active")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update hotelSlider Set status='1' where Id='" + lblId.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindListView();

        }
        if (e.CommandName == "Deactive")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update hotelSlider Set status='0' where Id='" + lblId.Text + "'", con);
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
}