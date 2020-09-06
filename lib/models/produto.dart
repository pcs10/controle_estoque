class Produto{
  final String id;
  final String nome;
  final String descricao;
  final String avatarUrl;
  
  const Produto ({
    this.id,
    @override this.nome,
    @override this.descricao,
    @override this.avatarUrl,

  });

  bool get isNotEmpty => null;

  void remove(Produto produto) {}
}