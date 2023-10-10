using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class booking : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["travelzCnn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtnBooking_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO BookingTourPackage (name, phone, email, city, package, arrival_date, departure_date, adult_no, children_no, min_price, max_price, status, date) VALUES ('" + txtname.Text + "','" + txtphone.Text + "','" + txtemail.Text + "','" + selectsearch.Text + "','" + ddl_packages.SelectedItem.Value + "','" + txtArrivalDate.Text + "','" + txtDepartureDate.Text + "','" + ddl_adults.SelectedItem.Value + "','" + ddl_childrens.SelectedItem.Value + "','" + ddl_minprice.SelectedItem.Value + "','" + ddl_maxprice.SelectedItem.Value + "','1',getdate())", con);
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        con.Close();
        send_mail(txtname.Text, txtphone.Text, txtemail.Text, selectsearch.Text, ddl_packages.SelectedItem.Value, txtArrivalDate.Text, txtDepartureDate.Text, ddl_adults.SelectedItem.Value, ddl_childrens.SelectedItem.Value, ddl_minprice.SelectedItem.Value, ddl_maxprice.SelectedItem.Value);
        clear();
        //Display success message.
        string message = "Thank you for arranging a wonderful trip for us! Our team will contact you shortly!";
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
        txtArrivalDate.Text = "";
        txtDepartureDate.Text = "";
        this.ddl_adults.ClearSelection();
        this.ddl_childrens.ClearSelection();
        this.ddl_adults.ClearSelection();
        this.ddl_maxprice.ClearSelection();
        this.ddl_packages.ClearSelection();
    }
    public void send_mail(string name = "txtname.Text", string phone = "txtphone.Text", string email = "txtemail.Text", string city = "selectsearch.Text", string package = "ddl_packages.SelectedItem.Value",
        string ArrivalDate = "txtArrivalDate.Text", string DepartureDate = "txtDepartureDate.Text",
        string adults = "ddl_adults.SelectedItem.Value", string childrens = "ddl_childrens.SelectedItem.Value", string MinPrice = "ddl_minprice.SelectedItem.Value", string MaxPrice = "ddl_maxprice.SelectedItem.Value")
    {
        con.Open();
        StringBuilder sb = new StringBuilder();
        sb.AppendLine("Name :- " + txtname.Text + "<br>");
        sb.AppendLine("Mobile Number :- " + txtphone.Text + "<br>");
        sb.AppendLine("Email :- " + txtemail.Text + "<br>");
        sb.AppendLine("City :- " + selectsearch.Text + "<br>");
        sb.AppendLine("Selected package :- " + ddl_packages.SelectedItem.Value + "<br>");
        sb.AppendLine("Arrival Date :- " + txtArrivalDate.Text + "<br>");
        sb.AppendLine("Departure Date :- " + txtDepartureDate.Text + "<br>");
        sb.AppendLine("No of adults :- " + ddl_adults.SelectedItem.Value + "<br>");
        sb.AppendLine("No of childrens :- " + ddl_childrens.SelectedItem.Value + "<br>");
        sb.AppendLine("Min Price :- " + ddl_minprice.SelectedItem.Value + "<br>");
        sb.AppendLine("Max Price :- " + ddl_maxprice.SelectedItem.Value + "<br>");

        string to = "omsharma9367@gmail.com";
        string from = "omopyt2020@gmail.com"; //From address    
        MailMessage message = new MailMessage(from, to);

        //string mailbody = "This is Your";
        message.Subject = "Travelz Booking by Email details : ";
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