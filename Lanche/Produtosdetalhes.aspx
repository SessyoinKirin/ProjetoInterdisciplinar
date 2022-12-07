<%@ Page Title="Detalhes" Language="C#" MasterPageFile="~/Usuariosmaster.master" AutoEventWireup="true" CodeFile="Produtosdetalhes.aspx.cs" Inherits="Produtosdetalhes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
    <script>
        @import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css");
    </script>
    <style>
        #close {
            float: right;
            width: 25px;
            height: 25px;
            line-height: 25px;
            font-size: 25px;
            border-radius: 50%;
            color: #f23005;
            text-align: center;
            position: relative;
            margin-right: 5px;
            margin-top: 6px;
        }
    </style>
    <div class="corpoCadastro">

        <div style="position: relative; width: 1150px; background: #1c1c1c; border-radius: 8px; margin-top: 10px; margin-bottom: 10px; overflow: hidden;">
           <a href="Produtosmenu.aspx"<i OnClick="btnvoltar_Click" id="close" class="bi bi-arrow-90deg-left"></i></a>
            <div class="formula">
                <div class="row">

                    <div class="col-md-6 mt-2">
                        <!-- There's only One image -->

                        <asp:Repeater ID="reptimg" runat="server">
                            <ItemTemplate>
                                <div class="carousel-item <%# GetActiveClass(Container.ItemIndex) %>">
                                    <img class="d-block w-100 img-thumbnail" src="Img/Img_Prod/<%#Eval("prod_id") %>/<%#Eval("prodimg_nome") %><%#Eval("prodimg_extensao") %>" alt="<%#Eval("prodimg_nome") %>" onerror="this.src='images/noimage.jpg'">
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                    </div>
                    <%-- fim img --%>
                    <asp:Repeater ID="reptdet" OnItemDataBound="reptimg_ItemDataBound" runat="server">
                        <ItemTemplate>
                            <div class="col-md-6 label ">

                                <!-- Product Price  -->

                                <div class="col-md-12 centro">

                                    <h1><%#Eval("prod_nome") %> </h1>
                                </div>
                                <div class="form-group  centroAbsoluto">

                                    <div class="col-md-9 description">
                                        <p class="mt-1">
                                           Descriçao do produto: <%#Eval("prod_desc") %>
                                        </p>
                                    </div>
                                </div>
                                 <%-- preço --%>
                                <div class="form-group price_elem row">
                                  
                                    <div class=" col-md-12 centro">
                                        <span class="produtosdetprecovend" id="product-form-price">Valor: <span class="mainCor">R$<%#String.Format("{0}",Convert.ToDouble(Eval("prod_precovenda"))) %></span> </span>


                                    </div>
                                </div>

                                <div class="Detalhes centro row" style="margin-top: 15px;">
                                            </div>
                               
                                <div class="form-group">
                          
                          <div class="Detalhes centro row">
                               <div class="col-lg-12">
                                
                                 
                                    <input type="button" name="menos" id="menos" value="-" />
                                    <input type="text" name="format" value="1" id="format" size="1" />
                                    <input type="button" name="mais" id="mais" value="+" />

                                    <%-- botão do adicionar --%>
                                    <asp:Button ID="btncarrinho" runat="server" OnClick="btncarrinho_Click" CssClass="btnprinc" Text="Adicionar ao carrinho" />
                                </div>
                                </div>
                               </div>
                            </div>
                            <div class="col-md-6 label ">

                                </div>
                          
                        </ItemTemplate>

                    </asp:Repeater>

                    <%-- detalhes --%>
                </div>
            </div>
        </div>
    </div>
 <script type="text/javascript">
     function id(el) {
         return document.getElementById(el);
     }
     window.onload = function () {
         id('mais').onclick = function () {
             id('format').value = parseInt(id('format').value) + 1;

             id('total').value = 20 * id('format').value;
         }
         id('menos').onclick = function () {
             if (id('format').value > 1)
                 id('format').value = parseInt(id('format').value) - 1;

             id('total').value = 20 * id('format').value;
         }
     }
    </script>
</asp:Content>

