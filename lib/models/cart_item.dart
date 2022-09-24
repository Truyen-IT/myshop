class CartItem{//day la lop san pham cua toi
  final String? id;//final trong class là hoạt đọngo bình thường và còn const thì hoạt động static và phải có giá trị
  final String title;
  final int quantity;
  final double price;
  
  CartItem({
    required this.id,
    required this.price,
    required this.title,
    required this.quantity,
   
  });
CartItem copyWith({//ham copy
    String? id,//final trong class là hoạt đọngo bình thường và còn const thì hoạt động static và phải có giá trị
    String? title,
    double? price,
    int? quantity,

  }){
    return CartItem(//ham dua ra cac bien
      id:id ??this.id,
      title:title?? this.title,
      quantity: quantity?? this.quantity,
      price: price??this.price,
     
     );
  }


}