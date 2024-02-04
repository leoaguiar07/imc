import 'package:imc/models/console_utils.dart';
import 'package:imc/models/pessoa.dart';
import 'package:imc/execption/nome_invalid_exception.dart';

void execute() {
  String nome;
  double? altura;
  double? peso;

  print("Bem vindo ao calculadora de IMC!");
  nome = ConsoleUtils.lerStringComTexto("Digite seu nome (ou S para sair):");

  //Fechando o programa para nome inválido
  if (nome.trim() == "") {
    throw NomeInvalidoException();
  }
  // Ou poderia colocar em loop até colocar o nome da forma correta

  // while (nome.trim() == ""){
  //     nome = ConsoleUtils.lerStringComTexto("Digite novamente o nome do paciente:");
  //  }

  //Peso
  peso = ConsoleUtils.lerDoubleComTexto(
      "Digite o peso do paciente em quilos (ou S para sair)S:");

  // se peso.isNegative = nulo pega true se não pega ele mesmo
  while ((peso?.isNegative ?? true) || peso == 0) {
    peso = ConsoleUtils.lerDoubleComTexto(
        "Peso inválido! Digite novamente o peso do paciente em quilos (ou S para sair):");
  }

//Altura
  altura = ConsoleUtils.lerDoubleComTexto(
      "Digite a altura do paciente em metros (ou S para sair):");

  while ((altura?.isNegative ?? true) || altura == 0.0 || altura! > 3.0) {
    altura = ConsoleUtils.lerDoubleComTexto(
        "Altura inválida! Digite novamente a altura do paciente em metros (ou S para sair):");
  }

  //var pessoa = Pessoa(nome, peso ?? 0.0, altura ?? 0.0);
  var pessoa = Pessoa(nome, peso ?? 0.0, altura);

  double imc = pessoa.calculaImc();
  if (imc != 0) {
    print("O IMC do paciente ${pessoa.getNome()} é: $imc");
    String classificacao = pessoa.geraClassificacao(imc);
    print(
        "A classificação do paciente ${pessoa.getNome()} é: $classificacao");
  } else {
    print(
        "Não foi possível calcular o IMC e a classificação do paciente: ${pessoa.getNome()}.\nDados informados:\nNome: ${pessoa.getNome()}\nPeso: ${pessoa.getPeso()}\nAltura: ${pessoa.getAltura()} .");
  }
}
