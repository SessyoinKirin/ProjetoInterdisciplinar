<%@ Page Title="Carrinho de compras" Language="C#" MasterPageFile="~/Usuariosmaster.master" AutoEventWireup="true" CodeFile="Carrinho.aspx.cs" Inherits="Carrinho" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div style="background: #2c2c2c;">
        <div class="container">

            <div class="corpoCadastro">

                <div class="box">
                    <div class="formula">
                        <div class="row">
                            <h1 runat="server" id="h5nomeitem" class="label"></h1>


                            <asp:Repeater ID="reptcarprod" runat="server">
                                <ItemTemplate>

                                    <div class="cart-body">

                                        <div class="cart-item">

                                            <div class="cart-row">

                                                <div class="cart-row-cell desc" >
                                                    <a href="Produtosdetalhes.aspx?prod_id=<%#Eval("prod_Id") %>" target="_blank">
                                                        <img width="70%" class="media-object imagemCarrinho" src="Img/Img_Prod/<%#Eval("prod_Id") %>/<%#Eval("prodimg_nome") %><%#Eval("prodimg_extensao") %>" alt="<%#Eval("prodimg_nome") %>" onerror="this.src='images/noimage.jpg'">
                                                    </a>

                                                </div>

                                                <div class="cart-row-cell desc">

                                                    <h4 class="media-heading label"><%#Eval("prod_nome") %></h4>
                                                    <p class="media-heading label" ><%#Eval("prod_desc") %><br />
                                                        <asp:Button CommandArgument='<%#Eval("prod_id") %>' ID="btnremovcarrinho" runat="server" OnClick="btnremovcarrinho_Click" CssClass="btncremov" Text="Remover do carrinho" />
                                                    </p>

                                                </div>


                                                <div class="cart-row-cell amount">

                                                    <h5><span class="label">R$ <%#String.Format("{0}",Convert.ToDouble(Eval("prod_precovenda","{0:0,00}"))) %> </span></h5>

                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

                            <footer>

                                <div class="col-md-4" runat="server" id="precototal">


                                    <label class="label">Preço total: </label>
                                    <span class="pull-right label" id="spprectotal" runat="server"></span>

                                    <asp:Button ID="btncompra" runat="server" OnClick="btncompra_Click" CssClass="btn botao corBotao" Text="Finalizar compra" />

                                </div>
                        </div>

                    </div>
                    </footer>

                </div>

            </div>
        </div>
    </div>

</asp:Content>

