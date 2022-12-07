<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cadastro.aspx.cs" Inherits="Cadastro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Cadastro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous" />
    <link href="css/Sitecustomi.css" rel="stylesheet" />

</head>
<body style="min-height: 100vh; background: #2c2c2c;">
    <form id="form1" runat="server">


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
                            <a class="nav-link" href="Index.aspx">Pagina inicial</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="Produtosmenu.aspx">Cardápio</a>
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


        <%-- Cadastro --%>

        <div class="corpoCadastro">
            <div class="box">
                <%--centro-cadastro--%>
                <div class="formula">
                    <h2>Cadastro</h2>

                    <div class="row">

                        <div class="col-md-12">
                            <label>Nome:</label>
                            <asp:TextBox ID="txtnome" type="text" runat="server" Class="form-control" minlength="2" required="required" placeholder="Insira seu nome"></asp:TextBox>
                        </div>

                        <div class="col-md-12">
                            <label>Celular:</label>
                            <asp:TextBox ID="txtcel" runat="server" Class="form-control" required="required" onkeypress="mask(this, mphone);" onblur="mask(this, mphone);" placeholder="Insira seu número de telefone"></asp:TextBox>
                            <%-- n cadastra no banco com a mask, onkeypress="mask(this, mphone);" onblur="mask(this, mphone);" --%>
                        </div>

                        <div class="col-md-12">
                            <label>CEP:</label>
                            <asp:TextBox ID="txtcep" runat="server" Class="form-control" value="" size="10" MaxLength="9" onblur="pesquisacep(this.value);" placeholder="Insira seu CEP"></asp:TextBox>
                        </div>

                        <div class="col-12 col-md-6">
                            <label>Rua:</label>
                            <asp:TextBox ID="txtendereco" runat="server" size="60" Class="form-control" required="required" placeholder="Insira sua rua"></asp:TextBox>
                        </div>

                        <div class="col-12 col-md-6">
                            <label>Número:</label>
                            <asp:TextBox ID="txtnumero" type="number" runat="server" Class="form-control" required="required" placeholder="Insira seu número"></asp:TextBox>
                        </div>

                        <div class="col-12 col-md-6">
                            <label>Bairro:</label>
                            <asp:TextBox ID="txtbairro" runat="server" size="40" Class="form-control" required="required" placeholder="Insira seu Bairro"></asp:TextBox>
                        </div>

                        <div class="col-12 col-md-6">
                            <label>Cidade:</label>
                            <asp:TextBox ID="txtcidade" runat="server" size="40" Class="form-control" required="required" placeholder="Insira sua cidade"></asp:TextBox>
                        </div>

                        <div class="col-12 col-md-12">
                            <label>UF:</label>
                            <asp:TextBox ID="txtuf" runat="server" size="2" Class="form-control" required="required" placeholder="UF"></asp:TextBox>
                        </div>

                        <div class="col-md-12">
                            <label>E-mail:</label>
                            <asp:TextBox ID="txtemail" runat="server" Class="form-control" required="required" type="email" placeholder="Insira seu email"></asp:TextBox>
                        </div>

                        <div class="col-md-12">
                            <label>Usuário:</label>
                            <asp:TextBox ID="txtusu" minlength="3" runat="server" Class="form-control" required="required" placeholder="Usuario"></asp:TextBox>
                        </div>

                        <div class="col-md-12">
                            <label>Senha:</label>
                            <div id="input" class="input-group mb-3">
                                <asp:TextBox ID="txtsenha" name="txtsenha" minlength="5" onKeyUp="verificaForcaSenha();" runat="server" Class="form-control" required="required" placeholder="Sua senha" TextMode="Password"></asp:TextBox>
                                <span class="input-group-text" id="basic-addon2">
                                    <img src="svg/eye.svg" alt="">
                                </span>
                            </div>
                            <span id="password-status"></span>

                        </div>

                        <div class="col-md-12">
                            <label>Confirma Senha:</label>
                            <div id="confirma" class="input-group mb-3">
                                <asp:TextBox ID="txtconfirmasen" name="txtconfirmasen" runat="server" Class="form-control" required="required" placeholder="Confirme sua senha" TextMode="Password"></asp:TextBox>
                                <span class="input-group-text" id="basic-addon2">
                                    <img src="svg/eye.svg" alt="">
                                </span>
                            </div>
                        </div>

                        <div class="col-md-4 offset-md-4 espaco-btn">
                            <asp:Button ID="btcadastro" runat="server" Class="btn botao corBotao" Text="Cadastrar" OnClick="btcadastro_Click" />
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <%-- Cadastro --%>

        <%-- Footer --%>
        <%--<hr />--%>
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
    <script src="js/Sitecustomi.js"></script>
    <script src="js/Cep.js"></script>
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
        var input1 = document.querySelector('#confirma input');
        var img1 = document.querySelector('#confirma img');
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
        var password = document.getElementById("txtsenha")
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

            if ($('#txtsenha').val().length < 6) {
                $('#password-status').html("<span style='color:red'>Senha Fraca,a Senha deve conter no minimo 5 caracteres.</span> <p><span style='color:red'> insira no mínimo 1 letra Maiuscula, 1 letra Minuscula, 1 Numero e 1 caracter especial.</span><p>");
            } else {
                if ($('#txtsenha').val().match(numeros) && $('#txtsenha').val().match(alfabeto) && $('#txtsenha').val().match(chEspeciais)) {
                    $('#password-status').html("<span style='color:green'><b>Senha Forte</b></span>");
                } else {
                    $('#password-status').html("<span style='color:orange'>Senha Média, insira um caracter especial</span>");
                }
            }
        }
    </script>


    <script>
        function mask(o, f) {
            setTimeout(function () {
                var v = mphone(o.value);
                if (v != o.value) {
                    o.value = v;
                }
            }, 1);
        }

        function mphone(v) {
            var r = v.replace(/\D/g, "");
            r = r.replace(/^0/, "");
            if (r.length > 10) {
                r = r.replace(/^(\d\d)(\d{5})(\d{4}).*/, "($1) $2-$3");
            } else if (r.length > 5) {
                r = r.replace(/^(\d\d)(\d{4})(\d{0,4}).*/, "($1) $2-$3");
            } else if (r.length > 2) {
                r = r.replace(/^(\d\d)(\d{0,5})/, "($1) $2");
            } else {
                r = r.replace(/^(\d*)/, "($1");
            }
            return r;
        }
    </script>

</body>
</html>
