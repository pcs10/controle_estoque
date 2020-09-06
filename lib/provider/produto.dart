import 'dart:math';

import 'package:controle_estoque/data/dummy_produto.dart';
import 'package:controle_estoque/models/produto.dart';
import 'package:flutter/material.dart';

class Produt with ChangeNotifier {
  final Map<String, Produto> _items = {...DUMMY_PRODUTOS};
  List<Produto> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Produto byIndex(int i) {
    return _items.values.elementAt(i);
  }

  // altera o produto.
  void put(Produto produto) {
    if (produto == null) {
      return;
    }
    if (produto != null && _items.containsKey(produto.id)) {
      _items.update(
        produto.id,
        (_) => Produto(
          id: produto.id,
          nome: produto.nome,
          descricao: produto.descricao,
          avatarUrl: produto.avatarUrl,
        ),
      );
    }
    //adiciona produto
    else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => Produto(
          id: id,
          nome: produto.nome,
          descricao: produto.descricao,
          avatarUrl: produto.avatarUrl,
        ),
      );
    } //else
    notifyListeners();
  }

  void remove(Produto produto) {
    if (produto != null && produto.id != null) {
      _items.remove(produto.id);
      notifyListeners();
    }
  }
}
