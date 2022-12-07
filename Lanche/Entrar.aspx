<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Entrar.aspx.cs" Inherits="Entrar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Entrar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous" />
    <link href="css/Sitecustomi.css" rel="stylesheet" />
   
</head>
<body style="min-height: 100vh; background: #2c2c2c;">
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
                        </ul>
                    </div>
                </div>
            </nav>
        </div>

        <%-- Login --%>
        <div class="corpoCadastro">
            <div class=" box">
                <div class="formula">
                    <h2>Login</h2>

                    <div class="col-md-12">
                        <asp:Label ID="txtusuario" runat="server" CssClass="control-label label" Text="Usuario"></asp:Label>
                        <asp:TextBox ID="Usuario" CssClass="form-control" runat="server" placeholder="Usuário"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" ErrorMessage="Nome de usuario é obrigatorio" ControlToValidate="Usuario"></asp:RequiredFieldValidator>
                    </div>

                    <div class="col-md-12">
                        <asp:Label ID="Label2" runat="server" CssClass="control-label label" Text="Senha"></asp:Label>
                        <div id="input" class="input-group mb-3">
                            <asp:TextBox ID="Senha" CssClass="form-control" runat="server" TextMode="Password" placeholder="Senha" aria-describedby="basic-addon2"></asp:TextBox>
                            <span class="input-group-text" id="basic-addon2">
                                <img src="svg/eye.svg" alt="">
                            </span>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" CssClass="text-danger" runat="server" ErrorMessage="Senha obrigatoria" ControlToValidate="Senha"></asp:RequiredFieldValidator>
                    </div>

                    <div class="col-md-12">
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                        <asp:Label ID="Label3" runat="server" CssClass="control-label label" Text="Lembra-me na próxima vez?"></asp:Label>

                    </div>
                    <div class="form-group">
                        
                        <div class="col-md-12">
                            <asp:Label ID="lblerro" runat="server" class="text-danger"></asp:Label>
                        </div>
                    </div>
                    <div class="col-md-12 espaco-btn">
                        <asp:Button ID="btnlogin" runat="server" Text="Entrar" class="btn botao corBotao" OnClick="btnlogin_Click" />
                    </div>
                    <div class="label mt-3">
                        <p>
                            Não possuí uma conta?
                            <asp:LinkButton ID="LinkButton1" CssClass="text-decoration-none" runat="server" PostBackUrl="~/Cadastro.aspx">Cadastrar.</asp:LinkButton>
                        </p>
                    </div>
                    <div class="label">
                        <p>
                            Sou usuário mas
                            <asp:LinkButton ID="lbesqueciasenha" CssClass="text-decoration-none" runat="server" PostBackUrl="~/Esqueciasenha.aspx">Esqueci a senha.</asp:LinkButton>
                        </p>
                    </div>

                </div>
            </div>

         
        </div>



        <%-- Login --%>

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

</body>
</html>
