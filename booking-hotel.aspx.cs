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

public partial class booking_hotel : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["travelzCnn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            BindListView();
            lv_hotels_sub();
        }
    }
    protected void BtnBooking_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO HotelBooking (name, phone, email, city, checkin, checkout, totalrooms, roomtype, adult_no, children_no, min_price, max_price, status, date) VALUES ('" + txtname.Text + "','" + txtphone.Text + "','" + txtemail.Text + "','" + selectsearch.Text + "','" + txtcheckin.Text + "','" + txtcheckout.Text + "','" + ddl_totalrooms.SelectedItem.Value + "','" + ddl_roomtype.SelectedItem.Value + "','" + ddl_adults.SelectedItem.Value + "','" + ddl_childrens.SelectedItem.Value + "','" + ddl_minprice.SelectedItem.Value + "','" + ddl_maxprice.SelectedItem.Value + "','1',getdate())", con);
        cmd.ExecuteNonQuery();
        con.Close();
        send_mail(txtname.Text, txtphone.Text, txtemail.Text, selectsearch.Text, txtcheckin.Text, txtcheckout.Text, ddl_totalrooms.SelectedItem.Value,ddl_roomtype.SelectedItem.Value, ddl_adults.SelectedItem.Value, ddl_childrens.SelectedItem.Value, ddl_minprice.SelectedItem.Value, ddl_maxprice.SelectedItem.Value);
        clear();
        //Display success message.
        string message = "Thank you for Hotel Booking with us! Our team will contact you shortly!";
        string script = "window.onload = function(){ alert('";
        script += message;
        script += "')};";
        ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
    }
    public void clear()
    {
        txtname.Text = "";
        txtphone.Text = "";
        txtemail.Text = "";
        selectsearch.Text = "";
        txtcheckin.Text = "";
        txtcheckout.Text = "";
        this.ddl_totalrooms.ClearSelection();
        this.ddl_roomtype.ClearSelection();
        this.ddl_adults.ClearSelection();
        this.ddl_childrens.ClearSelection();
        this.ddl_adults.ClearSelection();
        this.ddl_maxprice.ClearSelection();
    }
    public void send_mail(string name = "txtname.Text", string phone = "txtphone.Text", string email = "txtemail.Text", string city = "selectsearch.Text", string checkin = "txtchekin.Text", string checkout = "txtcheckout.Text", string totalrooms = "ddl_totalrooms.SelectedItem.Value",string roomtype = "ddl_roomtype.SelectedItem.Value", string adults = "ddl_adults.SelectedItem.Value", string childrens = "ddl_childrens.SelectedItem.Value", string MinPrice = "ddl_minprice.SelectedItem.Value", string MaxPrice = "ddl_maxprice.SelectedItem.Value")
    {
        con.Open();
        StringBuilder sb = new StringBuilder();
        sb.AppendLine("Name :- " + txtname.Text + "<br>");
        sb.AppendLine("Mobile Number :- " + txtphone.Text + "<br>");
        sb.AppendLine("Email :- " + txtemail.Text + "<br>");
        sb.AppendLine("City / Destination :- " + selectsearch.Text + "<br>");
        sb.AppendLine("Check In :- " + txtcheckin.Text + "<br>");
        sb.AppendLine("Check Out :- " + txtcheckout.Text + "<br>");
        sb.AppendLine("Total No Of Rooms :- " + ddl_totalrooms.SelectedItem.Value + "<br>");
        sb.AppendLine("Room Type :- " + ddl_roomtype.SelectedItem.Value + "<br>");
        sb.AppendLine("No of adults :- " + ddl_adults.SelectedItem.Value + "<br>");
        sb.AppendLine("No of childrens :- " + ddl_childrens.SelectedItem.Value + "<br>");
        sb.AppendLine("Min Price :- " + ddl_minprice.SelectedItem.Value + "<br>");
        sb.AppendLine("Max Price :- " + ddl_maxprice.SelectedItem.Value + "<br>");

        string to = "omsharma9367@gmail.com";
        string from = "omopyt2020@gmail.com"; //From address    
        MailMessage message = new MailMessage(from, to);

        //string mailbody = "This is Your";
        message.Subject = "Travelz Hotel Booking details : ";
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

    public void BindListView()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT it.*,cn.* FROM TourDetails AS it INNER JOIN place_table AS cn on it.place_id=cn.Id", con);
        SqlDataReader reader = cmd.ExecuteReader();
        lv_place.DataSource = reader;
        lv_place.DataBind();
        con.Close();

        con.Open();
        SqlCommand cmd2 = new SqlCommand("select * from hotel_details where status =1 ", con);
        SqlDataReader reader2 = cmd2.ExecuteReader();
        lv_hotels.DataSource = reader2;
        lv_hotels.DataBind();
        con.Close();

        con.Open();
        SqlCommand cmd3 = new SqlCommand("select et.* , hd.hotelimage from EventsTable as et Inner join hotel_details as hd on et.eventHotelNameId=hd.Id", con);
        SqlDataReader reader3 = cmd3.ExecuteReader();
        lv_events.DataSource = reader3;
        lv_events.DataBind();
        con.Close();

        con.Open();
        SqlCommand cmd8 = new SqlCommand("SELECT Id, hotel, hotelimage, city, state, country FROM hotel_details", con);
        SqlDataReader reader8 = cmd8.ExecuteReader();
        lv_SuggestingPackages.DataSource = reader8;
        lv_SuggestingPackages.DataBind();
        con.Close();

        con.Open();
        SqlCommand cmd9 = new SqlCommand("SELECT package_id, package_name, SUBSTRING(package_desc, 1, 25) AS package_desc, package_price, package_place, package_image, status, rts, package_rating FROM package_table where status = 1", con);
        SqlDataReader reader9 = cmd9.ExecuteReader();
        lv_SuggestingPackages2.DataSource = reader9;
        lv_SuggestingPackages2.DataBind();
        con.Close();
    }

    public void lv_hotels_sub()
    {
        for (int i = 0; i < lv_hotels.Items.Count; i++)
        {
            ListView hotels_SubLV = lv_hotels.Items[i].FindControl("lv_hotels_sub") as ListView;
            Label lblid = lv_hotels.Items[i].FindControl("lblid") as Label;

            using (SqlDataAdapter sda1 = new SqlDataAdapter("select price_per_night from hotel_details_sub where hotel_id =Id", con))
            {
                DataTable dtt = new DataTable();
                sda1.Fill(dtt);
                hotels_SubLV.DataSource = dtt;
                hotels_SubLV.DataBind();
            }
        }
    }
}