import 'package:flutter/material.dart';
import 'product_grid_tile.dart';
import 'products_manager.dart';//ham hien thi hinh anh
class ProductsGrid extends StatelessWidget {
  final bool showFavorites;
  const ProductsGrid(this.showFavorites,{super.key});

 
 
  @override
  Widget build(BuildContext context) {
    final productsManager = ProductManager();//day la ham productmagager
    final products=
     showFavorites ? productsManager.favoriteItems :productsManager.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount:products.length,
      itemBuilder: (ctx ,i) => ProductGriTile(products[i]),//day la productGieptile//hien thi hinh anh ne
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:2,
        childAspectRatio: 3/2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,),
    
    );
  }
}