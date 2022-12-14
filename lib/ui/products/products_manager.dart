// import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../../models/auth_token.dart';
// import 'package:provider/provider.dart';
import '../../models/product.dart';
import '../../services/products_service.dart';

class ProductsManager with ChangeNotifier {
  List<Product> _items = [];
  final ProductsService _productsService;
  ProductsManager([AuthToken? authToken])
      : _productsService = ProductsService(authToken);
  set authToken(AuthToken? authToken) {
    _productsService.authToken = authToken;
  }

  Future<void> fetchProducts([bool filterByUser = false]) async {
    _items = await _productsService.fetchProducts(filterByUser);
    notifyListeners();
  }

  Future<void> addProduct(Product product) async {
    final newProduct = await _productsService.addProduct(product);
    if (newProduct != null) {
      _items.add(newProduct);
      notifyListeners();
    }
  }

  int get itemCount {
    return _items.length;
  }

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> updateProduct(Product product) async {
    final index = _items.indexWhere((item) => item.id == product.id);
    if (index >= 0) {
      if (await _productsService.updateProduct(product)) {
        _items[index] = product;
        notifyListeners();
      }
    }
  }

  Future<void> deleteProduct(String id) async {
    final index = _items.indexWhere((item) => item.id == id);
    Product? existingProduct = _items[index];
    _items.remove(index);
    notifyListeners();
    if (!await _productsService.deleteProduct(id)) {
      _items.insert(index, existingProduct);
      notifyListeners();
    }
  }

  Future<void> tonggleFavoriteStatus(Product product) async {
    final savedStatus = product.isFavorite;
    product.isFavorite = !savedStatus;
    if (!await _productsService.saveFavoriteStatus(product)) {
      product.isFavorite = savedStatus;
    }
  }
}



// // import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import '../../models/auth_token.dart';
// // import 'package:provider/provider.dart';
// import '../../models/product.dart';
// import '../../services/products_service.dart';

// class ProductsManager with ChangeNotifier {
//   List<Product> _items = [];
//   final ProductsService _productsService;
//   ProductsManager([AuthToken? authToken])
//       : _productsService = ProductsService(authToken);
//   set authToken(AuthToken? authToken) {
//     _productsService.authToken = authToken;
//   }

//   Future<void> fetchProducts([bool filterByUser = false]) async {
//     _items = await _productsService.fetchProducts(filterByUser);
//     notifyListeners();
//   }

//   Future<void> addProduct(Product product) async {
//     final newProduct = await _productsService.addProduct(product);
//     if (newProduct != null) {
//       _items.add(newProduct);
//       notifyListeners();
//     }
//   }

//   int get itemCount {
//     return _items.length;
//   }

//   List<Product> get items {
//     return [..._items];
//   }

//   List<Product> get favoriteItems {
//     return _items.where((prodItem) => prodItem.isFavorite).toList();
//   }

//   Product findById(String id) {
//     return _items.firstWhere((prod) => prod.id == id);
//   }

//   Future<void> updateProduct(Product product) async {
//     final index = _items.indexWhere((item) => item.id == product.id);
//     if (index >= 0) {
//       if (await _productsService.updateProduct(product)) {
//         _items[index] = product;
//         notifyListeners();
//       }
//     }
//   }

//   Future<void> deleteProduct(String id) async {
//     final index = _items.indexWhere((item) => item.id == id);
//     Product? existingProduct = _items[index];
//     _items.remove(index);
//     notifyListeners();
//     if (!await _productsService.deleteProduct(id)) {
//       _items.insert(index, existingProduct);
//       notifyListeners();
//     }
//   }

//   Future<void> tonggleFavoriteStatus(Product product) async {
//     final savedStatus = product.isFavorite;
//     product.isFavorite = !savedStatus;
//     if (!await _productsService.saveFavoriteStatus(product)) {
//       product.isFavorite = savedStatus;
//     }
//   }
// }



// import '../../models/auth_token.dart';
// import '../../models/product.dart';
// import 'package:flutter/foundation.dart';

// import '../../services/products_service.dart';


// class ProductsManager with ChangeNotifier {
//   List<Product> _items = [];
//   final ProductsService _productsService;
//   ProductsManager([AuthToken? authToken])
//       : _productsService = ProductsService(authToken);
//   set authToken(AuthToken? authToken) {
//     _productsService.authToken = authToken;
//   }

//   Future<void> fetchProducts([bool filterByUser = false]) async {
//     _items = await _productsService.fetchProducts(filterByUser);
//     notifyListeners();
//   }

//   Future<void> addProduct(Product product) async {
//     final newProduct = await _productsService.addProduct(product);
//     if (newProduct != null) {
//       _items.add(newProduct);
//       notifyListeners();
//     }
//   }

// // class ProductsManager with ChangeNotifier{
// //  final List<Product> _items = [//danh sach<so san pham>  item la a[4];
// //     Product(
// //       id: 'p1',
// //       title: 'Red Shirt',
// //       description: 'A red shirt - it is pretty red!',
// //       price: 29.99,
// //       imageUrl:
// //           'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
// //       isFavorite: true,
// //     ),
// //     Product(
// //       id: 'p2',
// //       title: 'Trousers',
// //       description: 'A nice pair of trousers.',
// //       price: 59.99,
// //       imageUrl:
// //           'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
// //     ),
// //     Product(
// //       id: 'p3',
// //       title: 'Yellow Scarf',
// //       description: 'Warm and cozy - exactly what you need for the winter.',
// //       price: 19.99,
// //       imageUrl:
// //           'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
// //     ),
// //     Product(
// //       id: 'p4',
// //       title: 'A Pan',
// //       description: 'Prepare any meal you want.',
// //       price: 49.99,
// //       imageUrl:
// //           'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
// //       isFavorite: true,
// //     ),
     
// //   ];




//   int get itemCount{
//     return _items.length;//neu no la 2 thi la 2 cai hinh

//   }
//   List<Product> get items{
//     return [... _items];//hien thi ra cac item
//   }
//   List<Product>get favoriteItems{//item yeu thich
//     return _items.where((prodItem) => prodItem.isFavorite).toList();
//   }
//   Product findById(String id) {
//     return _items.firstWhere((prod) => prod.id == id);
// }

//   // void addProduct(Product product){
//   //  _items.add(
//   //    product.copyWith(
//   //     id: 'p${DateTime.now().toIso8601String()}',
//   //    ),
//   //  );
//   //     notifyListeners();
//   //   }
//   Future<void> updateProduct(Product product) async {
//     final index = _items.indexWhere((item) => item.id == product.id);
//     if (index >= 0) {
//       if (await _productsService.updateProduct(product)) {
//         _items[index] = product;
//         notifyListeners();
//       }
//     }
//   }
  

// // void updateProduct(Product product){
// //     final index = _items.indexWhere((item) => item.id == product.id);
// //     if (index >= 0) {
// //       _items[index] = product;
// //         notifyListeners();
// //       }
// //     }

//   void tonggleFavoriteStatus(Product product){
//     final savedStatus = product.isFavorite;
//     product.isFavorite = !savedStatus;
    
//   }
//   Future<void> deleteProduct(String id) async {
//     final index = _items.indexWhere((item) => item.id == id);
//     Product? existingProduct = _items[index];
//     _items.remove(index);
//     notifyListeners();
//     if (!await _productsService.deleteProduct(id)) {
//       _items.insert(index, existingProduct);
//       notifyListeners();
//     }
//   }

//   //  void deleteProduct(String id) {
//   //   final index = _items.indexWhere((item) => item.id == id);
   
//   //   _items.removeAt(index);
//   //   notifyListeners();
    
//   // }


// }