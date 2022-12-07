<%@ Page Title="Detalhes" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="EditarProduto.aspx.cs" Inherits="EditarProduto" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="min-height: 100vh; background: #2c2c2c;">
        <div class="corpoCadastro">
            <div class="box">
                <div class="formula">
                    <h2 class="pb-3">Editar Produtos</h2>
                    <div class="row">
                        <!-- image -->
                        <div class="col-md-3">

                            <asp:Repeater ID="reptimg" runat="server">
                                <ItemTemplate>
                                    <div class="carousel-item <%# GetActiveClass(Container.ItemIndex) %>">
                                        <img width="100%" class="d-block img-thumbnail" src="Img/Img_Prod/<%#Eval("prod_id") %>/<%#Eval("prodimg_nome") %><%#Eval("prodimg_extensao") %>" alt="<%#Eval("prodimg_nome") %>" onerror="this.src='images/noimage.jpg'">
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

                        </div>
                        <div class="col-md-3 centroAbsoluto">
                            <button type="button" class="btn botao corBotao" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                Alterar imagem
                            </button>
                        </div>
                         <div class="col-md-6 centroAbsolutoTwo">
                            <asp:Label ID="lbltipoprod" runat="server" CssClass=" control-label label" Text="Categoria do produto:"></asp:Label>
                            <asp:DropDownList ID="droptipo" name="droptipo" CssClass="form-control" runat="server"></asp:DropDownList>
                            <div>
                                
                            </div>
                        </div>
                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Alterar imagem</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <asp:FileUpload ID="imgup" CssClass="form-control" runat="server" />
                                        <asp:RequiredFieldValidator ID="RequiredFielImagem" CssClass="text-danger" runat="server" ErrorMessage="Imagem do produto é obrigatorio" ControlToValidate="imgup"></asp:RequiredFieldValidator>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                        <asp:Button ID="btnalterarimg" runat="server" Text="Alterar"  class="btn btn-success" OnClick="btnalterarimg_Click" />  
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%-- fim img --%>

                        <asp:Repeater ID="reptdet" OnItemDataBound="reptimg_ItemDataBound" runat="server">
                            <ItemTemplate>

                                <!-- Produto preço  -->
                                <div class="col-md-12">
                                    <asp:Label ID="lblname" runat="server" CssClass="col-md-2 control-label label" Text="Nome do produto:"></asp:Label>

                                    <input id="txtnomeprod" name="txtnomeprod" class="form-control" type="text" value="<%#Eval("prod_nome") %>" />
                                </div>

                                <div class="col-md-6">
                                    <asp:Label ID="lblpreco" runat="server" CssClass="col-md-2 control-label label" Text="Preço custo:"></asp:Label>
                                    <input id="txtpreco" name="txtpreco" class="form-control" type="text" value="<%#String.Format("{0}",Convert.ToDouble(Eval("prod_preco"))) %>" />
                                </div>

                                <div class="col-md-6">
                                    <asp:Label ID="lblprecovenda" runat="server" CssClass="col-md-2 control-label label" Text="Preço de venda do produto:"></asp:Label>
                                    <input id="txtprecovenda" name="txtprecovenda" class="form-control" type="text" value="<%#String.Format("{0}",Convert.ToDouble(Eval("prod_precovenda"))) %>" />
                                </div>

                                <div class="col-md-12">
                                    <asp:Label ID="lbldesc" runat="server" CssClass="col-md-2 control-label label" Text="Descrição do produto:"></asp:Label>
                                    <input id="txtdesc" name="txtdesc" class="form-control" type="text" value="<%#Eval("prod_desc") %>" />
                                </div>



                            </ItemTemplate>
                        </asp:Repeater>

                        <div class="col-md-6  espaco-btn">
                            <asp:Button ID="btnalterar" runat="server" Text="Alterar" class="btn botao corBotao" OnClick="btnalterar_Click" />
                        </div>
                        <div class="col-md-6 espaco-btn">
                            <asp:Button ID="btnvoltar" runat="server" class="btn botao corBotao" OnClick="btnvoltar_Click" Text="Voltar" />
                        </div>

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

