import 'package:flutter/material.dart';
import 'package:myshop/ui/cart/cart_screen.dart';
import 'package:myshop/ui/products/products_manager.dart';
import 'package:provider/provider.dart';
import 'products_grid.dart';
import '../shared/app_drawer.dart';
import '../cart/cart_manager.dart';
import 'top_right_badge.dart';

enum FilterOptions { favorites, all }

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  final _showOnlyFavorites = ValueNotifier<bool>(false);
  late Future<void> _fetchProducts;
  @override
  void initState() {
    super.initState();
    _fetchProducts = context.read<ProductsManager>().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: <Widget>[
          buildProductFilterMenu(),
          buildShoppingCartIcon(),
        ],
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: _fetchProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ValueListenableBuilder<bool>(
              valueListenable: _showOnlyFavorites,
              builder: (context, onlyFavorites, child) {
                return ProductsGrid(onlyFavorites);
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget buildShoppingCartIcon() {
    return Consumer<CartManager>(
      builder: (ctx, cartManager, child) {
        return TopRightBadge(
          data: cartManager.productCount,
          child: IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
          ),
        );
      },
    );
  }

  Widget buildProductFilterMenu() {
    return PopupMenuButton(
      onSelected: (FilterOptions selectedValue) {
        if (selectedValue == FilterOptions.favorites) {
            _showOnlyFavorites.value = true;
          } else {
            _showOnlyFavorites.value = false;
          }
      },
      icon: const Icon(
        Icons.more_vert,
      ),
      itemBuilder: (ctx) => [
        const PopupMenuItem(
          value: FilterOptions.favorites,
          child: Text('Only Favorites'),
        ),
        const PopupMenuItem(
          value: FilterOptions.all,
          child: Text('Show all'),
        ),
      ],
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:myshop/ui/cart/cart_screen.dart';
// import 'package:myshop/ui/products/products_manager.dart';
// import 'package:provider/provider.dart';
// import 'products_grid.dart';
// import '../shared/app_drawer.dart';
// import '../cart/cart_manager.dart';
// import 'top_right_badge.dart';

// enum FilterOptions{ favorites ,all}
// class ProductsOverviewScreen extends StatefulWidget {
//   const ProductsOverviewScreen({super.key});
// //co dinh toi product_grid dart
//   @override
//   State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
// }
// //trang chu


// class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
//   // var _showOnlyFavotites =false;
//   final _showOnlyFavorites = ValueNotifier<bool>(false);
//   late Future<void> _fetchProducts;
//   @override
//   void initState() {
//     super.initState();
//     _fetchProducts = context.read<ProductsManager>().fetchProducts();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//        title:const Text('MyShop'),
//        actions:<Widget> [
//         buildShoppingCartIcon(),
//         buildProductFilterMenu()
//        ],
//       ),
//       drawer: const AppDrawer(),
//       body: FutureBuilder(
//         future: _fetchProducts,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return ValueListenableBuilder<bool>(
//               valueListenable: _showOnlyFavorites,
//               builder: (context, onlyFavorites, child) {
//                 return ProductsGrid(onlyFavorites);
//               }
//             );
//           }
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
//     );
//   }


//   //     body: ProductsGrid(_showOnlyFavotites),//day la ham hien thi productGrid
//   //   );
    
//   // }
  
  
//   Widget buildShoppingCartIcon(){//lam cai ham icon
//    return Consumer<CartManager>(
//    builder: (ctx, cartManager, child) { 

//    return TopRightBadge(
//       data: CartManager().productCount,
//       child: IconButton(


//       icon: const Icon(
        
//         Icons.shopping_cart,
//         ),
//       onPressed: (){
//       Navigator.of(context).pushNamed(CartScreen.routeName);



//       },
//     ),
//    );
//    },
//    );
  
 
// }
// Widget buildProductFilterMenu() {
//     return PopupMenuButton(
//       onSelected: (FilterOptions selectedValue) {
//         if (selectedValue == FilterOptions.favorites) {
//             _showOnlyFavorites.value = true;
//           } else {
//             _showOnlyFavorites.value = false;
//           }
//       },
//       icon: const Icon(
//         Icons.more_vert,
//       ),
//       itemBuilder: (ctx) => [
//         const PopupMenuItem(
//           value: FilterOptions.favorites,
//           child: Text('Only Favorites'),
//         ),
//         const PopupMenuItem(
//           value: FilterOptions.all,
//           child: Text('Show all'),
//         ),
//       ],
//     );
//   }
// }
 
// //   Widget buildProductFilterMenu(){//lam cai ham cho menu
// //     return PopupMenuButton(
// //       onSelected: (FitterOptions selectedValue){
// //         setState(() {
// //           if(selectedValue== FitterOptions.favorites){
// //             _showOnlyFavotites=true;
// //           } else {
// //              _showOnlyFavotites=false;

// //           }      
// //          });
// //       },
// //     icon:const Icon(
// //       Icons.more_vert,
// //     ),
// //     itemBuilder: (ctx) =>[
// //       const PopupMenuItem(
// //         value: FitterOptions.favorites,
// //         child: Text('only favorites'),
// //       ),
// //       const PopupMenuItem(
// //         value: FitterOptions.all,
// //         child: Text('Show All'),
// //       ),
// //     ],
// //     );
// //   }







// // }