<%@ Page Title="Cardápio" Language="C#" MasterPageFile="~/Usuariosmaster.master" AutoEventWireup="true" CodeFile="Produtosmenu.aspx.cs" Inherits="Usuarioproduto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="corpoCadastro" style="background: #2c2c2c;">
        <div style="position: relative; width: 1200px; background: #1c1c1c; border-radius: 8px; /margin-top: 10px; margin-bottom: 10px; overflow: hidden;">
            <div class="container">
                <div style="inset: 2px; border-radius: 8px; z-index: 20; padding: 30px 1px;">
                    <div class="row">
                        <h2 style="color: #f23005; font-weight: 500; text-align: center; margin-bottom: 10px;">Cardápio</h2>
                        <asp:Repeater ID="repprod" runat="server">
                            <ItemTemplate>
                                <div class="col-md-3" style="margin-top: 10px; margin-bottom: 15px;">
                                    <a style="text-decoration: none;" href="Produtosdetalhes.aspx?prod_id=<%#Eval("prod_id") %>">
                                        <div class="img-thumbnail">
                                            <img class="img-fluid imagemCentro" src="Img/Img_Prod/<%#Eval("prod_id") %>/<%#Eval("ImageNome") %><%#Eval("prodimg_extensao") %>" alt="<%#Eval("ImageNome") %>">
                                            <div class="p-2">
                                                <div class="produtosnome"><%#Eval("prod_nome") %></div>
                                                <div class="proPrice"><span class="produtospreco">Valor: R$ <%#String.Format("{0}",Convert.ToDouble(Eval("prod_precovenda"))) %></span> </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

