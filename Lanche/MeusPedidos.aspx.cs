using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class MeusPedidos : System.Web.UI.Page
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

        if (!IsPostBack)
        {
            statuspendente();
            statuspreparando();
            statusenviado();
            statusconcluido();
            statuspendente1();
            statuspreparando1();
            statusenviado1();
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

    private void statuspendente()
    {
        string usuid = Session["Usuario"].ToString();
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Pagamento p INNER JOIN Produtos t on t.prod_id = p.prod_id where pag_envio = 'Enviar' and pag_status = 'Aceito' and usu_id = " + usuid + "order by pag_data asc", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtusuprod = new DataTable();
                    sda.Fill(dtusuprod);
                    reppedido.DataSource = dtusuprod;
                    reppedido.DataBind();
                }


            }
        }
    }

    private void statuspreparando()
    {
        string usuid = Session["Usuario"].ToString();
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Pagamento p INNER JOIN Produtos t on t.prod_id = p.prod_id where pag_envio = 'Enviar' and pag_status = 'Preparo' and usu_id = " + usuid + "order by pag_data asc", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtusuprod = new DataTable();
                    sda.Fill(dtusuprod);
                    reppreparando.DataSource = dtusuprod;
                    reppreparando.DataBind();
                }


            }
        }
    }

    private void statusenviado()
    {
        string usuid = Session["Usuario"].ToString();
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Pagamento p INNER JOIN Produtos t on t.prod_id = p.prod_id where pag_envio = 'Enviar' and pag_status = 'Entrega' and usu_id = " + usuid + " order by pag_data asc", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtusuprod = new DataTable();
                    sda.Fill(dtusuprod);
                    repenviado.DataSource = dtusuprod;
                    repenviado.DataBind();
                }


            }
        }
    }

    private void statusconcluido()
    {
        string usuid = Session["Usuario"].ToString();
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Pagamento p INNER JOIN Produtos t on t.prod_id = p.prod_id where pag_status = 'Concluido' and usu_id = " + usuid + "order by pag_data desc", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtusuprod = new DataTable();
                    sda.Fill(dtusuprod);
                    repconcluido.DataSource = dtusuprod;
                    repconcluido.DataBind();
                }


            }
        }
    }

    private void statuspendente1()
    {
        string usuid = Session["Usuario"].ToString();
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Pagamento p INNER JOIN Produtos t on t.prod_id = p.prod_id where pag_envio = 'Retirar' and pag_status = 'Aceito' and usu_id = " + usuid + "order by pag_data asc", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtusuprod = new DataTable();
                    sda.Fill(dtusuprod);
                    reppedido1.DataSource = dtusuprod;
                    reppedido1.DataBind();
                }


            }
        }
    }

    private void statuspreparando1()
    {
        string usuid = Session["Usuario"].ToString();
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Pagamento p INNER JOIN Produtos t on t.prod_id = p.prod_id where pag_envio = 'Retirar' and pag_status = 'Preparo' and usu_id = " + usuid + "order by pag_data asc", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtusuprod = new DataTable();
                    sda.Fill(dtusuprod);
                    reppreparando1.DataSource = dtusuprod;
                    reppreparando1.DataBind();
                }


            }
        }
    }

    private void statusenviado1()
    {
        string usuid = Session["Usuario"].ToString();
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Pagamento p INNER JOIN Produtos t on t.prod_id = p.prod_id where pag_envio = 'Retirar' and pag_status = 'Entrega' and usu_id = " + usuid + " order by pag_data asc", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtusuprod = new DataTable();
                    sda.Fill(dtusuprod);
                    repenviado1.DataSource = dtusuprod;
                    repenviado1.DataBind();
                }


            }
        }
    }

}