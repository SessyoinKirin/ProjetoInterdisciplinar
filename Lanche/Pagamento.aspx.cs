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

public partial class Pagamento : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["usu_usuario"] != null )
        {
            if (!IsPostBack)
            {
                precodata();
                linkdados();
            }
        }
        else
        {
            Response.Redirect("~/Entrar.aspx");
        }
    }

    public void precodata()
    {
        if(Request.Cookies["car_id"] != null)
        {
            string cookiedat = Request.Cookies["car_id"].Value.Split('=')[1];
            string[] cookiedatarray = cookiedat.Split(',');
            if (cookiedatarray.Length > 0)
            {
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

                precototal.Visible = true;
                spanCartotal.InnerText = "R$" + carrinhototal.ToString();
                hdTotal.Value = carrinhototal.ToString();
               
            }
            else
            {
                Response.Redirect("Produtosmenu.aspx");
            }
        }
        else
        {
            Response.Redirect("Produtosmenu.aspx");
        }
    }


    protected void btnpag_Click(object sender, EventArgs e)
    {
        if (Session["Usuario"] != null)
        {
            string usuid = Session["Usuario"].ToString();
            string pagtipo = rdbpagamento.SelectedValue;
            string pagstatus = "Aceito";
            DateTime datacompra = DateTime.Now;
            string emaild = Session["Email"].ToString();
            string envio = rbmet.SelectedValue;
            string nome = txtnome.Value;

            string cep = txtcep.Value;
            string endereco = txtendereco.Value;
            string numero = txtnumero.Value;
            string bairro = txtbairro.Value;
            string cidade = txtcidade.Value;
            string uf = txtuf.Value;
            string tirarprod = txtdesc.Text;

            string strDate = datacompra.ToString("dd/MM/yyyy");

            string strHr = datacompra.ToString("HH:mm");
           
            string cookiedat = Request.Cookies["car_id"].Value.Split('=')[1];
            string[] cookiedatarray = cookiedat.Split(',');
            for (int i = 0; i < cookiedatarray.Length; i++)
            {
                string pid = cookiedatarray[i].ToString().Split('-')[0];
                if (txtnome.Value != "")
                {
                    String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        SqlCommand cmd = new SqlCommand("insert into Pagamento values ('" + usuid + "','" + nome + "','" + envio + "','" + endereco + "','" + cep + "','" + numero + "','" + hdTotal.Value + "','" + pagtipo + "','" + pagstatus + "','" + strDate + "','"+ strHr + "','" + pid + "','"+ tirarprod + "')", con);
                        con.Open();

                        cmd.ExecuteNonQuery();
                        Label1.Text = "Registrado com sucesso";
                        Label1.ForeColor = Color.Green;
                       
                        Response.Cookies["car_id"].Expires = DateTime.Now.AddDays(-1);
                        Response.Write("<script>" +
                        "alert('pedido efetuado com sucesso!!');" +
                        "window.location.replace('MeusPedidos.aspx')" +
                        "</script>");

                    }
                }
            }

        }
        else
        {
            Response.Redirect("Entrar.aspx");
        }



    }

    private void linkdados()
    {

        String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {

            string cookiname = Request.Cookies["UNAME"].Value;
            using (SqlCommand cmd = new SqlCommand("select usu_cep,usu_endereco,usu_numero,usu_bairro, usu_cidade, usu_uf, usu_nome from Usuario where usu_usuario='" + cookiname + "' ", con))
            {
                Int64 usuid = Convert.ToInt64(Request.QueryString["usu_cep"]);
                con.Open();
                cmd.CommandType = CommandType.Text;
                SqlDataReader dr;
                dr = cmd.ExecuteReader();
                dr.Read();
                txtcep.Value = dr.GetString(0);
                txtendereco.Value = dr.GetString(1);
                txtnumero.Value = dr.GetInt32(2).ToString();
                txtbairro.Value = dr.GetString(3);
                txtcidade.Value = dr.GetString(4);
                txtuf.Value = dr.GetString(5);
                txtnome.Value = dr.GetString(6);
            }
        }
    }
}
