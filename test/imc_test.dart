import 'package:imc/models/pessoa.dart';
import 'package:test/test.dart';

void main() {
  test('calculo do imc com nome vazio', () {
    var pessoa = Pessoa("", 100.0, 2.0);
    expect(pessoa.calculaImc(), 25.0);
  });

  test('calculo do imc com peso 0', () {
    var pessoa = Pessoa("Léo", 0, 2.0);
    expect(pessoa.calculaImc(), 0);
  });

  test('calculo do imc com altura 0', () {
    var pessoa = Pessoa("Léo", 100, 0);
    expect(pessoa.calculaImc(), 0);
  });
}
