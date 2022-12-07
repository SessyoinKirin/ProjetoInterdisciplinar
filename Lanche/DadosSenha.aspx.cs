using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DadosSenha : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        carrinhocont();
        if (Session["usu_usuario"] != null)
        {
            btnsair.Visible = true;
            btnlogin.Visible = false;
            btndrop.Visible = true;
            lblSucesso.Text = "Bem Vindo, " + Session["usu_usuario"].ToString() + "";
        }
        else
        {
            btnsair.Visible = false;
            btnlogin.Visible = true;
            btndrop.Visible = false;
            Response.Redirect("~/Entrar.aspx");
        }
    }

    protected void btnsair_Click(object sender, EventArgs e)
    {
        Session["usu_usuario"] = null;
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
    public void carrinhocont()
    {
        // Response.Cookies["car_id"].Expires = DateTime.Now.AddDays(-1);
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

    protected void btnalterar_Click(object sender, EventArgs e)
    {
        
    }
}