import 'package:flutter/material.dart';

class AppConstants {
  static const String imageUrl =
      'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png';

  static List<String> categoriesList = [
    'Phones',
    'Laptops',
    'Electronics',
    'Watches',
    'Tools',
    'Kitchen',
    'Furniture',
    'Sports',
    "Gaming",
    "Cameras",
    "HeadPhones",
    "Drones",
    "Air Pods",
    "Accessories",
  ];
  static List<String> Listdirection = [
    'New Arrival',
    'Latest Arrival Two',
    'Recommanded for you',
  ];
  static List<DropdownMenuItem<String>>? get ListdirectionDropDownList {
    List<DropdownMenuItem<String>>? direction =
        List<DropdownMenuItem<String>>.generate(
      Listdirection.length,
      (index) => DropdownMenuItem(
        value: Listdirection[index],
        child: Text(Listdirection[index]),
      ),
    );
    return direction;
  }

  static List<DropdownMenuItem<String>>? get categoriesDropDownList {
    List<DropdownMenuItem<String>>? menuItem =
        List<DropdownMenuItem<String>>.generate(
      categoriesList.length,
      (index) => DropdownMenuItem(
        value: categoriesList[index],
        child: Text(categoriesList[index]),
      ),
    );
    return menuItem;
  }
}
