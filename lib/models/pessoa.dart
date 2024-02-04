class Pessoa {
  String _nome = "";
  double? _peso;
  double? _altura;

  void setNome(String nome) {
    _nome = nome;
  }

  String getNome() {
    return _nome;
  }

  void setPeso(double peso) {
    _peso = peso;
  }

  double? getPeso() {
    return _peso;
  }

  void setAltura(double altura) {
    _altura = altura;
  }

  double? getAltura() {
    return _altura;
  }

  Pessoa(String nome, double peso, double altura) {
    _nome = nome;
    _peso = peso;
    _altura = altura;
  }

  @override
  String toString() {
    return {"Nome": _nome, "Peso": _peso, "Altura": _altura}.toString();
  }

  double calculaImc() {
    double imc = _peso! / (_altura! * _altura!);
    if (!imc.isInfinite) {
      return imc;
    } else {
      return 0;
    }
  }

  String geraClassificacao(double imc) {
    String classificacao = "";
    if (imc < 16) {
      classificacao = "Inválida";
    } else if (imc >= 16 || imc < 17) {
      classificacao = "Magreza moderada";
    } else if (imc >= 17 || imc < 18.5) {
      classificacao = "Magreza leve";
    } else if (imc >= 18.5 || imc < 25) {
      classificacao = "Saudável";
    } else if (imc >= 25 || imc < 30) {
      classificacao = "Sobrepeso";
    } else if (imc >= 30 || imc < 35) {
      classificacao = "Obesidade Grau I";
    } else if (imc >= 35 || imc < 40) {
      classificacao = "Obesidade Grau II (Severa)";
    } else if (imc >= 40) {
      classificacao = "Obesidade Grau III (Mórbida)";
    }
    return classificacao;
  }
}
