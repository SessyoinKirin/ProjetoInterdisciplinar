<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Esqueciasenha.aspx.cs" Inherits="Esqueciasenha" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Esqueci a Senha</title>
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
                            <a class="nav-link active" href="Index.aspx">Pagina inicial</a>
                        </li>



                        <li class="nav-item">
                            <a class="nav-link active" href="Entrar.aspx">Entrar</a>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>

         <div class="corpoCadastro">
             <div class="box" style="width:820px;">
        <div class="formula">
            <h2  class="mb-4">Recuperar senha</h2>
            
            <h4  style="color: #F25805;" class="mb-3">Digite seu E-mail para receber as instruções para recuperar a senha!</h4>
            <asp:Label ID="lbemail" runat="server" Style="color: #F25805" CssClass=" control-label" Text="Qual seu E-mail?"></asp:Label>
            <div class="row">
            <div class="col-md-6">
                
                <div>
                    <asp:TextBox ID="txtemail" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" CssClass="text-danger" runat="server" ErrorMessage="Por favor digite seu E-mail para recuperar a senha!" ControlToValidate="txtemail"></asp:RequiredFieldValidator>
                </div>
            </div>
                <div class="col-md-6">
                    <asp:Button ID="btncrecsenha" runat="server" CssClass="btn botao corBotao" OnClick="btncrecsenha_Click" Text="Enviar" />
                    
                </div>

                </div>
            <asp:Label ID="lblrecsenha" runat="server"></asp:Label>
            
        </div>
                 </div>
    </div>
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
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

    <script src="js/jquery-3.2.1.min.js"></script>
</body>
</html>
