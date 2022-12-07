<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UsuarioHome.aspx.cs" Inherits="UsuarioHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Bem-Vindo</title>
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
                                        <a class="dropdown-item" href="MeusPedidos.aspx">Meus pedidos</a>
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
                    <h2>Meus Dados</h2>
                    <br />
                    <div class="row">
                        <div class="list-group">
                            <%-- incio --%>
                            <a href="DadosInformacoes.aspx" class="list-group-item list-group-item-action">
                                <div class="d-flex w-100 justify-content-between">
                                    <h5 class="mb-1">Informações e dados</h5>
                                </div>
                                <p class="mb-1">Nome, telefone, email e usuario.</p>
                            </a>
                            <%--  fim --%>
                            <%-- incio --%>
                            <a href="DadosEndereco.aspx" class="list-group-item list-group-item-action">
                                <div class="d-flex w-100 justify-content-between">
                                    <h5 class="mb-1">Endereço</h5>
                                </div>
                                <p class="mb-1">Endereço de entrega.</p>
                            </a>
                        
                        </div>
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
</body>
</html>
