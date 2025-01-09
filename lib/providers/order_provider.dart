import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/order_model.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModelAdvanced> orders = [];

  List<OrderModelAdvanced> get getOrders => orders;

  Stream<List<OrderModelAdvanced>> fetchOrdersStream() {
    return FirebaseFirestore.instance
        .collection("ordersAdvance")
        .orderBy("orderDate",descending: true)
        .snapshots()
        .map((snapshot) {
      List<OrderModelAdvanced> orders = [];
      for (var doc in snapshot.docs) {
        orders.add(OrderModelAdvanced.fromFirestore(doc));
      }
      return orders;
    });
  }

  Future<void> removeOrderItemFromFirestor({
    required String orderid,
  }) async {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('ordersAdvance')
        .doc(orderid);

    try {
      await documentReference.delete();
         Fluttertoast.showToast(
          msg: "Item has been Removed",
          backgroundColor: const Color.fromARGB(255, 200, 235, 218),
          textColor: Colors.white);
      print('Document removed successfully');
    } catch (e) {
      print('Error removing document: $e');
      rethrow;
    }
   
  }
}
