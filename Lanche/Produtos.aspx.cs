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

public partial class Produtos : System.Web.UI.Page
{
    String CS = ConfigurationManager.ConnectionStrings["LanchoneteDBConnectionString1"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            linktipo();
          

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
                droptipo.Items.Insert(0, new ListItem("-Selecione-", "0"));

            }

        }
    }

    protected void btnadd_Click(object sender, EventArgs e)
    {
        if (txtnomeprod.Text != "" && txtpreco.Text != "" && txtprecovenda.Text !="" && txtdesc.Text != "")
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("ProcInsereprod", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PNome", txtnomeprod.Text);
                cmd.Parameters.AddWithValue("@PPreco", txtpreco.Text);
                cmd.Parameters.AddWithValue("@Pprecovenda", txtprecovenda.Text);
                cmd.Parameters.AddWithValue("@PTipoId", droptipo.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@PStatus", 1);
                cmd.Parameters.AddWithValue("@PDesc", txtdesc.Text);



                con.Open();
                Int64 prod_Id = Convert.ToInt64(cmd.ExecuteScalar());



                //up img
                if (imgup.HasFile)
                {
                    string SavePath = Server.MapPath("~/Img/Img_Prod/") + prod_Id;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);
                    }
                    string Extention = Path.GetExtension(imgup.PostedFile.FileName);
                    imgup.SaveAs(SavePath + "\\" + txtnomeprod.Text.ToString().Trim() + "01" + Extention);

                    SqlCommand cmd3 = new SqlCommand("insert into Produtosimg values('" + prod_Id + "','" + txtnomeprod.Text.ToString().Trim() + "01" + "','" + Extention + "')", con);

                    cmd3.ExecuteNonQuery();
                    Label1.Text = "Registrado com sucesso";
                    Label1.ForeColor = Color.Green;

                    
                }

                Response.Write("<script>" +
                    "alert('Cadastrado com sucesso!!');" +
                    "window.location.replace('Produtos.aspx')" +
                    "</script>");


            }
        }
    }






}
