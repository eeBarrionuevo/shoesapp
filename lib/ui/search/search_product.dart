import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoesappclient/models/product_model.dart';
import 'package:shoesappclient/ui/general/brand_color.dart';
import 'package:shoesappclient/ui/widgets/common_text.dart';
import 'package:shoesappclient/ui/widgets/common_widget.dart';
import 'package:shoesappclient/ui/widgets/item_search_widget.dart';
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
        fontSize: 14.0,
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
  ThemeData appBarTheme(BuildContext context) => Theme.of(context).copyWith(
        appBarTheme: AppBarTheme(
          toolbarHeight: 76,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: BrandColor.primaryFontColor.withOpacity(0.8),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.black.withOpacity(0.04),
          filled: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12.0,
          ),
          hintStyle: const TextStyle(
            fontSize: 14.0,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
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
        return ItemSearchWidget(
          model: suggestions[index],
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
        return ItemSearchWidget(
          model: suggestions[index],
        );
      },
    );
  }
}
