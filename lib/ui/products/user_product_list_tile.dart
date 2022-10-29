import 'package:flutter/material.dart';
import '../../models/product.dart';
import 'package:provider/provider.dart';
import 'edit_product_screen.dart';
import 'products_manager.dart';

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
        onPressed: () {
          context.read<ProductsManager>().deleteProduct(product.id!);
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text(
                'Product deleted',
                textAlign: TextAlign.center,
             ),
           ),
        );
   },
        color: Theme.of(context).errorColor,
      );
    }
     Widget buidEditButton(BuildContext context){
      return IconButton(
        icon:const Icon(Icons.edit),
        onPressed:(){
          Navigator.of(context).pushNamed(
          EditProductScreen.routeName,
          arguments: product.id,
       );

        },
        color: Theme.of(context).primaryColor,
      );
    }


    
  }
