import 'package:controle_estoque/models/produto.dart';
import 'package:controle_estoque/provider/produto.dart';
import 'package:controle_estoque/routes/routes.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProdutoTile extends StatelessWidget{
final Produto produto;
 
 const ProdutoTile(this.produto);
  @override 
  Widget build(BuildContext context){
    final avatar = produto.avatarUrl== null || produto.avatarUrl.isEmpty?
    CircleAvatar(child: Icon(Icons.person)): CircleAvatar(backgroundImage:NetworkImage(produto.avatarUrl));
   
    return ListTile(
      leading:avatar,
          title: Text(produto.nome),
             subtitle:Text(produto.descricao),
           //container para botoes
      trailing: Container(
        width: 100,
             child: Row(
               children:<Widget>[
        //botão de editar
  IconButton(
     icon:Icon(Icons.edit),
          color: Colors.orange,
      onPressed: (){
            Navigator.of(context).pushNamed(
                  Routes.PRODUTS_FORM,
                        arguments:produto,
          );
          },
          
          
            

            ),

          //botão de delete
  IconButton(
   icon: Icon(Icons.delete),
      color: Colors.red,
  onPressed: (){
      showDialog(context:context, builder: (ctx) => 
         AlertDialog(           
               title: Text('Excluir produto'),
                   content: Text(' Tem certeza que quer excluir este produto?'),
                         actions: <Widget>[
       FlatButton(
         child: Text('não'),
             onPressed:()=> Navigator.of(context).pop(false),
                  ),
                         FlatButton( 
                                     child: Text('sim'),
                                           onPressed:()=> Navigator.of(context).pop(true),
                                       ),
 ],
   ),   
       ) .then((confimed){
         if(confimed){
           Provider.of<Produt>(context, listen: false).remove(produto);
         }


       });
                
               
             
             },
            
        
        ),



      ],

      ),
      ),
    );
  }
}