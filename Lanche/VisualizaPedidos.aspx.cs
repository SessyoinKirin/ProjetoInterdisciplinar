using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class VisualizaPedidos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Preparo();
            pendente();
            entrega();

            Preparo1();
            pendente1();
            entrega1();

            registro1();
            registro2();
            registro3();
        }
    }
    //numero de quantidade de cada status

    private void registro1()
    {
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) AS total_registros FROM Pagamento where pag_status = 'Aceito'", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtusuprod = new DataTable();
                    sda.Fill(dtusuprod);
                    total1.DataSource = dtusuprod;
                    total1.DataBind();
                }


            }
        }
    }

    private void registro2()
    {
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) AS total_registros FROM Pagamento where pag_status = 'Entrega'", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtusuprod = new DataTable();
                    sda.Fill(dtusuprod);
                    total2.DataSource = dtusuprod;
                    total2.DataBind();
                }


            }
        }
    }

    private void registro3()
    {
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) AS total_registros FROM Pagamento where pag_status = 'Preparo'", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtusuprod = new DataTable();
                    sda.Fill(dtusuprod);
                    total3.DataSource = dtusuprod;
                    total3.DataBind();
                }


            }
        }
    }

    //select de status com endereço


    private void pendente()
    {
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Pagamento p INNER JOIN Produtos t on t.prod_id = p.prod_id where pag_envio = 'Enviar' and pag_status = 'Aceito'", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtusuprod = new DataTable();
                    sda.Fill(dtusuprod);
                    reppedente.DataSource = dtusuprod;
                    reppedente.DataBind();
                }


            }
        }
    }

    private void Preparo()
    {
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Pagamento p INNER JOIN Produtos t on t.prod_id = p.prod_id where pag_envio = 'Enviar' and pag_status = 'Preparo'", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtusuprod = new DataTable();
                    sda.Fill(dtusuprod);
                    reppede.DataSource = dtusuprod;
                    reppede.DataBind();
                }
            }
        }
    }

    private void entrega()
    {
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Pagamento p INNER JOIN Produtos t on t.prod_id = p.prod_id where pag_envio = 'Enviar' and pag_status = 'Entrega'", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtusuprod = new DataTable();
                    sda.Fill(dtusuprod);
                    repentrega.DataSource = dtusuprod;
                    repentrega.DataBind();
                }
            }
        }
    }

    //select de status com retirada

    private void pendente1()
    {
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Pagamento p INNER JOIN Produtos t on t.prod_id = p.prod_id where pag_envio = 'Retirar' and pag_status = 'Aceito'", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtusuprod = new DataTable();
                    sda.Fill(dtusuprod);
                    reppedente1.DataSource = dtusuprod;
                    reppedente1.DataBind();
                }
            }
        }
    }



    private void entrega1()
    {
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Pagamento p INNER JOIN Produtos t on t.prod_id = p.prod_id where pag_envio = 'Retirar' and pag_status = 'Entrega'", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtusuprod = new DataTable();
                    sda.Fill(dtusuprod);
                    repentrega1.DataSource = dtusuprod;
                    repentrega1.DataBind();
                }
            }
        }
    }



    private void Preparo1()
    {
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Pagamento p INNER JOIN Produtos t on t.prod_id = p.prod_id where pag_envio = 'Retirar' and pag_status = 'Preparo'", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtusuprod = new DataTable();
                    sda.Fill(dtusuprod);
                    reppede1.DataSource = dtusuprod;
                    reppede1.DataBind();
                }
            }
        }
    }

    //parte dos botões de update

    protected void btnpreparo(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("WITH CTE AS ( SELECT TOP 1 * FROM Pagamento  where pag_status = 'Aceito' ORDER BY pag_status) UPDATE CTE SET pag_status = 'Preparo'", con);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        Response.Write("<script>" +
                "alert('Pedido aceito com sucesso!!');" +
                "window.location.replace('VisualizaPedidos.aspx')" +
                "</script>");
    }

    protected void btnrejeita(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("WITH CTE AS ( SELECT TOP 1 * FROM Pagamento  where pag_status = 'Aceito' ORDER BY pag_status) UPDATE CTE SET pag_status = 'Rejeitado'", con);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }

    protected void btnentrega(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("WITH CTE AS ( SELECT TOP 1 * FROM Pagamento  where pag_status = 'Preparo' ORDER BY pag_status) UPDATE CTE SET pag_status = 'Entrega'", con);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
        Response.Write("<script>" +
              "alert('Pedido despachado com sucesso!!');" +
              "window.location.replace('VisualizaPedidos.aspx')" +
              "</script>");
    }

    protected void btnconcluir(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("WITH CTE AS ( SELECT TOP 1 * FROM Pagamento where pag_status = 'Entrega' ORDER BY pag_status) UPDATE CTE SET pag_status = 'Concluido'", con);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
        Response.Write("<script>" +
              "alert('Pedido concluido com sucesso!!');" +
              "window.location.replace('VisualizaPedidos.aspx')" +
              "</script>");
    }

    
}