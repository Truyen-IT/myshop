import 'package:flutter/material.dart';
import '../../models/product.dart';

class UserProductListTile extends StatelessWidget {
  final Product product;
  const UserProductListTile(
    this.product,{super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile( //dang danh sach
    title: Text(product.title),
    leading: CircleAvatar(backgroundImage:NetworkImage(product.imageUrl),
     ),
     trailing: SizedBox(
      width: 100,
      child: Row(children:<Widget> [
        buidEditButton(context),
        buidDeteButton(context),
      ],
      ),
     ),

    );
  }//dong cai Widget
    Widget buidDeteButton(BuildContext context){//hai ham ne
      return IconButton(
        icon:const Icon(Icons.delete),
        onPressed:()async{
          print('delete a product');
        },
        color: Theme.of(context).errorColor,
      );
    }
     Widget buidEditButton(BuildContext context){
      return IconButton(
        icon:const Icon(Icons.edit),
        onPressed:(){
          print('go to edit  product sreem');
        },
        color: Theme.of(context).primaryColor,
      );
    }


    
  }
