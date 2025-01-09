import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_admin_en/consts/app_colors.dart';

import '../models/product_model.dart';
import '../providers/products_provider.dart';
import '../widgets/product_widget.dart';
import '../widgets/title_text.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/SearchScreen';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<ProductModel> productListSearch = [];
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    String? passedCategory =
        ModalRoute.of(context)!.settings.arguments as String?;
    List<ProductModel> productList = passedCategory == null
        ? productsProvider.products
        : productsProvider.findByCategory(categoryName: passedCategory);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: TitlesTextWidget(label: passedCategory ?? "Search products"),
          centerTitle: true,
        ),
        body: StreamBuilder<List<ProductModel>>(
            stream: productsProvider.fetchproductStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: Center(
                      child: CircularProgressIndicator(
                    color: AppColors.goldenPrimary,
                  )),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: SelectableText(
                    snapshot.error.toString(),
                  ),
                );
              } else if (snapshot.data == null) {
                return const Center(
                  child: SelectableText(
                    "No Products Found has Added",
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      controller: searchController,
                      style: const TextStyle(
                        decorationThickness: 0,
                      ),
                      decoration: InputDecoration(
                        hintText: "Search",
                        contentPadding: const EdgeInsets.all(10),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        suffixIcon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        hintStyle: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      // onChanged: (v) {
                      //   setState(() {
                      //     productListSearch = productsProvider.searchQuery(
                      //         searchText: searchController.text);
                      //   });
                      // },
                      onSubmitted: (value) {
                        setState(() {
                          productListSearch = productsProvider.searchQuery(
                              searchText: searchController.text);
                        });
                      },
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    ////////

                    if (searchController.text.isNotEmpty &&
                        productListSearch.isEmpty) ...[
                      const Center(
                        child: TitlesTextWidget(
                          label: "Not Products Found.....",
                        ),
                      ),
                    ],
                    Expanded(
                      child: DynamicHeightGridView(
                        physics: const BouncingScrollPhysics(),
                        itemCount: searchController.text.isNotEmpty
                            ? productListSearch.length
                            : productList.length,
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        builder: (context, index) {
                          return ProductWidget(
                            productId: searchController.text.isNotEmpty
                                ? productListSearch[index].productID
                                : productList[index].productID,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
