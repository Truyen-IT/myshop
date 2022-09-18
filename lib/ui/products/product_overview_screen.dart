import 'package:flutter/material.dart';
import 'products_grid.dart';
enum FitterOptions{ favorites ,all}
class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavotites =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title:const Text('MyShop'),
       actions:<Widget> [
        buildShoppingCartIcon(),
        buildProductFilterMenu()
       ],
      ),
      body: ProductsGrid(_showOnlyFavotites),
    );
    
  }
  Widget buildShoppingCartIcon(){
    return IconButton(
      icon: const Icon(
        Icons.shopping_cart,
        ),
      onPressed: (){
        print('go to cart Screnn');

      },
    );
  }
  Widget buildProductFilterMenu(){
    return PopupMenuButton(
      onSelected: (FitterOptions selectedValue){
        setState(() {
          if(selectedValue== FitterOptions.favorites){
            _showOnlyFavotites=true;
          } else {
             _showOnlyFavotites=false;

          }      
         });
      },
    icon:const Icon(
      Icons.more_vert,
    ),
    itemBuilder: (ctx) =>[
      const PopupMenuItem(
        value: FitterOptions.favorites,
        child: Text('only favorites'),
      ),
      const PopupMenuItem(
        value: FitterOptions.all,
        child: Text('Show All'),
      ),
    ],
    );
  }







}