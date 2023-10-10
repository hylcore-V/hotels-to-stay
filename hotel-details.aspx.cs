using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class hotel_details : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["travelzCnn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindListView();
            lv_slider();
            lv_price_per_night();
            lv_roomtypes();
            lv_HotelAmenities();
            lv_showpackages();
        }
        if (Request.QueryString.Count == 0)
        {
            Response.Redirect("Default.aspx");
        }
    }

    public void BindListView()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from hotel_details where hotel = '" + Request.QueryString["hotel"] + "'", con);
        SqlDataReader reader = cmd.ExecuteReader();
        lv_main.DataSource = reader;
        lv_main.DataBind();
        con.Close();

        con.Open();
        SqlCommand cmd2 = new SqlCommand("select * from hotel_details where hotel = '" + Request.QueryString["hotel"] + "'", con);
        SqlDataReader reader2 = cmd2.ExecuteReader();
        lv_sub.DataSource = reader2;
        lv_sub.DataBind();
        con.Close();

        con.Open();
        SqlCommand cmd4 = new SqlCommand("SELECT t1.*, t2.* FROM hotel_details t1 INNER JOIN TourDetails t2 ON t1.Id = t2.place_id where t2.place_name = '" + Request.QueryString["city"] + "'", con);
        SqlDataReader reader4 = cmd4.ExecuteReader();
        lv_tripInfo.DataSource = reader4;
        lv_tripInfo.DataBind();
        con.Close();
    }

    protected void BtnRatingsForm_Click1(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO querytbl (name,phone,email,city,msg,rts) VALUES('" + txname.Text + "','" + txnumber.Text + "','" + txmail.Text + "','" + txcity.Text + "','" + txmsg.Text + "',getdate())", con);
        cmd.ExecuteNonQuery();
        con.Close();
        send_mail(txname.Text, txnumber.Text, txmail.Text, txcity.Text, txmsg.Text);
    }

    public void lv_price_per_night()
    {
        for (int i = 0; i < lv_main.Items.Count; i++)
        {
            ListView hotels_SubLV = lv_main.Items[i].FindControl("lv_price_per_night") as ListView;
            Label lblid = lv_main.Items[i].FindControl("lblid") as Label;

            using (SqlDataAdapter sda1 = new SqlDataAdapter("select price_per_night from hotel_details_sub where hotel_id =Id", con))
            {
                DataTable dtt = new DataTable();
                sda1.Fill(dtt);
                hotels_SubLV.DataSource = dtt;
                hotels_SubLV.DataBind();
            }
        }
    }

    public void lv_roomtypes()
    {
        for (int i = 0; i < lv_sub.Items.Count; i++)
        {
            ListView hotels_SubLV = lv_sub.Items[i].FindControl("lv_roomtypes") as ListView;
            Label lblid = lv_sub.Items[i].FindControl("lblid") as Label;

            using (SqlDataAdapter sda1 = new SqlDataAdapter("select * from hotel_details_sub where hotel_name = '" + Request.QueryString["hotel"] + "'", con))
            {
                DataTable dtt = new DataTable();
                sda1.Fill(dtt);
                hotels_SubLV.DataSource = dtt;
                hotels_SubLV.DataBind();
            }
        }
    }

    public void lv_HotelAmenities()
    {
        for (int i = 0; i < lv_sub.Items.Count; i++)
        {
            ListView hotels_SubLV = lv_sub.Items[i].FindControl("lv_HotelAmenities") as ListView;
            Label lblid = lv_sub.Items[i].FindControl("lblid") as Label;

            using (SqlDataAdapter sda1 = new SqlDataAdapter("select * from HotelAmenities where hotel_name = '" + Request.QueryString["hotel"] + "'", con))
            {
                DataTable dtt = new DataTable();
                sda1.Fill(dtt);
                hotels_SubLV.DataSource = dtt;
                hotels_SubLV.DataBind();
            }
        }
    }

    public void lv_slider()
    {
        for (int i = 0; i < lv_sub.Items.Count; i++)
        {
            ListView SubLV = lv_sub.Items[i].FindControl("lv_slider") as ListView;
            ListView SubLV2 = lv_sub.Items[i].FindControl("lv_slider_indicators") as ListView;
            Label lblid = lv_sub.Items[i].FindControl("lblid") as Label;

            using (SqlDataAdapter sda1 = new SqlDataAdapter("select * from hotelslider where hotel_name = '" + Request.QueryString["hotel"] + "'", con))
            {
                DataTable dtt = new DataTable();
                sda1.Fill(dtt);
                SubLV.DataSource = dtt;
                SubLV.DataBind();
                SubLV2.DataSource = dtt;
                SubLV2.DataBind();
            }
        }
    }

    public void lv_showpackages()
    {
        for (int i = 0; i < lv_tripInfo.Items.Count; i++)
        {
            ListView SubLV = lv_tripInfo.Items[i].FindControl("lv_showpackages") as ListView;
            Label lblid = lv_tripInfo.Items[i].FindControl("lblid") as Label;

            using (SqlDataAdapter sda1 = new SqlDataAdapter("SELECT t1.*, t2.packageDuration,t2.package_place_name,t2.package_price,t2.package_category_name, t3.* FROM place_table t1 INNER JOIN Packages_Category_Sub t2 ON t1.Id = t2.package_place_id INNER JOIN Package_Category_Main t3 ON t2.package_category_id = t3.package_category_id", con))
            {
                DataTable dtt = new DataTable();
                sda1.Fill(dtt);
                SubLV.DataSource = dtt;
                SubLV.DataBind();
            }
        }
    }

    public void send_mail(string name = "txname.Text", string phone = "txnumber.Text", string email = "txmail.Text", string City = "txcity.Text", string Message = "txmsg.Text")
    {
        con.Open();
        StringBuilder sb = new StringBuilder();
        sb.AppendLine("Name :- " + txname.Text + "<br>");
        sb.AppendLine("Mobile Number :- " + txnumber.Text + "<br>");
        sb.AppendLine("Email :- " + txmail.Text + "<br>");
        sb.AppendLine("City :- " + txcity.Text + "<br>");
        sb.AppendLine("Message :- " + txmsg.Text + "<br>");

        string to = "omsharma9367@gmail.com";
        string from = "omopyt2020@gmail.com"; //From address    
        MailMessage message = new MailMessage(from, to);

        //string mailbody = "This is Your";
        message.Subject = "Hotel Booking details : ";
        message.Body = sb.ToString();
        message.BodyEncoding = Encoding.UTF8;
        message.IsBodyHtml = true;
        SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
        System.Net.NetworkCredential basicCredential1 = new
        System.Net.NetworkCredential("omopyt2020@gmail.com", "heongwrmwhcgxmrp");
        client.EnableSsl = true;
        client.UseDefaultCredentials = false;
        client.Credentials = basicCredential1;
        client.Send(message);
        con.Close();
    }

}