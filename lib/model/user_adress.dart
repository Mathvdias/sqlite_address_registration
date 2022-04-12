class UserAddressModel {
  final int id;
  final String cep;
  final String rua;
  final String numero;
  final String bairro;
  final String complemento;
  final String cidade;
  final String estado;

  UserAddressModel(
    this.id,
    this.cep,
    this.rua,
    this.numero,
    this.bairro,
    this.complemento,
    this.cidade,
    this.estado,
  );
  @override
  String toString() {
    return 'UserAddress{id : $id, cep: $cep, rua: $rua, numero: $numero, bairro: $bairro, complemento: $complemento, cidade: $cidade, estado: $estado,}';
  }

  void add(UserAddressModel userAddress) {}
}
