import 'package:flutter/material.dart';
import 'user_product_list_tile.dart';
import 'products_manager.dart';//hinh anh

class UserProductsScreen extends StatelessWidget {
  const UserProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productManager=ProductManager();//lay hinh anh va chu
    return Scaffold(
      appBar:AppBar(
        title:const Text('Your Products'),
        actions:<Widget> [
          buildAddButton(),
        ],

      ),
      body:RefreshIndicator(
        onRefresh: ()async =>print('refreash product'),
        child: buidUserProductListView(productManager),
      ),
    );


  }
  Widget buidUserProductListView(ProductManager productManager){
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