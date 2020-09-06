import 'package:controle_estoque/models/produto.dart';
import 'package:controle_estoque/provider/produto.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormProduto extends StatefulWidget {
  @override
  _FormProdutoState createState() => _FormProdutoState();
}

class _FormProdutoState extends State<FormProduto> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(Produto produto) {
    if (produto != null) {
      _formData['id'] = produto.id;
      _formData['nome'] = produto.nome;
      _formData['descricao'] = produto.descricao;
      _formData['avatarUrl'] = produto.avatarUrl;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Produto produto = ModalRoute.of(context).settings.arguments;
    _loadFormData(produto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de Produtos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState.validate();
              if (isValid) {
                _form.currentState.save();
                Provider.of<Produt>(context, listen: false).put(
                  Produto(
                    id: _formData['id'],
                    nome: _formData['nome'],
                    descricao: _formData['descricao'],
                    avatarUrl: _formData['avatarUrl'],
                  ),
                );
              }

              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['nome'],
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'nome invalido ';
                  }
                  if (value.trim().length < 3) {
                    return 'nome tem que ter no minimo 3 letras';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) => _formData['nome'] = value,
              ),
              TextFormField(
                initialValue: _formData['descricao'],
                decoration: InputDecoration(labelText: 'Descrição'),
                onSaved: (value) => _formData['descricao'] = value,
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: InputDecoration(labelText: 'avatarUrl'),
                onSaved: (value) => _formData['avatarUrl'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
