<%@ Page Title="Cardápio" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="ListaProdutos.aspx.cs" Inherits="ListaProdutos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
    <script>
        @import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css");
    </script>
    <div class="corpoCadastro" style="background: #2c2c2c;">
        <div style="position: relative; width: 1200px; background: #1c1c1c; border-radius: 8px; 
    margin-top: 10px; margin-bottom: 10px; overflow: hidden;">
            <div class="formula">
                <div class="row">

                    <h2 style="color: #f23005; font-weight: 500; text-align: center; margin-bottom: 16px;">Produtos Cadastrados</h2>
                    <div class="table-responsive-md" >
                    <table id="minhaTabela" class="table table-dark table-hover table caption-top">
                        <thead>
                            <tr>
                                <th style="text-align: center;">Nome</th>
                                <th style="text-align: center;">Categoria</th>
                                <th style="text-align: center;">Custo</th>
                                <th style="text-align: center;">Valor de venda</th>
                                <th style="text-align: center;">Descrição</th>
                                <th style="text-align: center;">Status</th>
                                <th style="text-align: center;">Ações</th>
                            </tr>
                        </thead>
                        <asp:Repeater ID="repprod" runat="server">
                            <ItemTemplate>

                                <tr>
                                    <td style="text-align: center;"><%#Eval("prod_nome") %></td>
                                    <td style="text-align: center;"><%#Eval("tipo_nome") %></td>
                                    <td style="text-align: center;">R$ <%#String.Format("{0}",Convert.ToDouble(Eval("prod_preco"))) %></td>
                                    <td style="text-align: center;">R$ <%#String.Format("{0}",Convert.ToDouble(Eval("prod_precovenda"))) %></td>
                                    <td style="text-align: center;"><%#Eval("prod_desc") %></td>
                                    <td style="text-align: center;">Ativo</td>
                                    <td style="text-align: center;">
                                        <a href="DetalheProduto.aspx?prod_id=<%#Eval("prod_id") %>"><button type="button" class="btn botao corBotao">Detalhes</button></a>

                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:Repeater ID="repprod1" runat="server">
                            <ItemTemplate>

                                <tr>
                                    <td style="text-align: center;"><%#Eval("prod_nome") %></td>
                                    <td style="text-align: center;"><%#Eval("tipo_nome") %></td>
                                    <td style="text-align: center;">R$ <%#String.Format("{0}",Convert.ToDouble(Eval("prod_preco"))) %></td>
                                    <td style="text-align: center;">R$ <%#String.Format("{0}",Convert.ToDouble(Eval("prod_precovenda"))) %></td>
                                    <td style="text-align: center;"><%#Eval("prod_desc") %></td>
                                    <td style="text-align: center;">Pausado</td>
                                    <td style="text-align: center;">
                                        <a href="DetalheProduto.aspx?prod_id=<%#Eval("prod_id") %>"><button type="button" class="btn botao corBotao">Detalhes</button></a>

                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                        </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

