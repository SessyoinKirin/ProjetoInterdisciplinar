using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        carrinhocont();
        if (Session["usu_usuario"] != null)
        {
            btnsair.Visible = true;
            btnlogin.Visible = false;
            btncadas.Visible = false;
            btndrop.Visible = true;
            lblSucesso.Text = "Bem Vindo, " + Session["usu_usuario"].ToString() + "";
        }
        else
        {
            btnsair.Visible = false;
            btnlogin.Visible = true;
            btncadas.Visible = true;
            btndrop.Visible = false;
          
        }

       
    }

   

    public void carrinhocont()
    {
       
        if (Request.Cookies["car_id"] != null)
        {
            string cookieid = Request.Cookies["car_id"].Value.Split('=')[1];
            string[] produtarray = cookieid.Split(',');
            int prodcont = produtarray.Length;
            pcount.InnerText = prodcont.ToString();

        }
        else
        {
            pcount.InnerText = 0.ToString();

        }
    }

    protected void btnsair_Click(object sender, EventArgs e)
    {
        Session["usu_usuario"] = null;
        Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddDays(-1);
        Response.Cookies["PWD"].Expires = DateTime.Now.AddDays(-1);
        Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(-1);
        Response.Cookies[".aspxauth"].Expires = DateTime.Now.AddDays(-1);
        Response.Write("<script>" +
                       "alert('Logout com sucesso!!');" +
                       "window.location.replace('Index.aspx')" +
                       "</script>");
    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        Session["usu_usuario"] = null;
        Response.Redirect("~/Entrar.aspx");
    }
    
}