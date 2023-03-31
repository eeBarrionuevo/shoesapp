import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoesappclient/models/product_model.dart';
import 'package:shoesappclient/ui/general/brand_color.dart';
import 'package:shoesappclient/ui/widgets/common_text.dart';
import 'package:shoesappclient/ui/widgets/common_widget.dart';
import 'package:shoesappclient/utils/asset_data.dart';
import 'package:shoesappclient/utils/calculate.dart';

class SearchProduct extends SearchDelegate {
  List<ProductModel> products;
  SearchProduct({required this.products});

  List<String> names = [
    "Elvis",
    "Daniel",
    "Ramón",
    "Julio",
    "Roberto",
    "Maria",
    "Diego",
    "Juan",
    "Melissa",
    "Wilson",
    "Elí",
    "Oliver"
  ];

  @override
  String get searchFieldLabel => "Buscar producto...";

  @override
  TextStyle get searchFieldStyle => TextStyle(
        fontSize: 16.0,
        color: BrandColor.primaryFontColor.withOpacity(0.80),
      );

  @override
  InputDecorationTheme get searchFieldDecorationTheme => InputDecorationTheme(
        hintStyle: TextStyle(
          fontSize: 14.0,
          color: BrandColor.primaryFontColor.withOpacity(0.6),
        ),
        filled: true,
        fillColor: Colors.black.withOpacity(0.04),
        // prefixIcon: const Icon(
        //   Icons.search,
        //   size: 18.0,
        //   color: BrandColor.secondaryFontColor,
        // ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
      );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(
          Icons.close,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, "");
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<ProductModel> suggestions = products
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: BrandColor.secondaryColor.withOpacity(0.4),
            ),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: CachedNetworkImage(
                  imageUrl: suggestions[index].image,
                  height: 90.0,
                  width: 105,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) {
                    return Image.asset(
                      AssetData.imagePlaceholder,
                    );
                  },
                  progressIndicatorBuilder: (context, url, progress) {
                    return loadingWidget;
                  },
                ),
              ),
              spacing12Width,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    H6(
                      text: suggestions[index].brand,
                      color: BrandColor.primaryFontColor.withOpacity(0.55),
                    ),
                    spacing2,
                    H5(
                      text: suggestions[index].name,
                      height: 1.1,
                      maxLines: 2,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    spacing4,
                    Row(
                      children: [
                        H5(
                          text:
                              "S/ ${Calculate.getPrice(suggestions[index].price, suggestions[index].discount).toStringAsFixed(2)}",
                          fontWeight: FontWeight.w700,
                        ),
                        spacing8Width,
                        suggestions[index].discount > 0
                            ? H6(
                                text:
                                    "S/ ${suggestions[index].price.toStringAsFixed(2)}",
                                color: BrandColor.primaryFontColor
                                    .withOpacity(0.55),
                                textDecoration: TextDecoration.lineThrough,
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ProductModel> suggestions = products
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: BrandColor.secondaryColor.withOpacity(0.4),
            ),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: CachedNetworkImage(
                  imageUrl: suggestions[index].image,
                  height: 90.0,
                  width: 105,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) {
                    return Image.asset(
                      AssetData.imagePlaceholder,
                    );
                  },
                  progressIndicatorBuilder: (context, url, progress) {
                    return loadingWidget;
                  },
                ),
              ),
              spacing12Width,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    H6(
                      text: suggestions[index].brand,
                      color: BrandColor.primaryFontColor.withOpacity(0.55),
                    ),
                    spacing2,
                    H5(
                      text: suggestions[index].name,
                      height: 1.1,
                      maxLines: 2,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    spacing4,
                    Row(
                      children: [
                        H5(
                          text:
                              "S/ ${Calculate.getPrice(suggestions[index].price, suggestions[index].discount).toStringAsFixed(2)}",
                          fontWeight: FontWeight.w700,
                        ),
                        spacing8Width,
                        suggestions[index].discount > 0
                            ? H6(
                                text:
                                    "S/ ${suggestions[index].price.toStringAsFixed(2)}",
                                color: BrandColor.primaryFontColor
                                    .withOpacity(0.55),
                                textDecoration: TextDecoration.lineThrough,
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
