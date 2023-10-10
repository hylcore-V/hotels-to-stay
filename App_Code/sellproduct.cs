using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for sellproduct
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
[System.Web.Script.Services.ScriptService]
public class sellproduct : System.Web.Services.WebService
{

    public sellproduct()
    {
        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    //--------------------ProductSearch-----------------------------------
    [WebMethod]
    public string[] FromSearch(string prefixText, int count)
    {
        //if (Session["paid"] == "and Paid='Debit'")
        //{
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["travelzCnn"].ConnectionString);
        count = 10;
        string[] str;
        string SearchWord = "";
        char[] C = { ' ' };
        str = prefixText.Split(C, StringSplitOptions.RemoveEmptyEntries);
        int i;
        for (i = 0; i < str.Length; i++)
        {
            SearchWord = SearchWord + str[i];
            if (i == str.Length - 1) break;
            SearchWord = SearchWord + " near ";
        }
        SearchWord = SearchWord.Replace(".", " ");
        SearchWord = SearchWord.Replace(",", " ");
        SearchWord = SearchWord.Replace(")", " ");
        SearchWord = SearchWord.Replace("(", " ");

        using (SqlDataAdapter sda = new SqlDataAdapter(new SqlCommand("Select top 10 'keywords'= place from place_table where place like '%" + prefixText + "%' order by keywords", con)))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            string[] items = new string[dt.Rows.Count];
            i = 0;
            foreach (DataRow dr in dt.Rows)
            {
                items.SetValue(dr["keywords"].ToString(), i);
                i++;
            }
            return items;
        }
    }
}