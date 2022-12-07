using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListaProdutos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            linktipo();
            linktipo1();
        }
    }

    private void linktipo()
    {
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Produtos p INNER JOIN Tipo t on t.tipo_id = p.tipo_id where prod_status = 1", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtusuprod = new DataTable();
                    sda.Fill(dtusuprod);
                    repprod.DataSource = dtusuprod;
                    repprod.DataBind();
                }


            }
        }
    }

    private void linktipo1()
    {
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Produtos p INNER JOIN Tipo t on t.tipo_id = p.tipo_id where prod_status = 2", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtusuprod = new DataTable();
                    sda.Fill(dtusuprod);
                    repprod1.DataSource = dtusuprod;
                    repprod1.DataBind();
                }


            }
        }
    }



}