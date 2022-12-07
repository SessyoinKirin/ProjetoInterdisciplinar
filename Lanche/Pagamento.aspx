<%@ Page Title="" Language="C#" MasterPageFile="~/Usuariosmaster.master" AutoEventWireup="true" CodeFile="Pagamento.aspx.cs" Inherits="Pagamento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdTotal" runat="server" />
    <asp:HiddenField ID="hdTipo" runat="server" />
    <asp:HiddenField ID="hdStatus" runat="server" />
    <asp:HiddenField ID="hdData" runat="server" />
    <asp:HiddenField ID="hdusuid" runat="server" />
    <style>
        .ocult {
            display: none
        }
    </style>

    <div class="corpoCadastro">
        <div class="box" style="width: 1000px;">
            <div class="row">
                <div class="col-lg-9 ladoLaranja">
                    <div class="formula padinBaixo">
                        <h2>Finalizar pedido</h2>

                        <%--nome--%>
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" CssClass="control-label label" Text="Nome de quem ira receber"></asp:Label>
                            <input name="txtnome" id="txtnome" runat="server" size="60" class="form-control" required="required" placeholder="Insira seu nome" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" ErrorMessage="Campo obrigatorio" ControlToValidate="txtnome"></asp:RequiredFieldValidator>
                        </div>
                        <%--nome--%>

                        <%-- observação --%>
                        <asp:Label ID="lbldesc" runat="server" CssClass="col-md-2 control-label label" Text="Alguma observação?"></asp:Label>
                        <div>
                            <asp:TextBox ID="txtdesc" TextMode="MultiLine" CssClass="form-control" runat="server" placeholder="Ex: tirar milho, tomate, etc."></asp:TextBox>
                        </div>


                        <%-- observação --%>
                        <div class="form-group row centro pb-3">
                            <label class="col-sm-5 col-md-5 form-control-label produtosdetpreco">Como quer receber o pedido?: </label>
                            <div class="col-sm-7 col-md-87 mt-2">

                                <asp:RadioButtonList ID="rbmet" runat="server" required="required" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                    <asp:ListItem onclick="showMe('optCamp1', this)" Selected="False" Value="Enviar">Entregar Pedido</asp:ListItem>
                                    <asp:ListItem onclick="showMe('optCamp2', this)" Selected="False" Value="Retirar">Retirar no local</asp:ListItem>

                                </asp:RadioButtonList>
                            </div>
                            <div id="optCamp2" class="ocult">
                                <br />
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3677.793213471281!2d-45.19281034371736!3d-22.81012495439464!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ccc45400468fb5%3A0xad2c6e380916e0ee!2sR.%20Monsenhor%20Manoel%20Meireles%2C%2068%20-%20Vila%20Paraiba%2C%20Guaratinguet%C3%A1%20-%20SP%2C%2012515-340!5e0!3m2!1spt-BR!2sbr!4v1669141832523!5m2!1spt-BR!2sbr" width="400" height="200" style="border: 0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                <br />
                                <h2>Retirada hoje em 60-70 minutos</h2>
                            </div>

                            <div id="optCamp1" class="ocult">

                                <%--endereço--%>

                                <div id="qqId">

                                    <div class="col-md-12">
                                        <label>CEP:</label>

                                        <input name="txtcep" id="txtcep" runat="server" class="form-control" value="" size="10" maxlength="9" onblur="pesquisacep(this.value);" placeholder="Insira seu CEP" />
                                    </div>

                                    <div class="col-md-12">
                                        <label>Rua:</label>
                                        <input name="txtendereco" id="txtendereco" runat="server" size="60" class="form-control" required="required" placeholder="Insira sua rua" />
                                    </div>

                                    <div class="col-md-12">
                                        <label>Número:</label>
                                        <input id="txtnumero" type="number" runat="server" class="form-control" required="required" placeholder="Insira seu número" />
                                    </div>

                                    <div class="col-12 col-md-12">
                                        <label>Bairro:</label>
                                        <input id="txtbairro" runat="server" size="40" class="form-control" required="required" placeholder="Insira seu Bairro" />
                                    </div>

                                    <div class="col-12 col-md-12">
                                        <label>Cidade:</label>
                                        <input id="txtcidade" runat="server" size="40" class="form-control" required="required" placeholder="Insira sua cidade" />
                                    </div>

                                    <div class="col-12 col-md-12">
                                        <label>UF:</label>
                                        <input id="txtuf" runat="server" size="2" class="form-control" required="required" placeholder="UF" />
                                    </div>


                                </div>

                            </div>
                            <%--numero--%>
                        </div>


                        <asp:Repeater ID="reptcarprod" runat="server">
                            <ItemTemplate>
                                <%--Não deletar ela é o repetidor do valor  --%>
                            </ItemTemplate>
                        </asp:Repeater>

                    </div>

                </div>

                <div class="col-lg-3 p-0 lista" runat="server" id="precototal" style="display: flex;">
                    <div class="formula label padinCima" style="height: 100%;">

                        <div class="bloco">
                            <h3 class="proNameViewCart" style="color: #f23005;">Finalização</h3>
                            <label>Total</label>

                            <span class="float-right priceGray" id="spanCartotal" runat="server"></span>
                        </div>
                        <div class="bloco">
                            <h3 style="color: #f23005;">Forma de Pagamento</h3>

                            <asp:RadioButtonList required="required" ID="rdbpagamento" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow">
                                <asp:ListItem Selected="False" Value="Cartão">Cartão Crédito/Débito</asp:ListItem>
                                <asp:ListItem Selected="False" Value="Pix">Pix</asp:ListItem>
                                <asp:ListItem Selected="False" Value="Dinheiro">Dinheiro</asp:ListItem>
                            </asp:RadioButtonList>

                        </div>
                        <div class="centro bloco">
                            <asp:Button ID="btnpag" OnClick="btnpag_Click" runat="server" Text="Enviar" CssClass="btn botao corBotao" />
                        </div>

                    </div>



                </div>
            </div>
        </div>
    </div>
    <script>

        function habilitar() {
            document.getElementById("qqId").disabled = false;

            document.getElementById("txtcep").disabled = false;
            document.getElementById("txtendereco").disabled = false;
            document.getElementById("txtnumero").disabled = false;
            document.getElementById("txtbairro").disabled = false;
            document.getElementById("txtcidade").disabled = false;
            document.getElementById("txtuf").disabled = false;
        }
    </script>
    <script>
        function showMe(it, elem) {
            var elems = document.getElementsByClassName("cb");
            var currentState = elem.checked;
            var elemsLength = elems.length;

            for (i = 0; i < elemsLength; i++) {
                if (elems[i].type === "checkbox") {
                    elems[i].checked = false;
                }
            }
            elem.checked = currentState;
            var elements = document.getElementsByClassName('ocult');
            for (j = 0; j < elements.length; j++) {
                if (elements[j].id != it || currentState == false) {
                    elements[j].style.display = "none";
                } else {
                    elements[j].style.display = "block";
                }
            }
        }
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script>
        $('[name="check"]').change(function () {
            $('[name="op2"]').toggle(200);
        });

    </script>

</asp:Content>

