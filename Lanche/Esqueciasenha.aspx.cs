using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Esqueciasenha : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btncrecsenha_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("select * from Usuario where usu_email='" + txtemail.Text + "'", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                String myGUID = Guid.NewGuid().ToString();
                int usu_id = Convert.ToInt32(dt.Rows[0][0]);
                SqlCommand cmd1 = new SqlCommand("insert into RecuperarSenha values('" + myGUID + "','" + usu_id + "',getdate())", con);
                cmd1.ExecuteNonQuery();

                //enviar o email
                String ToEmailAddress = dt.Rows[0][4].ToString();
                String Usuario = dt.Rows[0][5].ToString();
                String EmailBody = "Ola " + Usuario + ",<br/><br/> Click no link a abaixo para resetar sua senha <br/><br/> http://localhost:50762/Recuperarsenha.aspx?usu_id=" + myGUID;
                MailMessage PassRecMail = new MailMessage("fatecgtaads@gmail.com", ToEmailAddress);
                PassRecMail.Body = EmailBody;
                PassRecMail.IsBodyHtml = true;
                PassRecMail.Subject = "Resetar Senha";

                //SmtpClient SMTP = new SmtpClient("smtp-mail.outlook.com", 587);
                SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
                SMTP.Credentials = new NetworkCredential()
                {
                    UserName = "fatecgtaads@gmail.com",
                    Password = "sgkphybswjbbbthy"
                };
                SMTP.EnableSsl = true;
                SMTP.Send(PassRecMail);

                lblrecsenha.Text = "Verifique seu E-mail para trocar a senha";
                lblrecsenha.ForeColor = Color.Green;

            }
            else
            {
                lblrecsenha.Text = "Esse E-mail não existe!";
                lblrecsenha.ForeColor = Color.Red;
            }
        }

    }


}
