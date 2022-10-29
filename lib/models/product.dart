import 'package:flutter/foundation.dart';
class Product{//day la lop san pham cua toi
  final String? id;//final trong class là hoạt đọngo bình thường và còn const thì hoạt động static và phải có giá trị
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final ValueNotifier<bool> _isFavorite;
  Product({
    this.id,
    required this.description,
    required this.price,
    required this.title,
    required this.imageUrl,
    isFavorite=false,

  }): _isFavorite = ValueNotifier(isFavorite);
  
   set isFavorite(bool newValue) {
    _isFavorite.value = newValue;
  }

  bool get isFavorite {
    return _isFavorite.value;
  }

  ValueNotifier<bool> get isFavoriteListenable {
    return _isFavorite;
  }
  
  Product copyWith({//ham copy
    String? id,//final trong class là hoạt đọngo bình thường và còn const thì hoạt động static và phải có giá trị
    String? title,
    String? description,
    double? price,
    String? imageUrl,
    bool? isFavorite,

  }){
    return Product(//ham dua ra cac bien
      id:id ??this.id,
      title:title?? this.title,
      description: description??this.description,
      price: price??this.price,
      imageUrl: imageUrl??this.imageUrl,
      isFavorite: isFavorite??this.isFavorite,
     );
  }


}