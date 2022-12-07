using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Carrinho : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            linkprodcarrinho();
        }
    }

    private void linkprodcarrinho()
    {

        if (Request.Cookies["car_id"] != null)
        {
            string cookiedat = Request.Cookies["car_id"].Value.Split('=')[1];
            string[] cookiedatarray = cookiedat.Split(',');
            if (cookiedatarray.Length > 0)
            {
                h5nomeitem.InnerText = "Itens do carrinho: " + cookiedatarray.Length + " ";
                DataTable dtusuprod = new DataTable();
                Int64 carrinhototal = 0;
                for (int i = 0; i < cookiedatarray.Length; i++)
                {

                    string pid = cookiedatarray[i].ToString().Split('-')[0];
                    String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        using (SqlCommand cmd = new SqlCommand(" SELECT pr.*,pm.*, pm.prodimg_nome as ImageNome,pr.prod_Id as pid from Produtos pr cross apply(select top 1 pm.prodimg_nome, pm.prodimg_extensao from Produtosimg pm where pm.prod_id = pr.prod_Id ) pm where pr.prod_Id = " + pid + " ", con))



                        {
                            cmd.CommandType = CommandType.Text;
                            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                            {

                                sda.Fill(dtusuprod);



                            }


                        }
                    }
                    carrinhototal += Convert.ToInt64(dtusuprod.Rows[i]["prod_precovenda"]);
                }
                reptcarprod.DataSource = dtusuprod;
                reptcarprod.DataBind();
                precototal.Visible = true;
                spprectotal.InnerText = "R$ " + carrinhototal.ToString();
            }
            else
            {
                h5nomeitem.InnerText = "Seu carrinho está vazio";
                precototal.Visible = false;
            }
        }
        else
        {
            h5nomeitem.InnerText = "Seu carrinho está vazio";
            precototal.Visible = false;
        }
    }

    protected void btnremovcarrinho_Click(object sender, EventArgs e)
    {
        string cookieid = Request.Cookies["car_id"].Value.Split('=')[1];

        Button btn = (Button)(sender);
        string prod_id = btn.CommandArgument;

        List<string> cookieidlist = cookieid.Split(',').Select(i => i.Trim()).Where(i => i != string.Empty).ToList();
        cookieidlist.Remove(prod_id);
        string cookiepidup = string.Join(",", cookieidlist.ToArray());
        if (cookiepidup == "")
        {
            HttpCookie carrinho = new HttpCookie("car_id");
            carrinho.Values["car_id"] = null;
            carrinho.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(carrinho);
        }
        else
        {
            HttpCookie carrinho = new HttpCookie("car_id");
            carrinho.Values["car_id"] = cookiepidup;
            carrinho.Expires = DateTime.Now.AddDays(30);
            Response.Cookies.Add(carrinho);
        }
        Response.Redirect("~/Carrinho.aspx");
    }

    protected void btncompra_Click(object sender, EventArgs e)
    {
        if (Session["usu_usuario"] != null)
        {
            Response.Redirect("~/Pagamento.aspx");
        }
        else
        {
            Response.Redirect("~/Entrar.aspx?rurl=Carrinho");
        }
    }
}