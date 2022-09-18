import 'package:flutter/material.dart';
import '../../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen(
    this.product,
    {super.key}) ;
final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),//tieu de cua tung san pham
      ),
      body:SingleChildScrollView(//khi màn hình tràn thì sẽ có chức năng kéo
        child: Column(//xắp xếp từ trên xuống
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '\$${product.price}',//hiển thi chư
              style: const TextStyle(//thuôc tính của text
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                product.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),

          ]//nó bao tất cả và nằm từ trên xuống
          ),

      )


    );
    
  }
}