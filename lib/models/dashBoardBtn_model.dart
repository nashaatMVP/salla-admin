import 'package:flutter/material.dart';
import 'package:shopsmart_admin_en/screens/orders_screen.dart';
import 'package:shopsmart_admin_en/screens/search_screen.dart';
import 'package:shopsmart_admin_en/screens/upload_edit_product_form_screen.dart';

class DashboardButtonModel {
  final String imagePath, text;
  final Function onTap;

  DashboardButtonModel({
    required this.imagePath,
    required this.text,
    required this.onTap,
  });

  static List<DashboardButtonModel> dashboardButtonList(context) => [
        DashboardButtonModel(
          imagePath: "images/dashboard/cloud.png",
          text: "Upload",
          onTap: () {
            Navigator.pushNamed(context, EditOrUploadProductScreen.routeName);
          },
        ),
        DashboardButtonModel(
          imagePath: "images/dashboard/products.png",
          text: "Products",
          onTap: () {
            Navigator.pushNamed(context, SearchScreen.routeName);
          },
        ),
        DashboardButtonModel(
          imagePath: "images/dashboard/money.png",
          text: "Orders",
          onTap: () {
            Navigator.pushNamed(context, OrdersScreenFree.routeName);
          },
        ),
      ];
}
