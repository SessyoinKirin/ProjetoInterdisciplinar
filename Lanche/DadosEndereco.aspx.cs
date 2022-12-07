using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DadosEndereco : System.Web.UI.Page
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
            linkdados();
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

    protected void btnalterar_Click(object sender, EventArgs e)
    {
        string cep = txtcep.Value;
        string endereco = txtendereco.Value;
        string numero = txtnumero.Value;
        string bairro = txtbairro.Value;
        string cidade = txtcidade.Value;
        string uf = txtuf.Value;
        string cookiname = Request.Cookies["UNAME"].Value;
        Int64 usuid = Convert.ToInt64(Request.QueryString["usu_Id"])+1;
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        if (cookiname == cookiname)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("update Usuario set usu_cep='" + cep + "',usu_endereco='" + endereco + "', usu_numero='" + numero + "',usu_bairro='" + bairro + "',usu_cidade='" + cidade + "',usu_uf='" + uf + "' where usu_usuario='" + cookiname + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();


            }
        }
        Response.Write("<script>" +
                       "alert('Informações alteradas com sucesso!!');" +
                       "window.location.replace('DadosEndereco.aspx?usu_Id='+usuid)" +
                       "</script>");
        //Response.Redirect("~/DadosEndereco.aspx?usu_Id=" + usuid);
    }

    private void linkdados()
    {
       
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {

            string cookiname = Request.Cookies["UNAME"].Value;
            using (SqlCommand cmd = new SqlCommand("select usu_cep,usu_endereco,usu_numero,usu_bairro, usu_cidade, usu_uf from Usuario where usu_usuario='" + cookiname + "' ", con))
            {
                Int64 usuid = Convert.ToInt64(Request.QueryString["usu_cep"]);
                con.Open();
                cmd.CommandType = CommandType.Text;
                SqlDataReader dr;
                dr = cmd.ExecuteReader();
                dr.Read();
                txtcep.Value = dr.GetString(0);
                txtendereco.Value = dr.GetString(1);
                txtnumero.Value = dr.GetInt32(2).ToString();
                txtbairro.Value = dr.GetString(3);
                txtcidade.Value = dr.GetString(4);
                txtuf.Value = dr.GetString(5);
            }
        }
    }
}