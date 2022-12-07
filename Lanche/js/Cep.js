
function limpa_formulário_cep() {
    //Limpa valores do formulário de cep.
    document.getElementById('txtendereco').value = ("");
    document.getElementById('txtbairro').value = ("");
    document.getElementById('txtcidade').value = ("");
    document.getElementById('txtuf').value = ("");
}

function meu_callback(conteudo) {
    if (!("erro" in conteudo)) {
        //Atualiza os campos com os valores.
        document.getElementById('txtendereco').value = (conteudo.logradouro);
        document.getElementById('txtbairro').value = (conteudo.bairro);
        document.getElementById('txtcidade').value = (conteudo.localidade);
        document.getElementById('txtuf').value = (conteudo.uf);
    } //end if.
    else {
        //CEP não Encontrado.
        limpa_formulário_cep();
        alert("CEP não encontrado.");
    }
}

function pesquisacep(valor) {

    //Nova variável "cep" somente com dígitos.
    var txtcep = valor.replace(/\D/g, '');

    //Verifica se campo cep possui valor informado.
    if (txtcep != "") {

        //Expressão regular para validar o CEP.
        var validacep = /^[0-9]{8}$/;

        //Valida o formato do CEP.
        if (validacep.test(txtcep)) {

            //Preenche os campos com "..." enquanto consulta webservice.
            document.getElementById('txtendereco').value = "...";
            document.getElementById('txtbairro').value = "...";
            document.getElementById('txtcidade').value = "...";
            document.getElementById('txtuf').value = "...";

            //Cria um elemento javascript.
            var script = document.createElement('script');

            //Sincroniza com o callback.
            script.src = 'https://viacep.com.br/ws/' + txtcep + '/json/?callback=meu_callback';

            //Insere script no documento e carrega o conteúdo.
            document.body.appendChild(script);

        } //end if.
        else {
            //cep é inválido.
            limpa_formulário_cep();
            alert("Formato de CEP inválido.");
        }
    } //end if.
    else {
        //cep sem valor, limpa formulário.
        limpa_formulário_cep();
    }
};