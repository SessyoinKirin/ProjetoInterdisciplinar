using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class AdminMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            registro3();
        }
    }

    private void registro3()
    {
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) AS total_registros FROM Pagamento where pag_status = 'Aceito' or pag_status = 'Preparo' or pag_status = 'Entrega'", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtusuprod = new DataTable();
                    sda.Fill(dtusuprod);
                    total3.DataSource = dtusuprod;
                    total3.DataBind();
                }


            }
        }
    }

    protected void btnsairadmin_Click(object sender, EventArgs e)
    {
        Session["usu_usuario"] = null;
        Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddDays(-1);
        Response.Cookies["PWD"].Expires = DateTime.Now.AddDays(-1);
        Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(-1);
        
        Session.RemoveAll();
        Session.Abandon();
        Response.Cookies[".aspxauth"].Expires = DateTime.Now.AddDays(-1);
        Response.Write("<script>" +
                       "alert('Logout com sucesso!!');" +
                       "window.location.replace('Index.aspx')" +
                       "</script>");
        // colocar em todos os botao de sair
    }
}
