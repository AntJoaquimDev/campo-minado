import 'package:campo_minado/models/campo.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  // Campo c = Campo(linha: 0, coluna: 0);
  group('Campo', () {
    Campo c = Campo(linha: 0, coluna: 0);
    test('Abrir Campo COM Explosão', () {
      c.minar();
      expect(() => c.abrirCampo(), throwsException);
    });

    test('Abrir Campo SEM Eplosão', () {
      Campo c = Campo(linha: 0, coluna: 0);
      c.abrirCampo();
      expect(c.abrirCampo, isTrue);
    });
    test('Adicionar NÂO vizinho', () {
      Campo c1 = Campo(linha: 3, coluna: 3);
      Campo c2 = Campo(linha: 3, coluna: 4);
      Campo c3 = Campo(linha: 2, coluna: 2);
      Campo c4 = Campo(linha: 4, coluna: 4);
      c1.adiconarVizinho(c2);
      c1.adiconarVizinho(c3);
      c1.adiconarVizinho(c4);
      expect(c1.vizinhos.length, 3);
    });
    test('Adicionar Vizinho', () {});
  });
}
