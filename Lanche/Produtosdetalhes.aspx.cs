using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Produtosdetalhes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["prod_id"] != null)
        {
            if (!IsPostBack)
            {
                linkimgprod();
                linkdetpro();

            }
        }

    }

    private void linkdetpro()
    {
        
        Int64 prodid = Request.QueryString["prod_id"] == null ? 0 : Convert.ToInt64(Request.QueryString["prod_id"]);
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Produtos where prod_id=" + prodid + "", con))
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
    protected string GetActiveClass(int ItemIndex)
    {
        if (ItemIndex == 0)
        {
            return "active";
        }
        return "";
    }


    protected void btnvoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Produtosmenu.aspx");
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

    protected void btncarrinho_Click(object sender, EventArgs e)
    {
        
        Int64 PID = Convert.ToInt64(Request.QueryString["prod_id"]);

        if (Request.Cookies["car_id"] != null)
        {
            string cookieid = Request.Cookies["car_id"].Value.Split('=')[1];
            cookieid = cookieid + "," + PID;

            HttpCookie carrinho = new HttpCookie("car_id");
            carrinho.Values["car_id"] = cookieid;
            carrinho.Expires = DateTime.Now.AddDays(30);
            Response.Cookies.Add(carrinho);
        }
        else
        {
            HttpCookie CartProducts = new HttpCookie("car_id");
            CartProducts.Values["car_id"] = PID.ToString();
            CartProducts.Expires = DateTime.Now.AddDays(30);
            Response.Cookies.Add(CartProducts);
        }
        Response.Redirect("~/Produtosdetalhes.aspx?prod_id=" + PID);

    }

}

