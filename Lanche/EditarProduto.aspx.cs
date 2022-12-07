using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditarProduto : System.Web.UI.Page
{

    String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
    
    protected void Page_Load(object sender, EventArgs e)
    {
         

        if (Request.QueryString["prod_id"] != null)
        {
            if (!IsPostBack)
            {
                linkdetpro();
                linkimgprod();
                linktipo();

            }
        }
        

    }

    private void linktipo()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("select * from Tipo ", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            
            if (dt.Rows.Count != 0)
            {
                droptipo.DataSource = dt;
                droptipo.DataTextField = "tipo_nome";
                droptipo.DataValueField = "tipo_id";
                droptipo.DataBind();

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


    protected void btnalterar_Click(object sender, EventArgs e)
    {
        string nomeprod = Request.Params["txtnomeprod"].ToString();
        string prodcust = Request.Params["txtpreco"].ToString();
        string prodvenda = Request.Params["txtprecovenda"].ToString();
        string prodesc = Request.Params["txtdesc"].ToString();
        string tipo = droptipo.Text;
      
        Int64 prodid = Convert.ToInt64(Request.QueryString["prod_id"]);
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        if (prodid == prodid)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
             SqlCommand cmd = new SqlCommand("update Produtos set prod_nome='" + nomeprod + "',prod_preco='" + prodcust + "', prod_precovenda='" + prodvenda + "',tipo_id='"+ tipo + "',prod_desc='" + prodesc + "' where prod_Id='" + prodid + "'", con);
                con.Open();
               cmd.ExecuteNonQuery();


            }
        }
     
        Response.Write("<script>" +
                "alert('Alterações feita com sucesso!!');" +
                "window.location.replace('ListaProdutos.aspx')" +
                "</script>");
    }

    protected void btnalterarimg_Click(object sender, EventArgs e)
    {
        Int64 prod_id = Convert.ToInt64(Request.QueryString["prod_id"]);
        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            Int64 prodid = Convert.ToInt64(Request.QueryString["prod_id"]);
            string nomeprod = Request.Params["txtnomeprod"].ToString();
            string SavePath1 = Server.MapPath("~/Img/Img_Prod/") + prodid;
                string[] Files = Directory.GetFiles(SavePath1, "*", SearchOption.AllDirectories);
            if (imgup.HasFile)
            {
                foreach (string file in Files)
                {
                    File.Delete(file);
                }
                Directory.Delete(SavePath1);
                SqlCommand cmd = new SqlCommand("delete from Produtosimg where prod_id = '" + prodid + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();




                if (!Directory.Exists(SavePath1))
                {
                    Directory.CreateDirectory(SavePath1);
                }
                string Extention = Path.GetExtension(imgup.PostedFile.FileName);
                imgup.SaveAs(SavePath1 + "\\" + nomeprod + "02" + Extention);

                SqlCommand cmd3 = new SqlCommand("insert into Produtosimg values('" + prodid + "','" + nomeprod + "02" + "','" + Extention + "')", con);
                cmd3.ExecuteNonQuery();

            }
        }
        Response.Redirect("~/EditarProduto.aspx?prod_id=" + prod_id);
    }


        protected void btnvoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ListaProdutos.aspx");
    }


}

