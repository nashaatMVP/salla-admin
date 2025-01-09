import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_admin_en/screens/upload_edit_product_form_screen.dart';

import '../providers/products_provider.dart';
import 'subtitle_text.dart';
import 'title_text.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({
    super.key,
    required this.productId,
  });
  final String productId;
  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    // final productModelProvider = Provider.of<ProductModel>(context);
    final productsProvider = Provider.of<ProductsProvider>(context);
    final getCurrProduct = productsProvider.findById(widget.productId);
    Size size = MediaQuery.of(context).size;

    return getCurrProduct == null
        ? const SizedBox.shrink()
        : GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return EditOrUploadProductScreen(
                      productModel: getCurrProduct,
                    );
                  },
                ),
              );
            },
            child: Container(
              width: 200,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color.fromARGB(255, 156, 118, 5),
                    width: 1,
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /////////////////////////////////IMAGE///////////////////////////////////////////////////////
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: FancyShimmerImage(
                      imageUrl: getCurrProduct.productImage,
                      height: size.height * 0.22,
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  ////////////////////////////////////TITLE///////////////////////////////////////////////////
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: TitlesTextWidget(
                      label: getCurrProduct.productTitle,
                      fontSize: 13,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  TitlesTextWidget(
                    label: "Now in Stock :  ${getCurrProduct.productQty}",
                    fontSize: 13,
                    color: const Color.fromARGB(255, 157, 119, 7),
                    maxLines: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const SubtitleTextWidget(
                            label: "AED",
                            fontWeight: FontWeight.normal,
                            fontSize: 10,
                            color: Color.fromARGB(255, 156, 118, 5),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          SubtitleTextWidget(
                            label: getCurrProduct.productPrice,
                            fontWeight: FontWeight.normal,
                            color: const Color.fromARGB(255, 156, 118, 5),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          productsProvider.deleteProductFromFirstore(
                              productId: getCurrProduct.productID);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Color.fromARGB(255, 157, 119, 7),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                ],
              ),
            ),
          );
  }
}
