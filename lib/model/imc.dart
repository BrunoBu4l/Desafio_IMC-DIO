class IMC {
  double _peso = 0;
  double _altura = 0;
  String _classificacao = "";

  IMC(this._peso, this._altura, this._classificacao);

  String get classificacao => _classificacao;

  set classificacao(String classificacao) {
    _classificacao = classificacao;
  }

  double get peso => _peso;

  set peso(double peso) {
    _peso = peso;
  }

  double get altura => _altura;

  set altura(double altura) {
    _altura = altura;
  }

  @override
  String toString() {
    return {"Peso": _peso, "Altura": _altura, "Classificação": _classificacao}
        .toString();
  }
}
