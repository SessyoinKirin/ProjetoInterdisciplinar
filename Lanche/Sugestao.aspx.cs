using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sugestao : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnc_Click(object sender, EventArgs e)
    {
      
          
            DataTable dt = new DataTable();
            
            string email = lblemail.Text;
             string des = desc.Text;
        string ass = assunto.Text;
                //enviar o email
                
                String EmailBody = "Ola " + email + " Estou enviando esse emai para tratar do assunto " + ass + "," +
            "Descrição:" + des+"" ;
                MailMessage PassRecMail = new MailMessage("fatecgtaads@gmail.com", email);
                PassRecMail.Body = EmailBody;
                PassRecMail.IsBodyHtml = true;
                PassRecMail.Subject = "Sugestão";

                //SmtpClient SMTP = new SmtpClient("smtp-mail.outlook.com", 587);
                SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
                SMTP.Credentials = new NetworkCredential()
                {
                    UserName = "fatecgtaads@gmail.com",
                    Password = "sgkphybswjbbbthy"
                };
                SMTP.EnableSsl = true;
                SMTP.Send(PassRecMail);

                Response.Redirect("~/Sugestao.aspx");



    }
}