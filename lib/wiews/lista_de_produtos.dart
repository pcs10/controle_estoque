import 'package:controle_estoque/componetes/produto_Tile.dart';
import 'package:controle_estoque/provider/produto.dart';
import 'package:controle_estoque/routes/routes.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListProdutos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Produt produto = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.PRODUTS_FORM);
            },
          ),
        ],
        title: Text('Lista de Produtos'),
      ),
      body: ListView.builder(
        itemCount: produto.count,
        itemBuilder: (ctx, i) => ProdutoTile(produto.all.elementAt(i)),
      ),
    );
  }
}
