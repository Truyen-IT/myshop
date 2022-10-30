import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:myshop/ui/products/products_overview_screen.dart';
import 'package:myshop/ui/products/products_manager.dart';
import 'ui/screens.dart';
import 'package:provider/provider.dart';

// import 'ui/products/product_detail_screen.dart';
// import 'ui/products/products_manager.dart';
// import 'ui/products/user_products_screen.dart';
// import 'ui/cart/cart_screen.dart';
// import 'ui/orders/orders_screen.dart';
// 
Future<void> main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(
          create: (context) => AuthManager(),
        ),
         ChangeNotifierProvider(
        create: (ctx) => ProductsManager(),
        ),
         ChangeNotifierProvider(
        create: (ctx) => CartManager(),
        ),
         ChangeNotifierProvider(
        create: (ctx) => OrdersManager(),
        ),
      ],
    child: Consumer<AuthManager>(
      
      builder: (context, authManager, child) {
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
          
          //home: const ProductsOverviewScreen(),
           home: authManager.isAuth
              ? const ProductsOverviewScreen()
              : FutureBuilder(
                  future: authManager.tryAutoLogin(),
                  builder: (context, snapshot) {
                    return snapshot.connectionState == ConnectionState.waiting
                        ? const SplashScreen()
                        : const AuthScreen();
                  },
                ),
          routes: {
             CartScreen.routeName:
                (ctx) => const CartScreen(),
             OrdersScreen.routeName:
                (ctx) => const OrdersScreen(),
             UserProductsScreen.routeName:
                (ctx) => const UserProductsScreen(),
          },
          onGenerateRoute: (settings) {
             if (settings.name == ProductDetailScreen.routeName) {
                 final productId = settings.arguments as String;
                 return MaterialPageRoute(
                    builder: (ctx) {
                       return ProductDetailScreen(
                        ctx.read<ProductsManager>().findById(productId)
                          // ProductsManager().findById(productId),
                       );


                    },
                );
             }
             if (settings.name == EditProductScreen.routeName) {
                  final productId = settings.arguments as String?;
                  return MaterialPageRoute(
                    builder: (ctx) {
                      return EditProductScreen(
                        productId != null
                            ? ctx.read<ProductsManager>().findById(productId)
                            : null,
                      );
                    },
                  );
                }
                return null;
           
          
          
          // home:const SafeArea(
          //   child:UserProductsScreen(),

           
          //  child:ProductDetailScreen(
          //     ProductManager().items[0],

          //  ),
               
               // ProductManager().items[0],
           // child: OrdersScreen(),
            //child:CartScreen(),
            //UserProductsScreen(),
            //ProductsOverviewScreen(),//lien ket voi producoverviewsriem
           //ProductDetailScreen()//,ProductManager().items[2],
          // ProductsOverviewScreen()
          },
        );
      }
    ),
    );
  }
}

