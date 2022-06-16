import 'package:flutter/foundation.dart';
import 'explosao_excption.dart';

class Campo {
  final int linha;
  final int coluna;
  final List<Campo> vizinhos = [];

  bool _aberto = false;
  bool _marcado = false;
  bool _minado = false;
  bool _explodido = false;

  Campo({
    required this.linha,
    required this.coluna,
  });
  //logica -> matriz
  //(2,3)(2,4)(2,5)
  //(3,3)(3,4)(3,5)
  //(4,3)(4,4)(4,5)

  void adiconarVizinho(Campo vizinho) {
    final deltaLinha = (linha - vizinho.linha).abs();
    final deltaColuna = (coluna - vizinho.coluna).abs();

    if (deltaLinha == 0 && deltaColuna == 0) {
      return;
    }

    if (deltaLinha <= 1 && deltaColuna <= 1) {
      vizinhos.add(vizinho);
    }
  }

  void abrirCampo() {
    if (_aberto) {
      return;
    }
    _aberto = true;

    if (_minado) {
      _explodido = true;
      throw ExplosaoException();
    }
//fazendo uma recursividade
    if (vizinhancaSegura) {
      vizinhos.forEach((viz) => viz.abrirCampo());
    }
  }

//mostrar no termino do jogo
  void revelarBomba() {
    if (_minado) {
      _aberto = true;
    }
  }

  void minar() {
    _minado = true;
  }

  void alternarMarcacao() {
    _marcado = !_marcado;
  }

  void reiniciar() {
    _aberto = false;
    _marcado = false;
    _minado = false;
    _explodido = false;
  }

  bool get minado {
    return _minado;
  }

  bool get explodido {
    return _explodido;
  }

  bool get aberto {
    return _aberto;
  }

  bool get marcado {
    return _marcado;
  }

  bool get campoResolvido {
    bool minadoEMarcado = minado && marcado;
    bool seguroEAberto = !minado && aberto;
    return minadoEMarcado || seguroEAberto;
  }

//buscar vizinhos seguros
  bool get vizinhancaSegura {
    return vizinhos.every((v) => !v._minado);
  }

  int get qtdMinasNasVizinhancas {
    return vizinhos.where((minas) => minas.minado).length;
  }
}
