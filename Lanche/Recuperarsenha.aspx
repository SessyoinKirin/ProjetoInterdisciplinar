<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Recuperarsenha.aspx.cs" Inherits="Recuperarsenha" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Recuperar Senha</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous" />
    <link href="css/Sitecustomi.css" rel="stylesheet" />

</head>
<body style="background:#2c2c2c;">
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
                            <a class="nav-link active" href="Index.aspx">Pagina inicial</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="Produtosmenu.aspx">Cardápio</a>
                        </li>
                        

                        <li class="nav-item">
                            <a class="nav-link active" href="Entrar.aspx">Entrar</a>
                        </li>
                    </ul>
                  
                </div>
            </div>
        </nav>

        <div class="corpoCadastro">
            <div class="box" style="width:400px;">
            <div class="formula">
                <h2>Resetar a Senha</h2>
                
                <div class="form-group">
                    <asp:Label ID="lblmsg" runat="server" CssClass="col-md-2 control-label" Font-Size="XX-Large" Font-Bold="True"></asp:Label>

                </div>
                <div class="form-group mb-3 mt-3">
                    <asp:Label ID="lblsenha" runat="server" CssClass="col-md-2 control-label label" Text="Entre com a sua nova senha:" Visible="False"></asp:Label>
                    <div id="input"  class="input-group mb-3">
                        <asp:TextBox ID="txtnovasenha" CssClass="form-control" placeholder="Sua senha" name="txtnovasenha" onKeyUp="verificaForcaSenha();" runat="server" TextMode="Password" required="required" Visible="False"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorSenha" CssClass="text-danger" runat="server" ErrorMessage="Digite sua nova senha!" ControlToValidate="txtnovasenha" Visible="False"></asp:RequiredFieldValidator>
                        <span class="input-group-text" id="basic-addon2">
                                    <img src="svg/eye.svg" alt="">
                                </span>
                            </div>
                            <span id="password-status"></span>

                    <div class="form-group col-md-12">
                    <asp:Label ID="lblconfsenha" runat="server" CssClass="col-md-2 control-label label" Text="Confirme sua nova senha:" Visible="False"></asp:Label>
                    <div id="confirma" >
                        <div class="input-group mb-3">
                            <asp:TextBox ID="txtconfsenha" name="txtconfsenha" CssClass="form-control" placeholder="Confirma senha" runat="server" TextMode="Password" Visible="False"></asp:TextBox>
                        <span class="input-group-text" id="basic-addon2">
                                    <img src="svg/eye.svg" alt="">
                                </span>
                        </div>
                        <asp:CompareValidator ID="CompareValidatorSenha" runat="server" CssClass="text-danger" ErrorMessage="As Senhas Digitadas Não Conferem" ControlToValidate="txtnovasenha" ControlToCompare="txtconfsenha" Visible="False"></asp:CompareValidator>
                        
                    </div>
                </div>
                    </div>
                

                


                <div class="form-group">
                    
                    <div class="centro mt-4">
                        <asp:Button ID="btncrec" runat="server" CssClass="btn botao corBotao" Width="100px" Text="Enviar" Visible="False" OnClick="btncrec_Click" />

                    </div>

                </div>

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
        var password = document.getElementById("txtnovasenha")
            , confirm_password = document.getElementById("txtconfsenha");

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

            if ($('#txtnovasenha').val().length < 6) {
                $('#password-status').html("<span style='color:red'>Senha Fraca,a Senha deve conter no minimo 5 caracteres.</span> <p><span style='color:red'> insira no mínimo 1 letra Maiuscula, 1 letra Minuscula, 1 Numero e 1 caracter especial.</span><p>");
            } else {
                if ($('#txtnovasenha').val().match(numeros) && $('#txtnovasenha').val().match(alfabeto) && $('#txtnovasenha').val().match(chEspeciais)) {
                    $('#password-status').html("<span style='color:green'><b>Senha Forte</b></span>");
                } else {
                    $('#password-status').html("<span style='color:orange'>Senha Média, insira um caracter especial</span>");
                }
            }
        }
    </script>


    
</body>
</html>
