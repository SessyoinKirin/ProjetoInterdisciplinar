<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MeusPedidos.aspx.cs" Inherits="MeusPedidos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Meus Pedidos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous" />
    <link href="css/Sitecustomi.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
    <script>
        @import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css");
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
                <div class="container-fluid">
                    <a class="navbar-brand" href="Index.aspx">
                        <img src="Img/Logo.png" alt="Logo" height="50" /></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" href="Index.aspx">Pagina inicial</a>
                            </li>


                            <li class="nav-item">
                                <a class="nav-link active" href="Produtosmenu.aspx">Cardápio</a>
                            </li>



                        </ul>
                        <ul class="navbar-nav" id="btndrop" runat="server">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="bi bi-person-fill"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
                                    <asp:Label ID="lblSucesso" runat="server" CssClass="dropdown-item"></asp:Label>
                                    <li>
                                        <a class="dropdown-item" href="UsuarioHome.aspx">Meus dados</a>
                                    </li>
                                    <li>
                                        <asp:Button ID="btnsair" runat="server" CssClass="dropdown-item btn btn-link" Text="Sair" OnClick="btnsair_Click" />
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        <ul class="navbar-nav ">

                            <li>
                                <asp:Button ID="btnlogin" runat="server" CssClass="btn btn-outline-secondary" Text="Entrar" OnClick="btnlogin_Click" />

                                <button id="btncarrinho" type="button" class="btn btn-primary navbar-btn">
                                    Carrinho <span class="badge text-bg-secondary" id="pcount" runat="server"></span>
                                </button>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>


        </div>
        <div class="corpoCadastro" style="background: #2c2c2c;">
            <div class="box">
                <%--centro-cadastro--%>
                <div class="formula">
                    <h2>Meus pedidos</h2>
                    <br />
                    <div class="row">
                        <%--dados com endereço--%>
                        <asp:Repeater ID="repenviado" runat="server">
                            <ItemTemplate>

                                <div class="card" style="margin-bottom: 10px;">
                                    <h5 class="card-header">Pedido feito <%#Eval("pag_data") %> - <%#Eval("pag_hora") %></h5>
                                    <div class="card-body">
                                        <h5 class="card-title"><%#Eval("prod_nome") %></h5>
                                         <p class="card-text"><%#Eval("pag_descricao") %></p>
                                        <p></p>
                                        <div class="card-text">
                                            <b>Entrega em: </b>
                                            <%#Eval("pag_endereco") %>, <%#Eval("pag_numero") %>
                                        </div>
                                        <p></p>
                                        <div class="card-text"><b>Total:</b> R$ <%#String.Format("{0}",Convert.ToDouble(Eval("pag_cartotal"))) %> </div>
                                        <div class="card-text">
                                            <b>Forma de pagamento: </b><%#Eval("pag_tipo") %>
                                        </div>
                                        <img width="100%" src="Img/status3.png">
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:Repeater ID="reppreparando" runat="server">
                            <ItemTemplate>

                                <div class="card" style="margin-bottom: 10px;">
                                    <h5 class="card-header">Pedido feito <%#Eval("pag_data") %> - <%#Eval("pag_hora") %></h5>
                                    <div class="card-body">
                                        <h5 class="card-title"><%#Eval("prod_nome") %></h5>
                                         <p class="card-text"><%#Eval("pag_descricao") %></p>
                                        <p></p>
                                        <div class="card-text">
                                            <b>Entrega em: </b>
                                            <%#Eval("pag_endereco") %>, <%#Eval("pag_numero") %>
                                        </div>
                                        <p></p>
                                        <div class="card-text"><b>Total:</b> R$ <%#String.Format("{0}",Convert.ToDouble(Eval("pag_cartotal"))) %> </div>
                                        <div class="card-text">
                                            <b>Forma de pagamento: </b><%#Eval("pag_tipo") %>
                                        </div>
                                        <img width="100%" src="Img/status2.png">
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:Repeater ID="reppedido" runat="server">
                            <ItemTemplate>

                                <div class="card" style="margin-bottom: 10px;">
                                    <h5 class="card-header">Pedido feito <%#Eval("pag_data") %> - <%#Eval("pag_hora") %></h5>
                                    <div class="card-body">
                                        <h5 class="card-title"><%#Eval("prod_nome") %></h5>
                                         <p class="card-text"><%#Eval("pag_descricao") %></p>
                                        <p></p>
                                        <div class="card-text">
                                            <b>Entrega em: </b>
                                            <%#Eval("pag_endereco") %>, <%#Eval("pag_numero") %>
                                        </div>
                                        <p></p>
                                        <div class="card-text"><b>Total:</b> R$ <%#String.Format("{0}",Convert.ToDouble(Eval("pag_cartotal"))) %> </div>
                                        <div class="card-text">
                                            <b>Forma de pagamento: </b><%#Eval("pag_tipo") %>
                                        </div>
                                        <img width="100%" src="Img/status1.png">
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <%--dados para retirada--%>
                        <asp:Repeater ID="repenviado1" runat="server">
                            <ItemTemplate>

                                <div class="card" style="margin-bottom: 10px;">
                                    <h5 class="card-header">Pedido feito <%#Eval("pag_data") %> - <%#Eval("pag_hora") %></h5>
                                    <div class="card-body">
                                        <h5 class="card-title"><%#Eval("prod_nome") %></h5>
                                         <p class="card-text"><%#Eval("pag_descricao") %></p>
                                        <p></p>
                                        <div class="card-text">
                                           <b>Retirada no estabelecimento</b>
                                        </div>
                                        <p></p>
                                        <div class="card-text"><b>Total:</b> R$ <%#String.Format("{0}",Convert.ToDouble(Eval("pag_cartotal"))) %> </div>
                                        <div class="card-text">
                                            <b>Forma de pagamento: </b><%#Eval("pag_tipo") %>
                                        </div>
                                        <img width="100%" src="Img/status4.png">
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:Repeater ID="reppreparando1" runat="server">
                            <ItemTemplate>

                                <div class="card" style="margin-bottom: 10px;">
                                    <h5 class="card-header">Pedido feito <%#Eval("pag_data") %> - <%#Eval("pag_hora") %></h5>
                                    <div class="card-body">
                                        <h5 class="card-title"><%#Eval("prod_nome") %></h5>
                                         <p class="card-text"><%#Eval("pag_descricao") %></p>
                                        <p></p>
                                        <div class="card-text">
                                           <b>Retirada no estabelecimento</b>
                                        </div>
                                        <p></p>
                                        <div class="card-text"><b>Total:</b> R$ <%#String.Format("{0}",Convert.ToDouble(Eval("pag_cartotal"))) %> </div>
                                        <div class="card-text">
                                            <b>Forma de pagamento: </b><%#Eval("pag_tipo") %>
                                        </div>
                                        <img width="100%" src="Img/status5.png">
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:Repeater ID="reppedido1" runat="server">
                            <ItemTemplate>

                                <div class="card" style="margin-bottom: 10px;">
                                    <h5 class="card-header">Pedido feito <%#Eval("pag_data") %> - <%#Eval("pag_hora") %></h5>
                                    <div class="card-body">
                                        <h5 class="card-title"><%#Eval("prod_nome") %></h5>
                                         <p class="card-text"><%#Eval("pag_descricao") %></p>
                                        <p></p>
                                        <div class="card-text">
                                            <b>Retirada no estabelecimento</b>
                                        </div>
                                        <p></p>
                                        <div class="card-text"><b>Total:</b> R$ <%#String.Format("{0}",Convert.ToDouble(Eval("pag_cartotal"))) %> </div>
                                        <div class="card-text">
                                            <b>Forma de pagamento: </b><%#Eval("pag_tipo") %>
                                        </div>
                                        <img width="100%" src="Img/status6.png">
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>


                        <br />
                        <h2>Histórico</h2>
                        <asp:Repeater ID="repconcluido" runat="server">
                            <ItemTemplate>
                                <div class="col-md-6">
                                    <div class="card" style="margin-bottom: 10px;">
                                        <h6 class="card-header">Pedido feito <%#Eval("pag_data") %></h6>
                                        <div class="card-body">

                                            <h5 class="card-title"><%#Eval("prod_nome") %></h5>
                                            <div class="card-text">Total: R$<strong> <%#String.Format("{0}",Convert.ToDouble(Eval("pag_cartotal"))) %> </strong></div>

                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <%-- Footer --%>
                </div>
            </div>
        </div>
        <footer>
            <div class="container">
                <ul class="icona">
                    <li><a href="https://www.facebook.com/" class="text-decoration-none">
                        <ion-icon name="logo-facebook"></ion-icon>
                    </a></li>
                    <li><a href="https://twitter.com/" class="text-decoration-none">
                        <ion-icon name="logo-twitter"></ion-icon>
                    </a></li>
                    <li><a href="https://br.linkedin.com/" class="text-decoration-none">
                        <ion-icon name="logo-linkedin"></ion-icon>
                    </a></li>
                    <li><a href="https://www.instagram.com/" class="text-decoration-none">
                        <ion-icon name="logo-instagram"></ion-icon>
                    </a></li>
                </ul>
                <div class="elementFooter">
                    <ul class="itens">
                        <li><a href="SobreNos.aspx">Sobre Nós</a></li>
                        <li><a href="FaleConosco.aspx">Contatos</a></li>
                        <li><a href="Sugestao.aspx">Sugestão</a></li>
                    </ul>
                    <%-- <p class="pull-right"><a href="#">Voltar ao Topo</a></p>--%>
                    <p class="mb-0">
                        &copy; 2022 Los Hermanos Burguer.com | Todos os direitos reservados
                    </p>
                </div>
            </div>
        </footer>
        <%-- Footer --%>
    </form>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/Sitecustomi.js"></script>

</body>
</html>
