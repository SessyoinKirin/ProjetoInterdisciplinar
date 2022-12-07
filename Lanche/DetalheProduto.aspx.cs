using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DetalheProduto : System.Web.UI.Page
{

    String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
    
    protected void Page_Load(object sender, EventArgs e)
    {
         

        if (Request.QueryString["prod_id"] != null)
        {
            if (!IsPostBack)
            {
                linkproativo();
                linkimgprod();
                linkpropausado();
            }
        }
        

    }
    

    private void linkproativo()
    {
      
        Int64 prodid = Request.QueryString["prod_id"] == null ? 0 : Convert.ToInt64(Request.QueryString["prod_id"]);
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Produtos p INNER JOIN Tipo t on t.tipo_id = p.tipo_id where prod_status = '1' and prod_id=" + prodid + "", con))
            {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtusuprod = new DataTable();
                    sda.Fill(dtusuprod);
                    reptdet.DataSource = dtusuprod;
                    reptdet.DataBind();


                }


            }
        }
    }

    private void linkpropausado()
    {
        
        Int64 prodid = Request.QueryString["prod_id"] == null ? 0 : Convert.ToInt64(Request.QueryString["prod_id"]);
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Produtos p INNER JOIN Tipo t on t.tipo_id = p.tipo_id where prod_status = '2' and prod_id=" + prodid + "", con))
            {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtusuprod = new DataTable();
                    sda.Fill(dtusuprod);
                    reppausado.DataSource = dtusuprod;
                    reppausado.DataBind();


                }


            }
        }
    }



    protected string GetActiveClass(int ItemIndex)
    {
        if (ItemIndex == 0)
        {
            return "active";
        }
        return "";
    }


    private void linkimgprod()
    {
        Int64 prodid = Convert.ToInt64(Request.QueryString["prod_id"]);
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Produtosimg where prod_id=" + prodid + "", con))
            {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtusuprod = new DataTable();
                    sda.Fill(dtusuprod);
                    reptimg.DataSource = dtusuprod;
                    reptimg.DataBind();


                }


            }
        }

    }


    protected void reptimg_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            
            RadioButtonList rblistmet = e.Item.FindControl("met_nome") as RadioButtonList;
            String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                
            }

        }
    }

    protected void btnpausa_Click(object sender, EventArgs e)
    {
        int status = 2;
    
        Int64 prodid = Convert.ToInt64(Request.QueryString["prod_id"]);
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        if (prodid == prodid)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("update Produtos set prod_status='" + status + "' where prod_Id='" + prodid + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();


            }
        }
        
        Response.Write("<script>" +
                "alert('Pausado com sucesso!!');" +
                "window.location.replace('ListaProdutos.aspx')" +
                "</script>");
    }

    protected void btnativa_Click(object sender, EventArgs e)
    {
        int status = 1;
        
        Int64 prodid = Convert.ToInt64(Request.QueryString["prod_id"]);
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        if (prodid == prodid)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("update Produtos set prod_status='" + status + "' where prod_Id='" + prodid + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();


            }
        }
       
        Response.Write("<script>" +
                "alert('Produto ativado com sucesso!!');" +
                "window.location.replace('ListaProdutos.aspx')" +
                "</script>");
    }

    protected void btnremove_Click(object sender, EventArgs e)
    {
        int status = 3;
        
        Int64 prodid = Convert.ToInt64(Request.QueryString["prod_id"]);
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        if (prodid == prodid)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("update Produtos set prod_status='" + status + "' where prod_Id='" + prodid + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();


            }
        }
       
        Response.Write("<script>" +
                "alert('Produto desativado com sucesso!!');" +
                "window.location.replace('ListaProdutos.aspx')" +
                "</script>");
    }


    protected void btnvoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ListaProdutos.aspx");
    }


}

