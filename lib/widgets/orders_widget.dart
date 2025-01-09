import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_admin_en/models/order_model.dart';

import '../providers/order_provider.dart';
import 'subtitle_text.dart';
import 'title_text.dart';

class OrdersWidgetFree extends StatefulWidget {
  final OrderModelAdvanced? orderModelAdvanced;
  const OrdersWidgetFree(this.orderModelAdvanced);

  @override
  State<OrdersWidgetFree> createState() => _OrdersWidgetFreeState();
}

class _OrdersWidgetFreeState extends State<OrdersWidgetFree> {
  bool isLoading = false;
  bool seemore = false;

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        FittedBox(
          child: IntrinsicWidth(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: const Color.fromARGB(255, 129, 98, 5),
                        width: 1)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: FancyShimmerImage(
                        imageUrl: widget.orderModelAdvanced!.ImageUrl,
                        height: 200,
                        width: 200,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    IntrinsicWidth(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.8,
                                child: TitlesTextWidget(
                                  label: widget.orderModelAdvanced!.prductTitle,
                                  maxLines: 3,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  orderProvider.removeOrderItemFromFirestor(
                                      orderid:
                                          widget.orderModelAdvanced!.orderId);
                                },
                                icon: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: const Icon(
                                    Icons.clear,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SubtitleTextWidget(
                                label:
                                    "Price : ${widget.orderModelAdvanced!.price} AED",
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                              ),
                              SubtitleTextWidget(
                                label:
                                    "Qty :  x${widget.orderModelAdvanced!.quntity}",
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  seemore = !seemore;
                });
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: const SubtitleTextWidget(
                  color: Colors.blue,
                  label: "see more..",
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
        seemore
            ? Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 9, 73, 126),
                    borderRadius: BorderRadius.circular(15)),
                width: size.width * 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    SubtitleTextWidget(
                      label: "Name :  ${widget.orderModelAdvanced!.userName}",
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    SubtitleTextWidget(
                      label:
                          "Address :  ${widget.orderModelAdvanced!.orderaddress}",
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Divider(
                      height: 1,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SubtitleTextWidget(
                          label: "Payment Status :",
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5),
                        SubtitleTextWidget(
                          label: "  cash on delivery",
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SubtitleTextWidget(
                          label: "Delivery Status :",
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 5),
                        SubtitleTextWidget(
                          color: const Color.fromARGB(255, 158, 126, 212),
                          label: widget.orderModelAdvanced!.orderStatus == "1"
                              ? "  Shipping"
                              : widget.orderModelAdvanced!.orderStatus == "2" ||
                                      widget.orderModelAdvanced!.orderStatus ==
                                          "3"
                                  ? "  Delivery "
                                  : "  preparing",
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SubtitleTextWidget(
                          label: "Change delivery Status To :  ",
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.white,
                        ),
                        widget.orderModelAdvanced!.orderStatus == "0"
                            ? GestureDetector(
                                onTap: () async {
                                  DateTime? selectedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate:
                                        DateTime(DateTime.now().year - 5),
                                    lastDate: DateTime(DateTime.now().year + 5),
                                  );

                                  if (selectedDate != null) {
                                    // If a date is selected, convert it to a formatted string or perform necessary actions
                                    String formattedDate = selectedDate
                                            .toLocal()
                                            .toString()
                                            .split(' ')[
                                        0]; // Format the date as needed

                                    // Now, update the Firestore order status and delivery date
                                    await FirebaseFirestore.instance
                                        .collection("ordersAdvance")
                                        .doc(widget.orderModelAdvanced!.orderId)
                                        .update({
                                      'orderStatus': "1",
                                      'deliveryDate': formattedDate,
                                    });
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const SubtitleTextWidget(
                                    label: "Shipping ?",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : widget.orderModelAdvanced!.orderStatus == "1" ||
                                    widget.orderModelAdvanced!.orderStatus ==
                                        "2" ||
                                    widget.orderModelAdvanced!.orderStatus ==
                                        "3"
                                ? GestureDetector(
                                    onTap: () async {
                                      await FirebaseFirestore.instance
                                          .collection("ordersAdvance")
                                          .doc(widget
                                              .orderModelAdvanced!.orderId)
                                          .update({'orderStatus': "2"});
                                    },
                                    child: Row(
                                      children: [
                                        SubtitleTextWidget(
                                          color: widget.orderModelAdvanced!
                                                          .orderStatus ==
                                                      "2" ||
                                                  widget.orderModelAdvanced!
                                                          .orderStatus ==
                                                      "3"
                                              ? Colors.green
                                              : Colors.red,
                                          label: "  Delivered",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Icon(
                                          widget.orderModelAdvanced!
                                                          .orderStatus ==
                                                      "2" ||
                                                  widget.orderModelAdvanced!
                                                          .orderStatus ==
                                                      "3"
                                              ? Icons.check
                                              : Icons.question_mark,
                                          color: Colors.green,
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox()
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
