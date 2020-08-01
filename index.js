$(document).on("click", ".navbar-right .dropdown-menu", function(e){
    e.stopPropagation();
});
function limpa_formulário_cep() {
    document.getElementById('rua').value=("");
    document.getElementById('bairro').value=("");
    document.getElementById('cidade').value=("");
    document.getElementById('uf').value=("");
}

function meu_callback(conteudo) {
if (!("erro" in conteudo)) {
    document.getElementById('rua').value=(conteudo.logradouro);
    document.getElementById('bairro').value=(conteudo.bairro);
    document.getElementById('cidade').value=(conteudo.localidade);
    document.getElementById('uf').value=(conteudo.uf);
} 
else {
    limpa_formulário_cep();
    alert("CEP não encontrado.");
}
}

function pesquisacep(valor) {

var cep = valor.replace(/\D/g, '');

if (cep != "") {

    var validacep = /^[0-9]{8}$/;

    if(validacep.test(cep)) {

        document.getElementById('rua').value="...";
        document.getElementById('bairro').value="...";
        document.getElementById('cidade').value="...";
        document.getElementById('uf').value="...";

        var script = document.createElement('script');

        script.src = `https://viacep.com.br/ws/${cep}/json/?callback=meu_callback`;

        document.body.appendChild(script);

    } 
    else {
        limpa_formulário_cep();
        alert("Formato de CEP inválido.");
    }
} 
else {
    limpa_formulário_cep();
}
}

function formatar(mascara, documento){
  var i = documento.value.length;
  var saida = mascara.substring(0,1);
  var texto = mascara.substring(i);
  
  if (texto.substring(0,1) != saida){
            documento.value += texto.substring(0,1);
  }
  
}
 
function idade (){
    var data=document.getElementById("dtnasc").value;
    var dia=data.substr(0, 2);
    var mes=data.substr(3, 2);
    var ano=data.substr(6, 4);
    var d = new Date();
    var ano_atual = d.getFullYear(),
        mes_atual = d.getMonth() + 1,
        dia_atual = d.getDate();
        
        ano=+ano,
        mes=+mes,
        dia=+dia;
        
    var idade=ano_atual-ano;
    
    if (mes_atual < mes || mes_atual == mes_aniversario && dia_atual < dia) {
        idade--;
    }
return idade;
} 
function validarSenha(senha, confirmarSenha)
{
		var senha1 = document.getElementById(senha).value;
    var senha2 = document.getElementById(confirmarSenha).value;
        console.log(senha1);
    if(senha2 == ""){return;}
    if (senha1 != "" &&
        senha2 != "" &&
        senha1 !== senha2)
        {
        	alert('senha diferentes');
        }

}
  

