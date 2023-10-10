using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class register : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["travelzCnn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnRegister_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into SignUp (Fname, Lname, Mobile, Email, Password) values ('" + txtfname.Text + "','" + txtlname.Text + "','" + txtmobile.Text + "','" + txtemail.Text + "','" + txtpassword.Text + "') ", con);
        cmd.ExecuteNonQuery();
        send_mail(txtfname.Text, txtlname.Text, txtemail.Text, txtmobile.Text, txtpassword.Text);
        clear();
        con.Close();
    }

    public void send_mail(string fname, string lname, string email, string mobile, string password)
    {

        //con.Open();
        StringBuilder sb = new StringBuilder();
        sb.AppendLine("First Name :- " + fname + "<br>");
        sb.AppendLine("Last Name :- " + lname + "<br>");
        sb.AppendLine("Email :- " + email + "<br>");
        sb.AppendLine("Mobile :- " + mobile + "<br>");
        sb.AppendLine("Password :- " + password + "<br>");
        string to = txtemail.Text;
        string from = "omopyt2020@gmail.com"; //From address    
        MailMessage message = new MailMessage(from, email);

        //string mailbody = "This is Your";
        message.Subject = "Registration Information On Places To Go : ";
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
        //con.Close();
    }

    public void clear()
    {
        txtfname.Text = "";
        txtlname.Text = "";
        txtmobile.Text = "";
        txtemail.Text = "";
        txtpassword.Text = "";
        txtconfirmpassword.Text = "";
    }

    private bool IsValidMobileNumber(string mobileNumber)
    {
        var regex = new Regex(@"^[6-9]\d{9}$");
        return regex.IsMatch(mobileNumber) && mobileNumber.Length == 10;
    }
    protected void txtmobile_TextChanged(object sender, EventArgs e)
    {
        string inputMobileNumber = txtmobile.Text;
        if (IsValidMobileNumber(inputMobileNumber))
        {
            lblmobile.Text = "";
        }
        else
        {
            lblmobile.Visible = true;
            lblmobile.Text = "Invalid mobile number. The number must be start from 6-9 & of 10 digit length.";
        }
    }

    private bool IsValidEmail(string email)
    {
        var regex = new Regex(@"^[\w!#$%&'*+\-/=?\^_`{|}~]+(\.[\w!#$%&'*+\-/=?\^_`{|}~]+)*" + "@" + @"((([\-\w]+\.)+[a-zA-Z]{2,4})|(([0-9]{1,3}\.){3}[0-9]{1,3}))$");
        return regex.IsMatch(email);
    }
    protected void txtemail_TextChanged(object sender, EventArgs e)
    {
        string inputEmail = txtemail.Text;
        if (IsValidEmail(inputEmail))
        {
            lblemail.Text = "";
        }
        else
        {
            lblemail.Visible = true;
            lblemail.Text = "Invalid email address or in invalid format";
        }
    }

    private bool IsValidPassword(string password)
    {
        var regex = new Regex(@"^\d{4}$");
        return regex.IsMatch(password);
    }
    protected void txtpassword_TextChanged(object sender, EventArgs e)
    {
        string inputPassword = txtpassword.Text;
        if (IsValidPassword(inputPassword) && inputPassword.Length >= 4)
        {
            lblpassword.Text = "";
        }
        else
        {
            lblpassword.Visible = true;
            lblpassword.Text = "Password must be at least 4 character/digit length";
        }

        string password = txtpassword.Text;

        bool hasLetter = false;
        bool hasDigit = false;

        foreach (char c in password)
        {
            if (char.IsLetter(c))
            {
                hasLetter = true;
            }
            if (char.IsDigit(c))
            {
                hasDigit = true;
            }
            if (hasLetter && hasDigit)
            {
                break;
            }
        }

        if (hasLetter && hasDigit)
        {
            lblpassword.Text = "";
        }
        else
        {
            lblpassword.Visible = true;
            lblpassword.Text = "Invalid password. Password must contain at least one letter and one number.";
        }
    }
    protected void txtconfirmpassword_TextChanged(object sender, EventArgs e)
    {
        string password = txtpassword.Text;
        string confirmPassword = txtconfirmpassword.Text;
        if (password == confirmPassword)
        {
            lblconfirmpassword.Text = "";
        }
        else
        {
            lblconfirmpassword.Visible = true;
            lblconfirmpassword.Text = "Passwords do not match.";
        }

    }
}