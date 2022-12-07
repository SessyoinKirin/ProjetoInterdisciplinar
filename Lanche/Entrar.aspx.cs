using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Security;

public partial class Entrar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["UNAME"] != null && Request.Cookies["PWD"] != null)
            {
                Usuario.Text = Request.Cookies["UNAME"].Value;
                Senha.Attributes["value"] = Request.Cookies["PWD"].Value;
                CheckBox1.Checked = true;
            }
        }
    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        string txt1 = Senha.Text, txt2 = "";
        int numc = 0, num = 0;
        numc = txt1.Length;
        for (int i = 0; i < numc; i++)
        {
            num = Convert.ToInt16(txt1[i]) + 10;
            txt2 += Convert.ToChar(num);

        }

        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("select * from Usuario where usu_usuario='" + Usuario.Text + "' and usu_senha='" + txt2 + "'", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                Session["Usuario"] = dt.Rows[0]["usu_id"].ToString();
                Session["Email"] = dt.Rows[0]["usu_email"].ToString();

                if (CheckBox1.Checked)
                {
                    Response.Cookies["UNAME"].Value = Usuario.Text;
                    Response.Cookies["PWD"].Value = Senha.Text;

                    Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(15);
                    Response.Cookies["PWD"].Expires = DateTime.Now.AddDays(15);
                }
                else
                {
                    Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["PWD"].Expires = DateTime.Now.AddDays(-1);
                }

                string Utype;
                Utype = dt.Rows[0][13].ToString().Trim();

                if (Utype == "User")
                {
                    Session["usu_usuario"] = Usuario.Text;
                    if (Request.QueryString["ReturnUrl"] == null)
                    {
                        Response.Redirect("~/Index.aspx");
                    }
                    else
                    {
                        Response.Redirect(Request.QueryString["ReturnUrl"]);
                    }
                    if (Request.QueryString["rurl"] != null)
                    {
                        if (Request.QueryString["rurl"] == "Carrinho")
                        {
                            Response.Redirect("~/Carrinho.aspx");
                        }
                    }
                    else
                    {
                        Response.Redirect("~/Index.aspx");
                    }
                }
                if (Utype == "Admin")
                {
                    Session["USERNAME"] = Usuario.Text;
                   
                    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket("Admin",true,30);
                    Response.Cookies[".aspxauth"].Value = FormsAuthentication.Encrypt(ticket);
                    if (Request.QueryString["ReturnUrl"] == null)
                    {
                        Response.Redirect("~/AdminHome.aspx");
                    }
                    else
                    {
                        Response.Redirect("~/AdminHome.aspx");
                    }


                }


            }
            else
            {
                lblerro.Text = "Senha ou Usuario invalidos!";
            }
        }

    }
}