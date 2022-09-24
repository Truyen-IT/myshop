import '../../models/cart_item.dart';

class CartManager{
final Map<String,CartItem> _items = {//danh sach<so san pham> item la a[4];
'p1':CartItem(
id: 'c1',
title: 'Red Shirt',
price: 29.99,
quantity: 2,
),
};




int get productCount{
return _items.length;//neu no la 2 thi la 2 cai hinh

}
List<CartItem> get products{
return _items.values.toList();//hien thi ra cac item
}
Iterable<MapEntry<String,CartItem>>get productEntries{//item yeu thich
return {..._items}.entries;
}
double get totalAmount{
var total =0.0;
_items.forEach((key, CartItem) {
total+=CartItem.price*CartItem.quantity;
});
return total;
}
}