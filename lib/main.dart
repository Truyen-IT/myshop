import 'package:flutter/material.dart';
import 'package:myshop/ui/products/product_overview_screen.dart';
import 'package:myshop/ui/products/products_manager.dart';
import 'ui/products/product_detail_screen.dart';
import 'ui/products/products_manager.dart';
import 'ui/products/user_products_screen.dart';
import 'ui/cart/cart_screen.dart';
import 'ui/orders/orders_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'xin chao',//nó ghi trên phần mêm khung trên 
      theme: ThemeData(//bao gồm màu cho phần chính
        fontFamily:'Lato',
        colorScheme: ColorScheme.fromSwatch(
           primarySwatch: Colors.red,
       ).copyWith(
        secondary: Colors.deepOrange,
       ),
    ),
      home: const SafeArea(
        child: OrdersScreen(),
       // child:CartScreen(),
        //UserProductsScreen(),
        //ProductsOverviewScreen(),//lien ket voi producoverviewsriem
       // ProductDetailScreen(),ProductManager().items[2],
      ),
    );
  }
}

