import 'package:flutter/material.dart';
import '../../models/product.dart';
import 'product_detail_screen.dart';
class ProductGriTile extends StatelessWidget {
  const ProductGriTile(
    this.product,{
      super.key,
    }
  );
  final Product product;//lien ket tu day ra
  

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),//bo tron
      child: GridTile(
        footer: buildGridFooterBar(context),
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(
            ProductDetailScreen.routeName,
             arguments: product.id,
            
            );
           
          },
          child:Image.network(
            product.imageUrl,
            fit:BoxFit.cover,
          )
        ),
       ),
    );
    
  }
Widget buildGridFooterBar(BuildContext context){
  return GridTileBar(
    backgroundColor: Colors.black87,
    leading: IconButton(
      icon:Icon(
        product.isFavorite ? Icons.favorite : Icons.favorite_border,
        ),

   
     color:Theme.of(context).colorScheme.secondary,
     onPressed: (){
      print('tongo a favirite product');
     },
     ),
    title:Text(
      product.title,
      textAlign:TextAlign.center,
  ),
  trailing:IconButton(icon: const Icon(
    Icons.shopping_cart,
  ),
  onPressed: (){
    print('add item cart');

  },
  color: Theme.of(context).colorScheme.secondary,
  ),

);

}
}