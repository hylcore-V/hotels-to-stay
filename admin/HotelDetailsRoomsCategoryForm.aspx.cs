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

public partial class admin_HotelDetailsRoomsCategoryForm : System.Web.UI.Page
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
        SqlDataAdapter sda = new SqlDataAdapter(new SqlCommand("Select * from hotel_details where status = 1", con));
        DataTable dt = new DataTable();
        sda.Fill(dt);
        dd_selecthotel.DataSource = dt;
        dd_selecthotel.DataBind();

        con.Open();
        SqlCommand cmd = new SqlCommand("select * from hotel_details_sub where status = 1", con);
        SqlDataReader reader = cmd.ExecuteReader();
        ListView1.DataSource = reader;
        ListView1.DataBind();
        con.Close();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string filename = Path.GetFileName(room_image.PostedFile.FileName);
        string targetPath = Server.MapPath("~/images/Hotel_Images/" + filename);
        Stream strm = room_image.PostedFile.InputStream;

        ReduceImageSize(0.5, strm, targetPath);

        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO hotel_details_sub (hotel_id, hotel_name, room_type, hotel_amenities, includes, maxinum, price_per_night, room_image ,status, rts) VALUES ('" + dd_selecthotel.SelectedValue + "','" + dd_selecthotel.SelectedItem + "','" + txtroomtype.Text + "','" + txthotel_amenities.Text + "','" + txtincludes.Text + "','" + txtmaxinum.Text + "','" + txtprice_per_night.Text + "','" + filename + "','1',getdate())", con);
        cmd.ExecuteNonQuery();
        con.Close();
        BindListView();
        clear();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string str_room_image = "";
        if (room_image.HasFile)
        {
            string filename = Path.GetFileName(room_image.PostedFile.FileName);
            str_room_image = " room_image='" + filename + "',";
            string targetPath = Server.MapPath("~/images/Hotel_Images/" + filename);
            Stream strm = room_image.PostedFile.InputStream;
            ReduceImageSize(0.5, strm, targetPath);
        }
        con.Open();
        string Idd = hdnvalue.Value;
        SqlCommand cmd = new SqlCommand("Update hotel_details_sub Set " + str_room_image + " room_type='" + txtroomtype.Text + "', hotel_amenities='" + txthotel_amenities.Text + "', includes='" + txtincludes.Text + "', maxinum='" + txtmaxinum.Text + "', price_per_night='" + txtprice_per_night.Text + "', status='1' where Id='" + Idd + "'", con);
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
            Label lblroom_type = (Label)e.Item.FindControl("lblroom_type");
            Label lblhotel_amenities = (Label)e.Item.FindControl("lblhotel_amenities");
            Label lblincludes = (Label)e.Item.FindControl("lblincludes");
            Label lblmaxinum = (Label)e.Item.FindControl("lblmaxinum");
            Label lblprice_per_night = (Label)e.Item.FindControl("lblprice_per_night");
            FileUpload lblroom_image = (FileUpload)e.Item.FindControl("lblroom_image");
            Label lblstatus = (Label)e.Item.FindControl("lblstatus");

            hdnvalue.Value = lblId.Text;
            txtroomtype.Text = lblroom_type.Text;
            txthotel_amenities.Text = lblhotel_amenities.Text;
            txtincludes.Text = lblincludes.Text;
            txtmaxinum.Text = lblmaxinum.Text;
            txtprice_per_night.Text = lblprice_per_night.Text;
            room_image = lblroom_image;
            btnUpdate.Visible = true;
            btnSubmit.Visible = false;
            BindListView();
        }

        if (e.CommandName == "delete")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Delete From hotel_details_sub Where Id='" + lblId.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindListView();
            clear();
        }

        if (e.CommandName == "Active")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update hotel_details_sub Set status='1' where Id='" + lblId.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindListView();

        }
        if (e.CommandName == "Deactive")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update hotel_details_sub Set status='0' where Id='" + lblId.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindListView();
        }
    }

    public void clear()
    {
        txtroomtype.Text = "";
        txthotel_amenities.Text = "";
        txtincludes.Text = "";
        txtmaxinum.Text = "";
        txtprice_per_night.Text = "";
        btnUpdate.Visible = false;
        btnSubmit.Visible = true;
    }

    private void ReduceImageSize(double scaleFactor, Stream sourcePath, string targetPath)
    {
        using (var room_image = System.Drawing.Image.FromStream(sourcePath))
        {
            var newWidth = 550;
            var newHeight = 353;

            var thumbnailImg = new Bitmap(newWidth, newHeight);
            var thumbGraph = Graphics.FromImage(thumbnailImg);
            thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
            thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
            thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
            var imageRectangle = new Rectangle(0, 0, newWidth, newHeight);
            thumbGraph.DrawImage(room_image, imageRectangle);
            thumbnailImg.Save(targetPath, room_image.RawFormat);
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        clear();
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