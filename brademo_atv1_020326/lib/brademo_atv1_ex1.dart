class Equipamentos {
  var _nome;
  String _local;
  dynamic _numPatrimonio;

  Equipamentos(this._nome, this._local, this._numPatrimonio);

  Equipamentos.optional({var nome, String local = '', dynamic numPatrimonio})
    : _nome = nome,
      _local = local,
      _numPatrimonio = numPatrimonio;

  dynamic get nome => _nome;
  String get local => _local;
  dynamic get numPatrimonio => _numPatrimonio;

  set nome(var valor) => _nome = valor;
  set local(String valor) => _local = valor;
  set numPatrimonio(dynamic valor) => _numPatrimonio = valor;
}
