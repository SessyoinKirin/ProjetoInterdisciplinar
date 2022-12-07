using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Recuperarsenha : System.Web.UI.Page
{
    String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
    String GUIDvalue;
    DataTable dt = new DataTable();
    int usuid  ;
    protected void Page_Load(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            GUIDvalue = Request.QueryString["usu_id"];
            if (GUIDvalue != null)
            {
                SqlCommand cmd = new SqlCommand("select * from RecuperarSenha where id='" + GUIDvalue + "'", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    usuid = Convert.ToInt32(dt.Rows[0][1]);
                }
                else
                {
                    lblmsg.Text = "O Link de resetar a senha foi expirado, envie outra solicitação";
                    lblmsg.ForeColor = Color.Red;
                }

            }
            else
            {
                Response.Redirect("~/Index.aspx");
            }
        }

        if (!IsPostBack)
        {
            if (dt.Rows.Count != 0)
            {
                lblsenha.Visible = true;
                lblconfsenha.Visible = true;
                txtnovasenha.Visible = true;
                txtconfsenha.Visible = true;
                btncrec.Visible = true;
            }
            else
            {
                lblmsg.Text = "O Link de resetar a senha foi expirado ou está invalidado tente novamente";
                lblmsg.ForeColor = Color.Red;
            }
        }

    }

    protected void btncrec_Click(object sender, EventArgs e)
    {
        if (txtnovasenha.Text != "" && txtconfsenha.Text != "" && txtnovasenha.Text == txtconfsenha.Text)
        {
            string txt1 = txtnovasenha.Text, txt2 = "";
            int numc = 0, num = 0;
            numc = txt1.Length;
            for (int i = 0; i < numc; i++)
            {
                num = Convert.ToInt16(txt1[i]) + 10;
                txt2 += Convert.ToChar(num);

            }
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("update Usuario set usu_senha='" + txt2 + "',usu_confirsenha='" + txt2 + "' where usu_id='" + usuid + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                SqlCommand cmd2 = new SqlCommand("delete from RecuperarSenha where usu_id='" + usuid + "'", con);
                cmd2.ExecuteNonQuery();
                Response.Write("<script>" +
                       "alert('Senha alterada com sucesso!!');" +
                       "window.location.replace('Entrar.aspx')" +
                       "</script>");
                //Response.Redirect("~/Entrar.aspx");
            }
        }
    }
}