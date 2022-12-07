using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System;

public partial class Cadastro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btcadastro_Click(object sender, EventArgs e)
    {
      
        if (txtusu.Text != "" & txtsenha.Text != "" && txtnome.Text != "" && txtemail.Text != "" && txtconfirmasen.Text != "")
        {
            if (txtsenha.Text == txtconfirmasen.Text)
            {
                String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
                string txt1 = txtsenha.Text, txt2 = "";
                int numc = 0, num = 0;
                numc = txt1.Length;
                for (int i = 0; i < numc; i++)
                {
                    num = Convert.ToInt16(txt1[i]) + 10;
                    txt2 += Convert.ToChar(num);

                }
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("insert into Usuario values ('" + txtnome.Text + "','" + txt2 + "','" + txt2 + "','" + txtemail.Text + "','" + txtusu.Text + "','" + txtcel.Text + "','" + txtcidade.Text + "','" + txtendereco.Text + "','" + txtnumero.Text + "','" + txtbairro.Text + "','" + txtuf.Text + "','" + txtcep.Text + "','User')", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>" +
                "alert('Cadastrado com sucesso!!');" +
                "window.location.replace('Entrar.aspx')" +
                "</script>");
                  
                }
            }
            else
            {
                Label1.ForeColor = Color.Red;
                Label1.Text = "Senhas não conferem";
            }
        }
        else
        {
            Label1.ForeColor = Color.Red;
            Label1.Text = "Todos os campos são obrigatorios";

        }




    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        Session["usu_usuario"] = null;
        Response.Redirect("~/Entrar.aspx");
    }

  
}