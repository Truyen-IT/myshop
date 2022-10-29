

import 'package:flutter/material.dart';
import 'edit_product_screen.dart';
import 'user_product_list_tile.dart';
import 'products_manager.dart';//hinh anh
import '../shared/app_drawer.dart';
import 'package:provider/provider.dart';
//import 'products_manager.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';
  const UserProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productManager=ProductsManager();//lay hinh anh va chu
    return Scaffold(
      appBar:AppBar(
        title:const Text('Your Products'),
        actions:<Widget> [
          buildAddButton(context),
        ],

      ),
      drawer: const AppDrawer(),

      body:RefreshIndicator(
        onRefresh: ()async =>print('refreash product'),
        child: buidUserProductListView(),//productManager
      ),
    );


  }
  Widget buidUserProductListView(){
    return Consumer<ProductsManager>(
    builder: (ctx, productsManager, child) {
     return ListView.builder(
      itemCount: productsManager.itemCount,
      itemBuilder:(ctx,i)=>Column(
        children: [
          UserProductListTile(
            productsManager.items[i],
          ),
          const Divider(),
        ],
      ),
    );
  },
    );
  }

  Widget buildAddButton(BuildContext context){
    return IconButton(
      icon:const Icon(Icons.add),
      onPressed: (){
       Navigator.of(context).pushNamed(
       EditProductScreen.routeName,
);

      },
    );
  }

}