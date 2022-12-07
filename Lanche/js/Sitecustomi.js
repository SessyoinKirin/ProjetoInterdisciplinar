//let botao = document.getElementById("btcadastro").addEventListener("mouseover", function () {
//    this.style.background = 'green';
//    this.style.color = 'red';
//});


//tive que fazer entrada e saida, com meu capacidade so consegui fazer separado


//let botao = document.getElementById("btcadastro");
//botao.addEventListener("mouseover", function () {
//    this.style.background = '#5cb85c';
//});
//botao.addEventListener("mouseleave", function () {
//    this.style.background = '#f23005';
//});

let botaoPousada = document.getElementById("btnadd").addEventListener("mouseover", function () {
    this.style.background = '#5cb85c';
})
let botaoRetirada = document.getElementById("btnadd").addEventListener("mouseleave", function () {
    this.style.background = '#f23005';
})



let senha = document.getElementById('txtsenha');
let senhaC = document.getElementById('txtconfirmasen');

function validarSenha() {
    if (senha.value != senhaC.value) {
        senhaC.setCustomValidity("Senhas diferentes!");
        senhaC.reportValidity();
        return false;
    } else {
        senhaC.setCustomValidity("");
        return true;
    }
}

// verificar também quando o campo for modificado, para que a mensagem suma quando as senhas forem iguais
senhaC.addEventListener('input', validarSenha);




