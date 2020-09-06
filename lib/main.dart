import 'package:controle_estoque/provider/produto.dart';
import 'package:controle_estoque/routes/routes.dart';
import 'package:controle_estoque/wiews/lista_de_produtos.dart';
import 'package:controle_estoque/wiews/principal.dart';
import 'package:controle_estoque/wiews/produto_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(cxt)=>Produt(),
     child: MaterialApp(
      title: 'Controle de Estoque',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      routes: {
        Routes.PRINCIPAl_H:(_)=>ListProdutos(),
        Routes.HOME: (_)=>Principal(),
        Routes.PRODUTS_FORM: (_) => FormProduto()
      },
    ),
    );
  }
}