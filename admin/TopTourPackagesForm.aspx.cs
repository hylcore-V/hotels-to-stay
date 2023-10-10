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

public partial class Admin_TopTourPackagesForm : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["travelzCnn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
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
        SqlCommand cmd = new SqlCommand("SELECT * FROM TopTourPackages", con);
        SqlDataReader reader = cmd.ExecuteReader();
        ListView1.DataSource = reader;
        ListView1.DataBind();
        con.Close();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string offerimage_filename = Path.GetFileName(offerimage.PostedFile.FileName);
        string targetPath2 = Server.MapPath("~/images/TopTourPackages/" + offerimage_filename);
        Stream strm2 = offerimage.PostedFile.InputStream;

        ReduceImageSize2(0.5, strm2, targetPath2);

        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO TopTourPackages (place, offer_image, status, date) VALUES ('" + txtplace.Text + "', '" + offerimage_filename + "', '1' ,getdate())", con);
        cmd.ExecuteNonQuery();
        con.Close();
        BindListView();
        txtplace.Text = "";
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string offer_imgstr = "";
        if (offerimage.HasFile)
        {
            string filename2 = Path.GetFileName(offerimage.PostedFile.FileName);
            offer_imgstr = " offer_image='" + filename2 + "', ";
            string targetPath2 = Server.MapPath("~/images/TopTourPackages/" + filename2);
            Stream strm2 = offerimage.PostedFile.InputStream;
            ReduceImageSize2(0.5, strm2, targetPath2);
        }
        con.Open();
        string Idd = hdnvalue.Value;
        SqlCommand cmd = new SqlCommand("Update TopTourPackages Set " + offer_imgstr + " place='" + txtplace.Text + "', status='1' where Id='" + Idd + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        BindListView();
        txtplace.Text = "";
        btnUpdate.Visible = false;
        btnSubmit.Visible = true;
    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            Label lblplace = (Label)e.Item.FindControl("lblplace");
            FileUpload lbl_offerimage = (FileUpload)e.Item.FindControl("lbl_offerimage");
            Label lblstatus = (Label)e.Item.FindControl("lblstatus");

            hdnvalue.Value = lblId.Text;
            txtplace.Text = lblplace.Text;
            offerimage = lbl_offerimage;
            btnUpdate.Visible = true;
            btnSubmit.Visible = false;
            txtplace.Text = "";
            BindListView();
        }
        if (e.CommandName == "delete")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Delete From TopTourPackages Where Id='" + lblId.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            txtplace.Text = "";
            BindListView();
        }
        if (e.CommandName == "Active")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update TopTourPackages Set status='1' where Id='" + lblId.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindListView();
        }
        if (e.CommandName == "Deactive")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update TopTourPackages Set status='0' where Id='" + lblId.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindListView();
        }
    }

    private void ReduceImageSize2(double scaleFactor, Stream sourcePath2, string targetPath2)
    {
        using (var offer_image = System.Drawing.Image.FromStream(sourcePath2))
        {
            var newWidth = 550;
            var newHeight = 353;

            var thumbnailImg = new Bitmap(newWidth, newHeight);
            var thumbGraph = Graphics.FromImage(thumbnailImg);
            thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
            thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
            thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
            var imageRectangle = new Rectangle(0, 0, newWidth, newHeight);
            thumbGraph.DrawImage(offer_image, imageRectangle);
            thumbnailImg.Save(targetPath2, offer_image.RawFormat);
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtplace.Text = "";
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