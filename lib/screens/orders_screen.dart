import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_admin_en/models/order_model.dart';
import 'package:shopsmart_admin_en/providers/order_provider.dart';
import 'package:shopsmart_admin_en/widgets/empty_bag.dart';

import '../widgets/orders_widget.dart';
import '../widgets/title_text.dart';

class OrdersScreenFree extends StatefulWidget {
  static const routeName = '/OrderScreen';

  const OrdersScreenFree({Key? key}) : super(key: key);

  @override
  State<OrdersScreenFree> createState() => _OrdersScreenFreeState();
}

class _OrdersScreenFreeState extends State<OrdersScreenFree> {
  // bool isEmptyOrders = false;
  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const TitlesTextWidget(
          label: "Orders",
          fontSize: 20,
        ),
      ),
      body: StreamBuilder<List<OrderModelAdvanced>>(
        stream: orderProvider.fetchOrdersStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return SelectableText(
              snapshot.error.toString(),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const EmptyBagWidget(
              imagePath: "images/dashboard/empty.png",
              title: "No Orders Yet !!",
              subtitle: "Check again",
            );
          }

          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                child: OrdersWidgetFree(snapshot.data![index]),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                endIndent: 10,
                indent: 10,
                thickness: 1,
              );
            },
          );
        },
      ),
    );
  }
}
