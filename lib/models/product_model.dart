import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier {
  final String productID,
      productTitle,
      productDescreption,
      productPrice,
      productcategory,
      productQty,
      productImage,
      productDirection;

  final String? productOldPrice;

  final Timestamp? createdAt;

  ProductModel({
    required this.productID,
    required this.productTitle,
    required this.productDescreption,
    required this.productPrice,
    required this.productcategory,
    required this.productQty,
    required this.productImage,
    required this.productDirection,
    this.productOldPrice,
    this.createdAt,
  });

  factory ProductModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    // data.containsKey("")
    return ProductModel(
      productID: data["productId"], //doc.get(field),
      productTitle: data['productTitle'],
      productPrice: data['productPrice'],
      productcategory: data['productCategory'],
      productDescreption: data['productDescription'],
      productImage: data['productImage'],
      productQty: data['productQuantity'],
      productDirection: data['productDirection'],
      createdAt: data['createdAt'],
      productOldPrice: data['oldPrice'],
    );
  }
}
