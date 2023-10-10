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

public partial class faq : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["travelzCnn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtnContactPage_Click(object sender, EventArgs e)
    {
        send_mail(cntname.Text, cntphone.Text, cntemail.Text, cntcity.Text, cntmsg.Text);
        clear();
        string message = "Thank you for contact us! Our team will contact you shortly!";
        string script = "window.onload = function(){ alert('";
        script += message;
        script += "')};";
        ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
    }
    public void clear()
    {
        cntname.Text = "";
        cntphone.Text = "";
        cntemail.Text = "";
        cntcity.Text = "";
        cntmsg.Text = "";
    }
    public void send_mail(string name = "cntname.Text", string phone = "cntphone.Text", string email = "cntemail.Text", string city = "cntcity.Text", string query = "cntmsg.Text")
    {
        con.Open();
        StringBuilder sb = new StringBuilder();
        sb.AppendLine("Name :- " + cntname.Text + "<br>");
        sb.AppendLine("Mobile Number :- " + cntphone.Text + "<br>");
        sb.AppendLine("Email :- " + cntemail.Text + "<br>");
        sb.AppendLine("City :- " + cntcity.Text + "<br>");
        sb.AppendLine("Query :- " + cntmsg.Text + "<br>");


        string to = "omsharma9367@gmail.com";
        string from = "omopyt2020@gmail.com"; //From address    
        MailMessage message = new MailMessage(from, to);

        //string mailbody = "This is Your";
        message.Subject = "Frequency Asked Questions Places To Go : ";
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