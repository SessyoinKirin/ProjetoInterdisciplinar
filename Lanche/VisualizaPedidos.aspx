<%@ Page Title="Cardápio" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="VisualizaPedidos.aspx.cs" Inherits="VisualizaPedidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
    <script>
        @import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css");
    </script>
    <div class="corpoCadastro" style="background: #2c2c2c;">
        <div style="position: relative; width: 1000px; background: #1c1c1c; border-radius: 8px; margin-top: 10px; margin-bottom: 10px; overflow: hidden;">
            <div class="formula">
                <div class="row">

                    <h2 style="color: #f23005; font-weight: 500; text-align: center; margin-bottom: 16px;">Pedidos</h2>

                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" style="color: #f23005;" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">
                                Pendentes 
                                 <asp:Repeater ID="total1" runat="server">
                                     <ItemTemplate>
                                         <span class="badge rounded-pill badge bg-danger"><%#Eval("total_registros") %></span>
                                     </ItemTemplate>
                                 </asp:Repeater>
                            </button>

                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" style="color: #f23005;" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">
                                Em preparo
                                <asp:Repeater ID="total3" runat="server">
                                    <ItemTemplate>
                                        <span class="badge rounded-pill badge bg-danger"><%#Eval("total_registros") %></span>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" style="color: #f23005;" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false">
                                Em entrega
                                <asp:Repeater ID="total2" runat="server">
                                    <ItemTemplate>
                                        <span class="badge rounded-pill badge bg-danger"><%#Eval("total_registros") %></span>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </button>
                        </li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <div class="row">
                                <asp:Repeater ID="reppedente" runat="server">
                                    <ItemTemplate>

                                        <div class="col-md-6">
                                            <br />
                                            <div class="card" style="margin-bottom: 10px;">
                                                <h5 class="card-header">Pedido feito <%#Eval("pag_data") %> - <%#Eval("pag_hora") %></h5>
                                                <div class="card-body">

                                                    <p></p>
                                                    <h5 class="card-title"><%#Eval("prod_nome") %></h5>
                                                    <p class="card-text">Id:<%#Eval("pag_id") %></p>
                                                    <p class="card-text"><b>Observações:</b> <%#Eval("pag_descricao") %></p>
                                                    <div class="card-text">
                                                        <b>Entregar em: </b>
                                                        <%#Eval("pag_endereco") %>, <%#Eval("pag_numero") %>
                                                    </div>
                                                    <p></p>
                                                    <div class="card-text"><b>Total:</b> R$ <%#String.Format("{0}",Convert.ToDouble(Eval("pag_cartotal"))) %> </div>
                                                    <div class="card-text">
                                                        <b>Forma de pagamento: </b><%#Eval("pag_tipo") %>
                                                    </div>
                                                </div>

                                                <div class="card-footer">
                                                    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                                        Confirmar
                                                    </button>
                                                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal1">
                                                        Rejeitar
                                                    </button>

                                                </div>
                                            </div>
                                        </div>
                                        </div>

                                        <!-- Modal confirmar -->
                                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Confirmar pedido</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Tem certeza que deseja aceitar esse pedido? A entrega deve ser feita em até 60-70 minutos
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                                                        <asp:Button ID="btnpreparo" class="btn btn-success" OnClick="btnpreparo" runat="server" Text="Confirmar" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Modal rejeitar -->
                                        <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel1">Rejeitar pedido</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Tem certeza que deseja rejeitar esse pedido? Não será possível reverter essa escolha
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-success" data-bs-dismiss="modal">Cancelar</button>
                                                        <asp:Button ID="btncrejeitat" class="btn btn-danger" OnClick="btnrejeita" runat="server" Text="Rejeitar" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>

                                <asp:Repeater ID="reppedente1" runat="server">
                                    <ItemTemplate>

                                        <div class="col-md-6">
                                            <br />
                                            <div class="card" style="margin-bottom: 10px;">
                                                <h5 class="card-header">Pedido feito <%#Eval("pag_data") %> - <%#Eval("pag_hora") %></h5>
                                                <div class="card-body">

                                                    <p></p>
                                                    <h5 class="card-title"><%#Eval("prod_nome") %></h5>
                                                    <p class="card-text">Id:<%#Eval("pag_id") %></p>
                                                    <p class="card-text"><b>Observações:</b> <%#Eval("pag_descricao") %></p>
                                                    <div class="card-text">
                                                        <b>Retirada no estabelecimento</b>
                                                    </div>
                                                    <p></p>
                                                    <div class="card-text"><b>Total:</b> R$ <%#String.Format("{0}",Convert.ToDouble(Eval("pag_cartotal"))) %> </div>
                                                    <div class="card-text">
                                                        <b>Forma de pagamento: </b><%#Eval("pag_tipo") %>
                                                    </div>
                                                </div>

                                                <div class="card-footer">
                                                    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal2">
                                                        Confirmar
                                                    </button>
                                                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal3">
                                                        Rejeitar
                                                    </button>

                                                </div>
                                            </div>
                                        </div>


                                        <!-- Modal confirmar -->
                                        <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel2">Confirmar pedido</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Tem certeza que deseja aceitar esse pedido? A retirada deve ser feita em até 60-70 minutos
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                                                        <asp:Button ID="btnpreparo" class="btn btn-success" OnClick="btnpreparo" runat="server" Text="Confirmar" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Modal rejeitar -->
                                        <div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel3" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel3">Rejeitar pedido</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Tem certeza que deseja rejeitar esse pedido? Não será possível reverter essa escolha
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-success" data-bs-dismiss="modal">Cancelar</button>
                                                        <asp:Button ID="btncrejeitat" class="btn btn-danger" OnClick="btnrejeita" runat="server" Text="Rejeitar" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </ItemTemplate>
                                </asp:Repeater>

                            </div>
                           
                        </div>
                        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                            <div class="row">
                                <asp:Repeater ID="reppede" runat="server">
                                    <ItemTemplate>

                                        <div class="col-md-6">
                                            <br />
                                            <div class="card" style="margin-bottom: 10px;">
                                                <div id="sua_div">
                                                    <h5 class="card-header">Pedido feito <%#Eval("pag_data") %> - <%#Eval("pag_hora") %></h5>
                                                    <div class="card-body">

                                                        <p></p>
                                                        <h5 class="card-title"><%#Eval("prod_nome") %></h5>
                                                        <p class="card-text">Id:<%#Eval("pag_id") %></p>
                                                        <p class="card-text"><b>Observações:</b> <%#Eval("pag_descricao") %></p>
                                                        <div class="card-text">
                                                            <b>Entregar em: </b>
                                                            <%#Eval("pag_endereco") %>, <%#Eval("pag_numero") %>
                                                        </div>
                                                        <p></p>
                                                        <div class="card-text"><b>Total:</b> R$ <%#String.Format("{0}",Convert.ToDouble(Eval("pag_cartotal"))) %> </div>
                                                        <div class="card-text">
                                                            <b>Forma de pagamento: </b><%#Eval("pag_tipo") %>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="card-footer">
                                                    <button id="btn" class="btn btn-secondary">Imprimir</button>
                                                    <asp:Button ID="btnentrega" class="btn btn-success" OnClick="btnentrega" runat="server" Text="Despachar" />

                                                </div>
                                            </div>
                                        </div>

                                    </ItemTemplate>
                                </asp:Repeater>

                                <asp:Repeater ID="reppede1" runat="server">
                                    <ItemTemplate>

                                        <div class="col-md-6">
                                            <br />
                                            <div class="card" style="margin-bottom: 10px;">
                                                <div id="sua_div1">
                                                    <h5 class="card-header">Pedido feito <%#Eval("pag_data") %> - <%#Eval("pag_hora") %></h5>
                                                    <div class="card-body">

                                                        <p></p>
                                                        <h5 class="card-title"><%#Eval("prod_nome") %></h5>
                                                        <p class="card-text">Id:<%#Eval("pag_id") %></p>
                                                        <p class="card-text"><b>Observações:</b> <%#Eval("pag_descricao") %></p>
                                                        <div class="card-text">
                                                            <b>Retirada no estabelecimento</b>
                                                        </div>
                                                        <p></p>
                                                        <div class="card-text"><b>Total:</b> R$ <%#String.Format("{0}",Convert.ToDouble(Eval("pag_cartotal"))) %> </div>
                                                        <div class="card-text">
                                                            <b>Forma de pagamento: </b><%#Eval("pag_tipo") %>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="card-footer">
                                                    <button id="btn1" class="btn btn-secondary">Imprimir</button>
                                                    <asp:Button ID="btnentrega" class="btn btn-success" OnClick="btnentrega" runat="server" Text="Despachar" />

                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </div>
                        </div>
                        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                            <div class="row">
                                <asp:Repeater ID="repentrega" runat="server">
                                    <ItemTemplate>
                                        <div class="col-md-6">
                                            <br />
                                            <div class="card" style="margin-bottom: 10px;">
                                                <h5 class="card-header">Pedido feito <%#Eval("pag_data") %> - <%#Eval("pag_hora") %></h5>
                                                <div class="card-body">

                                                    <p></p>
                                                    <h5 class="card-title"><%#Eval("prod_nome") %></h5>
                                                    <p class="card-text">Id:<%#Eval("pag_id") %></p>
                                                    <p class="card-text"><b>Observações:</b> <%#Eval("pag_descricao") %></p>
                                                    <div class="card-text">
                                                        <b>Entregar em: </b>
                                                        <%#Eval("pag_endereco") %>, <%#Eval("pag_numero") %>
                                                    </div>
                                                    <p></p>
                                                    <div class="card-text"><b>Total:</b> R$ <%#String.Format("{0}",Convert.ToDouble(Eval("pag_cartotal"))) %> </div>
                                                    <div class="card-text">
                                                        <b>Forma de pagamento: </b><%#Eval("pag_tipo") %>
                                                    </div>
                                                </div>

                                                <div class="card-footer">

                                                    <asp:Button ID="btnconcluir" class="btn btn-success" OnClick="btnconcluir" runat="server" Text="Concluir pedido" />

                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>

                                <asp:Repeater ID="repentrega1" runat="server">
                                    <ItemTemplate>
                                        <div class="col-md-6">
                                            <br />
                                            <div class="card" style="margin-bottom: 10px;">
                                                <h5 class="card-header">Pedido feito <%#Eval("pag_data") %> - <%#Eval("pag_hora") %></h5>
                                                <div class="card-body">

                                                    <p></p>
                                                    <h5 class="card-title"><%#Eval("prod_nome") %></h5>
                                                    <p class="card-text">Id:<%#Eval("pag_id") %></p>
                                                    <p class="card-text"><b>Observações:</b> <%#Eval("pag_descricao") %></p>
                                                    <div class="card-text">
                                                        <b>Retirada no estabelecimento</b>
                                                    </div>
                                                    <p></p>
                                                    <div class="card-text"><b>Total:</b> R$ <%#String.Format("{0}",Convert.ToDouble(Eval("pag_cartotal"))) %> </div>
                                                    <div class="card-text">
                                                        <b>Forma de pagamento: </b><%#Eval("pag_tipo") %>
                                                    </div>
                                                </div>

                                                <div class="card-footer">

                                                    <asp:Button ID="btnconcluir" class="btn btn-success" OnClick="btnconcluir" runat="server" Text="Concluir pedido" />

                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>



                </div>
            </div>
        </div>
    </div>

    <script>
        document.getElementById('btn').onclick = function () {
            var conteudo = document.getElementById('sua_div').innerHTML,
                tela_impressao = window.open('about:blank');

            tela_impressao.document.write(conteudo);
            tela_impressao.window.print();
            tela_impressao.window.close();
        };
    </script>

    <script>
        document.getElementById('btn1').onclick = function () {
            var conteudo = document.getElementById('sua_div1').innerHTML,
                tela_impressao = window.open('about:blank');

            tela_impressao.document.write(conteudo);
            tela_impressao.window.print();
            tela_impressao.window.close();
        };
    </script>

</asp:Content>

