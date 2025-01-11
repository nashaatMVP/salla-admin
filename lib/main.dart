import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_admin_en/screens/dashboard_screen.dart';
import 'package:shopsmart_admin_en/screens/upload_edit_product_form_screen.dart';

import 'consts/theme_data.dart';
import 'providers/order_provider.dart';
import 'providers/products_provider.dart';
import 'providers/theme_provider.dart';
import 'screens/orders_screen.dart';
import 'screens/search_screen.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
        future: Firebase.initializeApp(
            // options: DefaultFirebaseOptions.currentPlatform,
            ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: SelectableText(snapshot.error.toString()),
                ),
              ),
            );
          }
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) {
                return ThemeProvider();
              }),
              ChangeNotifierProvider(create: (_) {
                return ProductsProvider();
              }),
              ChangeNotifierProvider(create: (_) {
                return OrderProvider();
              }),
            ],
            child: Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Shop Smart ADMIN EN',
                theme: Styles.themeData(
                    isDarkTheme: themeProvider.getIsDarkTheme,
                    context: context),
                home: const DashboardScreen(),
                routes: {
                  OrdersScreenFree.routeName: (context) =>
                      const OrdersScreenFree(),
                  SearchScreen.routeName: (context) => const SearchScreen(),
                  EditOrUploadProductScreen.routeName: (context) =>
                      const EditOrUploadProductScreen(),
                },
              );
            }),
          );
        });
  }
}
