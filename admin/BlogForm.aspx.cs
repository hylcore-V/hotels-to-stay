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

public partial class admin_BlogForm : System.Web.UI.Page
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
        SqlCommand cmd = new SqlCommand("SELECT * FROM blogs", con);
        SqlDataReader reader = cmd.ExecuteReader();
        ListView1.DataSource = reader;
        ListView1.DataBind();
        con.Close();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string filename = Path.GetFileName(blogsUpload.PostedFile.FileName);
        string targetPath = Server.MapPath("~/images/blogs/" + filename);
        Stream strm = blogsUpload.PostedFile.InputStream;

        ReduceImageSize(0.5, strm, targetPath);
        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO blogs (heading, author, date, city, details, image, status, rts) VALUES ('" + heading.Text + "','" + author.Text + "','" + date.Text + "','" + city.Text + "','" + details.Text + "','" + filename + "', '1' ,getdate())", con);
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        con.Close();
        clear();
        BindListView();
    }

    public void clear()
    {
        heading.Text = "";
        author.Text = "";
        date.Text = "";
        city.Text = "";
        details.Text = "";
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string imgc = "";
        string filename = "";
        if (blogsUpload.HasFile)
        {
            filename = hdnvalue.Value + ".jpg";
            imgc = " image='" + filename + "',";
            string targetPath = Server.MapPath("~/images/blogs/" + filename);
            Stream strm = blogsUpload.PostedFile.InputStream;
            ReduceImageSize(0.5, strm, targetPath);
        }

        con.Open();
        string Idd = hdnvalue.Value;
        SqlCommand cmd = new SqlCommand("Update blogs Set " + imgc + " heading='" + heading.Text + "', author='" + author.Text + "', date='" + date.Text + "', city='" + city.Text + "', details='" + details.Text + "', status='1' where Id='" + Idd + "'", con);
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        con.Close();
        BindListView();
        clear();
    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            Label lblheading = (Label)e.Item.FindControl("lblheading");
            Label lblauthor = (Label)e.Item.FindControl("lblauthor");
            Label lbldate = (Label)e.Item.FindControl("lbldate");
            Label lblcity = (Label)e.Item.FindControl("lblcity");
            Label lbldetails = (Label)e.Item.FindControl("lbldetails");
            FileUpload lblimage = (FileUpload)e.Item.FindControl("lblimage");
            Label lblstatus = (Label)e.Item.FindControl("lblstatus");
            Label lblrts = (Label)e.Item.FindControl("lblrts");

            hdnvalue.Value = lblId.Text;
            heading.Text = lblheading.Text;
            author.Text = lblauthor.Text;
            date.Text = lbldate.Text;
            city.Text = lblcity.Text;
            details.Text = lbldetails.Text;
            blogsUpload = lblimage;
            btnUpdate.Visible = true;
            btnSubmit.Visible = false;
            BindListView();

        }
        if (e.CommandName == "delete")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Delete From blogs Where Id='" + lblId.Text + "'", con);
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
            SqlCommand cmd = new SqlCommand("Update blogs Set status='1' where Id='" + lblId.Text + "'", con);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
            BindListView();

        }
        if (e.CommandName == "Deactive")
        {
            Label lblId = (Label)e.Item.FindControl("lblId");
            con.Open();
            SqlCommand cmd = new SqlCommand("Update blogs Set status='0' where Id='" + lblId.Text + "'", con);
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

    private void ReduceImageSize(double scaleFactor, Stream sourcePath, string targetPath)
    {
        using (var image = System.Drawing.Image.FromStream(sourcePath))
        {
            var newWidth = 1024;
            var newHeight = 768;

            var thumbnailImg = new Bitmap(newWidth, newHeight);
            var thumbGraph = Graphics.FromImage(thumbnailImg);
            thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
            thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
            thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
            var imageRectangle = new Rectangle(0, 0, newWidth, newHeight);
            thumbGraph.DrawImage(image, imageRectangle);
            thumbnailImg.Save(targetPath, image.RawFormat);
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        clear();
    }

    protected void lbtnStatus_Click(object sender, EventArgs e)
    {

    }
}