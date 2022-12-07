<%@ Page Title="Adicionar produtos" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="Produtos.aspx.cs" Inherits="Produtos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="min-height: 100vh; background: #2c2c2c;">
        <div class="corpoCadastro">
            <div class="box">
                <div class="formula">
                    <h2>Adicionar Produtos</h2><br/>
                    <div class="row">
                        <div class="col-md-6">
                            <asp:Label ID="lblname" runat="server" CssClass="col-md-2 control-label label" Text="Nome do produto:"></asp:Label>
                            <asp:TextBox ID="txtnomeprod" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorNomeprod" CssClass="text-danger" runat="server" ErrorMessage="Nome do produto é obrigatorio" ControlToValidate="txtnomeprod" placeholder="Insira seu nome"></asp:RequiredFieldValidator>
                            
                        </div>

                        <div class="col-md-6">
                            <asp:Label ID="lbltipoprod" runat="server" CssClass="col-md-2 control-label label" Text="Categoria do produto:"></asp:Label>
                            <div>
                                <asp:DropDownList ID="droptipo" CssClass="form-control" runat="server"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldTipo" CssClass="text-danger" runat="server" ErrorMessage="Tipo do produto é obrigatorio" ControlToValidate="droptipo" InitialValue="0"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <asp:Label ID="lblpreco" runat="server" CssClass="col-md-2 control-label label" Text="Preço custo:"></asp:Label>
                            <div>
                                <asp:TextBox ID="txtpreco" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldPreco" CssClass="text-danger" runat="server" ErrorMessage="Preço de custo do produto é obrigatorio" placeholder="R$" ControlToValidate="txtpreco"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <asp:Label ID="lblprecovenda" runat="server" CssClass="col-md-2 control-label label" Text="Preço de venda do produto:"></asp:Label>
                            <div>
                                <asp:TextBox ID="txtprecovenda" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldPrecovenda" CssClass="text-danger" runat="server" ErrorMessage="Preço de venda do produto é obrigatorio" ControlToValidate="txtprecovenda"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <asp:Label ID="lbldesc" runat="server" CssClass="col-md-2 control-label label" Text="Descrição do produto:"></asp:Label>
                            <div>
                                <asp:TextBox ID="txtdesc" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldDescricao" CssClass="text-danger" runat="server" ErrorMessage="Descriçao do produto é obrigatorio" ControlToValidate="txtdesc"></asp:RequiredFieldValidator>
                            </div>
                        </div>


                        <div class="col-md-12">
                            <asp:Label ID="lblimg" runat="server" TextMode="MultiLine" CssClass="col-md-2 control-label label" Text="Imagem do produto:"></asp:Label>
                            <div>
                                <asp:FileUpload ID="imgup" CssClass="form-control" runat="server" />
                                <asp:RequiredFieldValidator ID="RequiredFielImagem" CssClass="text-danger" runat="server" ErrorMessage="Imagem do produto é obrigatorio" ControlToValidate="imgup"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 offset-md-4 espaco-btn">
                        <asp:Button ID="btnadd" runat="server" Text="Adicionar" class="btn botao corBotao" OnClick="btnadd_Click" />
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  

</asp:Content>

