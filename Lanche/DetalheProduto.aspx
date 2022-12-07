<%@ Page Title="Detalhes" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="DetalheProduto.aspx.cs" Inherits="DetalheProduto" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
    <div style="min-height: 100vh; background: #2c2c2c;">
        <div class="corpoCadastro">
            <div class="box">
                 <a href="ListaProdutos.aspx"<i OnClick="btnvoltar_Click" id="close" class="bi bi-arrow-90deg-left"></i></a>
                <div class="formula">
                    <h2 class="pb-3">Detalhe do Produto</h2><br />

                    <div class="row">
                        <asp:Repeater ID="reptimg" runat="server">
                            <ItemTemplate>

                                <div class="col-md-6 centroAbsolutoTwo">

                                    <div class=" carousel-item <%# GetActiveClass(Container.ItemIndex) %>">
                                        <img width="100%" class="d-block img-thumbnail " src="Img/Img_Prod/<%#Eval("prod_id") %>/<%#Eval("prodimg_nome") %><%#Eval("prodimg_extensao") %>" alt="<%#Eval("prodimg_nome") %>" onerror="this.src='images/noimage.jpg'">
                                    </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="col-md-6">
                        <div class="card-body">
                            <asp:Repeater ID="reptdet" OnItemDataBound="reptimg_ItemDataBound" runat="server">
                                <ItemTemplate>
                                    <h3 class="label" style="text-align: center;">Status do produto: <strong>Ativo</strong></h3>

                                    <h2 class="card-title label centro"><%#Eval("prod_nome") %></h2>
                                    <br />
                                    <p class="card-text label centro">
                                        Categoria: <span class="mainCor"><%#Eval("tipo_nome") %></span><br />

                                        Preço custo: <span class="mainCor">R$<%#String.Format("{0}",Convert.ToDouble(Eval("prod_preco"))) %></span><br/>
                                        Preço venda: <span class="mainCor">R$<%#String.Format("{0}",Convert.ToDouble(Eval("prod_precovenda"))) %></span><br/>

                                        Descrição: <span class="mainCor"><%#Eval("prod_desc") %></span><br />

                                    </p>
                                    </div>
                        </div>
                       
                    <div class="col-md-4 espaco-btn">
                        <button type="button" class="btn botao corBotao"><a style="text-decoration: none; color: white;" href="EditarProduto.aspx?prod_id=<%#Eval("prod_id") %>"><i class="bi bi-pencil-square">Editar</i></a></button>
                    </div>
                                    <div class="col-md-4 espaco-btn">
                                        <button type="button" class="btn botao corBotao" data-bs-toggle="modal" data-bs-target="#pausa">
                                            <i class="bi bi-pause-fill">Pausar</i>
                                        </button>

                                    </div>
                                    <div class="col-md-4 espaco-btn">
                                        <button type="button" class="btn botao corBotao" data-bs-toggle="modal" data-bs-target="#remover">
                                            <i class="bi bi-trash">Remover</i>
                                        </button>

                                    </div>

                                    <!-- Modal pausa -->
                                    <div class="modal fade" id="pausa" tabindex="-1" aria-labelledby="pausaLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="pausaLabel">Pausar produto</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    Esse produto será pausado do cardápio até ser ativo novamente, tem certeza que deseja pausar o <%#Eval("prod_nome") %>?
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                    <asp:Button ID="btnpausa" runat="server" Text="Pausar produto" class="btn btn-danger" OnClick="btnpausa_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Modal pausa -->

                                    <!-- Modal pausa -->
                                    <div class="modal fade" id="remover" tabindex="-1" aria-labelledby="removerLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="removerLabel">Remover produto</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    Este produto será removido permanentemente, tem certeza que deseja remover o <%#Eval("prod_nome") %>?
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                    <asp:Button runat="server" Text="Remover" class="btn btn-danger" OnClick="btnremove_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Modal pausa -->

                                </ItemTemplate>
                            </asp:Repeater>

                            <asp:Repeater ID="reppausado" OnItemDataBound="reptimg_ItemDataBound" runat="server">
                                <ItemTemplate>
                                    <h3 class="label" style="text-align: center;">Status do produto: Pausado</h3>

                                    <h1 class="card-title label"><%#Eval("prod_nome") %></h1>
                                    <br />
                                    <p class="card-text label">
                                        Categoria: <%#Eval("tipo_nome") %><br />
                                        Preço custo: <%#String.Format("{0}",Convert.ToDouble(Eval("prod_preco"))) %><br />
                                        Preço venda: <%#String.Format("{0}",Convert.ToDouble(Eval("prod_precovenda"))) %><br />
                                        Descrição: <%#Eval("prod_desc") %><br />

                                    </p>




                                    </div>
                        </div>

                       
                    <div class="col-md-4 espaco-btn">
                        <button type="button" class="btn botao corBotao"><a style="text-decoration: none; color: white;" href="EditarProduto.aspx?prod_id=<%#Eval("prod_id") %>"><i class="bi bi-pencil-square">Editar</i></a></button>
                    </div>
                                    <div class="col-md-4 espaco-btn">
                                        <button type="button" class="btn botao corBotao" data-bs-toggle="modal" data-bs-target="#ativar">
                                            <i class="bi bi-play">Ativar</i>
                                        </button>

                                    </div>
                                    <div class="col-md-4 espaco-btn">
                                        <button type="button" class="btn botao corBotao" data-bs-toggle="modal" data-bs-target="#remover">
                                            <i class="bi bi-trash">Remover</i>
                                        </button>

                                    </div>

                                    <!-- Modal pausa -->
                                    <div class="modal fade" id="ativar" tabindex="-1" aria-labelledby="ativarLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="ativarLabel">Ativar produto</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    Esse produto voltará a ficar ativo no cardápio, tem certeza que deseja ativar o <%#Eval("prod_nome") %>?
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                    <asp:Button ID="btnativa" runat="server" Text="Ativar produto" class="btn btn-danger" OnClick="btnativa_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Modal pausa -->

                                    <!-- Modal pausa -->
                                    <div class="modal fade" id="remover" tabindex="-1" aria-labelledby="removerLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="removerLabel">Remover produto</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    Este produto será removido permanentemente, tem certeza que deseja remover o <%#Eval("prod_nome") %>?
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                    <asp:Button runat="server" Text="Remover" class="btn btn-danger" OnClick="btnremove_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Modal pausa -->
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>


                </div>
            </div>
        </div>

        <script>
            var myModal = document.getElementById('myModal')
            var myInput = document.getElementById('myInput')

            myModal.addEventListener('shown.bs.modal', function () {
                myInput.focus()
            })
        </script>
</asp:Content>

