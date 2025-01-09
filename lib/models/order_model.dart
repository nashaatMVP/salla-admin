import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderModelAdvanced with ChangeNotifier {
  final String orderId;
  final String userId;
  final String productId;
  final String prductTitle;
  final String userName;
  final String price;
  final String ImageUrl;
  final String quntity;
  final String orderStatus;
  final String orderaddress;
  final Timestamp orderDate;

  OrderModelAdvanced({
    required this.orderId,
    required this.userId,
    required this.productId,
    required this.prductTitle,
    required this.userName,
    required this.price,
    required this.ImageUrl,
    required this.quntity,
    required this.orderStatus,
    required this.orderDate,
    required this.orderaddress,
  });
  factory OrderModelAdvanced.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    // data.containsKey("")
    return OrderModelAdvanced(
      orderId: data["orderId"], //doc.get(field),
      userId: data['userId'],
      productId: data['productId'],
      prductTitle: data['productTitle'],
      userName: data['userName'],
      price: data['price'].toString(),
      ImageUrl: data['ImageUrl'],
      quntity: data['quntity'].toString(),
      orderDate: data['orderDate'],
      orderStatus: data['orderStatus'],
      orderaddress: data['orderAddress'],
    );
  }
}
