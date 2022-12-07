<%@ Page Title="Tipo" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="Tipodeprod.aspx.cs" Inherits="Tipodeprod" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="corpoCadastro" style="background: #2c2c2c;">
        <div class="box">
            <div class="formula">
                <h2>Adicionar categoria</h2>

                <div class="form-group">
                    <asp:Label ID="lbltipoprod" runat="server" CssClass="col-md-12 control-label label" Text="Categoria do produto:"></asp:Label>
                    <div class="col-md-6">
                        <asp:TextBox ID="txttipoprod" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTipoprod" CssClass="text-danger" runat="server" ErrorMessage="Categoria do produto é obrigatorio" ControlToValidate="txttipoprod"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div>
                    <div class="col-md-4">
                        <asp:Button ID="btnadd" runat="server" Text="Adicionar" class="btn botao mb-3 corBotao" OnClick="btnadd_Click" />


                    </div>
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </div>
                <h2>Categorias cadastradas</h2>
                <%--  tabela--%>
                <asp:Repeater ID="repTipo" runat="server">
                    <HeaderTemplate>
                        <table class="table table-dark table-hover table caption-top">
                            
                            <thead>
                                <tr>
                                    <%--<th>Id</th>--%>
                                    <th class="letraCentralizada label">Nome:</th>
                                    <%--<th>Editar</th>--%>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                           
                            <td class="letraCentralizada"><%# Eval("tipo_nome") %></td>
                            <%--<td>Editar</td>--%>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </tbody>
                    </table>
                    </FooterTemplate>
                </asp:Repeater>


            </div>
        </div>
    </div>
    <script>
        function sortTable(table, col, reverse) {
            var tb = table.tBodies[0],
                tr = Array.prototype.slice.call(tb.rows, 0),
                i;
            reverse = -((+reverse) || -1);
            tr = tr.sort(function (a, b) {
                return reverse * (a.cells[col].textContent.trim()
                    .localeCompare(b.cells[col].textContent.trim())
                );
            });
            for (i = 0; i < tr.length; ++i) tb.appendChild(tr[i]);
        }

        function makeSortable(table) {
            var th = table.tHead,
                i;
            th && (th = th.rows[0]) && (th = th.cells);
            if (th) i = th.length;
            else return;
            while (--i >= 0) (function (i) {
                var dir = 1;
                th[i].addEventListener('click', function () {
                    sortTable(table, i, (dir = 1 - dir))
                });
            }(i));
        }

        function makeAllSortable(parent) {
            parent = parent || document.body;
            var t = parent.getElementsByTagName('table'),
                i = t.length;
            while (--i >= 0) makeSortable(t[i]);
        }

        window.onload = function () {
            makeAllSortable();
        };
    </script>
</asp:Content>



