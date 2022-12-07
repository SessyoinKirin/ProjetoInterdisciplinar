<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DadosSenha.aspx.cs" Inherits="DadosSenha" %>

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
                    <h2>Meus Dados</h2>
                    <br />
                    <div class="row">

                        <div class="col-md-12">
                            <label>Senha atual:</label>
                            <div id="input" class="input-group mb-3">
                                <input id="txtsenhaatual" name="txtsenhaatual" minlength="5" runat="server" class="form-control" required="required" placeholder="Sua senha atual" type="password" />
                                <span class="input-group-text">
                                    <img src="svg/eye.svg" alt="">
                                </span>
                            </div>

                        </div>

                        <div class="col-md-12">
                            <label>Nova senha:</label>
                            <div id="input1" class="input-group mb-3">
                                <input id="txtsenha" name="txtsenhanova" minlength="5" onkeyup="verificaForcaSenha();" runat="server" class="form-control" required="required" placeholder="Sua senha" type="password" />
                                <span class="input-group-text" id="basic-addon2">
                                    <img src="svg/eye.svg" alt="">
                                </span>
                            </div>
                            <span id="password-status"></span>

                        </div>

                        <div class="col-md-12">
                            <label>Confirma Senha:</label>
                            <div id="confirma" class="input-group mb-3">
                                <input id="txtconfirmasen" name="txtconfirmasen" runat="server" class="form-control" required="required" placeholder="Confirme sua senha" type="password" />
                                <span class="input-group-text" id="basic-addon2">
                                    <img src="svg/eye.svg" alt="">
                                </span>
                            </div>
                        </div>
                        <div class="col-md-6  espaco-btn">
                            <asp:Button ID="btnalterar" runat="server" Text="Alterar" class="btn botao corBotao" OnClick="btnalterar_Click" />
                        </div>
                        <div class="col-md-6 espaco-btn">
                            <button type="button" class="btn botao corBotao"><a style="text-decoration: none; color: #f23005;" href="UsuarioHome.aspx">Voltar</a></button>
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

    <script>
        var input = document.querySelector('#input input');
        var img = document.querySelector('#input img');
        img.addEventListener('click', function () {
            input.classList.toggle('visible');
            if (input.classList.contains('visible')) {
                img.src = 'svg/eye-slash.svg';
                input.type = 'text';
            } else {
                img.src = 'svg/eye.svg';
                input.type = 'password';
            }
        });
    </script>
    <script>
        var input1 = document.querySelector('#input1 input');
        var img1 = document.querySelector('#input1 img');
        img1.addEventListener('click', function () {
            input1.classList.toggle('visible');
            if (input1.classList.contains('visible')) {
                img1.src = 'svg/eye-slash.svg';
                input1.type = 'text';
            } else {
                img1.src = 'svg/eye.svg';
                input1.type = 'password';
            }
        });
    </script>

    <script>
        var input2 = document.querySelector('#confirma input');
        var img2 = document.querySelector('#confirma img');
        img2.addEventListener('click', function () {
            input2.classList.toggle('visible');
            if (input2.classList.contains('visible')) {
                img2.src = 'svg/eye-slash.svg';
                input2.type = 'text';
            } else {
                img2.src = 'svg/eye.svg';
                input2.type = 'password';
            }
        });
    </script>

    <script>
        var password = document.getElementById("txtsenhanova")
            , confirm_password = document.getElementById("txtconfirmasen");

        function validatePassword() {
            if (password.value != confirm_password.value) {
                confirm_password.setCustomValidity("Senhas diferentes!");
            } else {
                confirm_password.setCustomValidity('');
            }
        }

        password.onchange = validatePassword;
        confirm_password.onkeyup = validatePassword;

    </script>

    <script
        src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous">
    </script>

    <script>
        function verificaForcaSenha() {
            var numeros = /([0-9])/;
            var alfabeto = /([a-zA-Z])/;
            var chEspeciais = /([~,!,@,#,$,%,^,&,*,-,_,+,=,?,>,<])/;

            if ($('#txtsenhanova').val().length < 6) {
                $('#password-status').html("<span style='color:red'>Senha Fraca,a Senha deve conter no minimo 5 caracteres.</span> <p><span style='color:red'> insira no mínimo 1 letra Maiuscula, 1 letra Minuscula, 1 Numero e 1 caracter especial.</span><p>");
            } else {
                if ($('#txtsenhanova').val().match(numeros) && $('#txtsenhanova').val().match(alfabeto) && $('#txtsenhanova').val().match(chEspeciais)) {
                    $('#password-status').html("<span style='color:green'><b>Senha Forte</b></span>");
                } else {
                    $('#password-status').html("<span style='color:orange'>Senha Média, insira um caracter especial</span>");
                }
            }
        }
    </script>

</body>
</html>
