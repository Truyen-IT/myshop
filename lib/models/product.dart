class Product{//day la lop san pham cua toi
  final String? id;//final trong class là hoạt đọngo bình thường và còn const thì hoạt động static và phải có giá trị
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final bool isFavorite;
  Product({
    this.id,
    required this.description,
    required this.price,
    required this.title,
    required this.imageUrl,
    this.isFavorite=false,

  });
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