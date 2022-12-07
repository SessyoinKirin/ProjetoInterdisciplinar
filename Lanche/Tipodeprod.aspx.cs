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

public partial class Tipodeprod : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            linktipo();
        }
    }

    private void linktipo()
    {
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Tipo", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dttipo = new DataTable();
                    sda.Fill(dttipo);
                    repTipo.DataSource = dttipo;
                    repTipo.DataBind();
                }


            }
        }
    }

    protected void btnadd_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("insert into Tipo values ('" + txttipoprod.Text + "' )", con);
            con.Open();
            cmd.ExecuteNonQuery();
            txttipoprod.Text = string.Empty;
            Label1.Text = "Produto cadastrado com sucesso";
            Label1.ForeColor = Color.Green;
            Response.Redirect("~/Tipodeprod.aspx");
        }
    }

 

  
}