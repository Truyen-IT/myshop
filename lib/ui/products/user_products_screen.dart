import 'package:flutter/material.dart';
import 'user_product_list_tile.dart';
import 'products_manager.dart';//hinh anh
import '../shared/app_drawer.dart';


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
          buildAddButton(),
        ],

      ),
      drawer: const AppDrawer(),

      body:RefreshIndicator(
        onRefresh: ()async =>print('refreash product'),
        child: buidUserProductListView(productManager),
      ),
    );


  }
  Widget buidUserProductListView(ProductsManager productManager){
    return ListView.builder(
      itemCount: productManager.itemCount,
      itemBuilder:(ctx,i)=>Column(
        children: [
          UserProductListTile(
            productManager.items[i],
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget buildAddButton(){
    return IconButton(
      icon:const Icon(Icons.add),
      onPressed: (){
        print('go to edit product sreen');
      },
    );
  }

}