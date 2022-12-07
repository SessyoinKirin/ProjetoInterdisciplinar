<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Los hermanos burguer</title>
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
                                <a class="nav-link " href="Produtosmenu.aspx">Cardápio</a>
                            </li>


                            <li class="nav-item" id="btncadas" runat="server">
                                <a class="nav-link" href="Cadastro.aspx">Cadastre-se</a>
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

            <%-- Carrosel --%>
            <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active" data-bs-interval="2000">
                        <img src="Img/Nhero-bg-1.jpg" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h2 class="letraCarousel">Os Melhores Lanches</h2>
                            <p><a class="btn btn-outline-secondary" href="Produtosmenu.aspx" role="button">Cardápio</a></p>

                        </div>
                    </div>
                    <div class="carousel-item" data-bs-interval="2000">
                        <img src="Img/hero-bg-2.jpg" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h2 class="letraCarousel">Conheça nossa equipe</h2>
                            <p><a class="btn btn-outline-secondary" href="SobreNos.aspx" role="button">Sobre nós</a></p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="Img/Nhero-bg-3.jpg" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h2 class="letraCarousel">O que você está esperando? Cadastre-se</h2>
                            <p><a class="btn btn-outline-secondary" href="Cadastro.aspx" role="button">Se junte a nós</a></p>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Anterior</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Proximo</span>
                </button>
            </div>
            <%-- Carrosel --%>
            <br />
            <%-- Conteudo  --%>
            <div class="container centro">
                <div class="row">
                    <div class="col-lg-4">
                        <img class="rounded-circle" src="Img/thumb.jpg" alt="thumb01" height="140" />
                        <h2>Cardápio</h2>
                        <p>Confira nosso delicioso cardápio com várias opções de lanches e bebidas.</p>
                        <p><a class="btn btn-secondary" href="Produtosmenu.aspx" role="button">Cardápio &raquo</a></p>

                    </div>
                    <div class="col-lg-4">
                        <img class="rounded-circle" src="Img/thumb2.jpg" alt="thumb02" height="140" />
                        <h2>Sobre nós</h2>
                        <p>Confira um pouco sobre nosso restaurante e nossa história.</p>
                        <p><a class="btn btn-secondary" href="SobreNos.aspx" role="button">Sobre nós &raquo</a></p>

                    </div>
                    <div class="col-lg-4">
                        <img class="rounded-circle" src="Img/thumb3.jpg" alt="thumb03" height="140" />
                        <h2>Mais pedidos</h2>
                        <p>Confira os lanches mais pedidos de nosso restaurante.</p>
                        <p><a class="btn btn-secondary" href="Produtosmenu.aspx" role="button">Mais pedidos &raquo</a></p>

                    </div>
                  
                </div>
            </div>
            <%-- Conteudo  --%>
            <%-- Footer --%>
          
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
        </div>


    </form>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function minhafunc() {
            $("#btncarrinho").click(function minhafunc() {
                window.location.href = "/Carrinho.aspx";


            });

        });
    </script>


</body>
</html>
