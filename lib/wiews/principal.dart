import 'package:controle_estoque/routes/routes.dart';
import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  TextEditingController _img = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.format_align_justify),
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.PRINCIPAl_H);
            },
          ),
        ],
        title: Text('Bem vindo!!'),
      ),
      body: SingleChildScrollView(child: pagina()),
    );
  }

  pagina() {
    return Container(
      color: Colors.blue[100],
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Divider(
            height: 20,
            color: Colors.transparent,
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: Colors.white12,
            ),
            child: Text(
              'Bem vindo!',
              style: TextStyle(
                fontSize: 30,
                color: Colors.red[200],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            height: 10,
            color: Colors.transparent,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _img,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Digite o produto desejado...',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text(
                      'Buscar',
                      style: TextStyle(
                        color: Colors.green[300],
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 10,
          ),
          Container(
            height: 300,
            width: 400,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (_img.text == 'batata')
                    Image.asset(
                      'imagens/batata.PNG',
                      fit: BoxFit.contain,
                    )
                  else if (_img.text == 'brawnie')
                    Image.asset(
                      'imagens/brawnie.PNG',
                      fit: BoxFit.contain,
                    )
                  else if (_img.text == 'cafe')
                    Image.asset(
                      'imagens/cafe_3coracoes.PNG',
                      fit: BoxFit.contain,
                    )
                  else if (_img.text == 'maionese')
                    Image.asset(
                      'imagens/maionese.PNG',
                      fit: BoxFit.contain,
                    )
                  else if (_img.text == 'sardinha')
                    Image.asset(
                      'imagens/sardinha.PNG',
                      fit: BoxFit.contain,
                    )
                  else
                    Image.asset(
                      'imagens/nao_encontrado.jpg',
                      fit: BoxFit.contain,
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
