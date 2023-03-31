import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shoesappclient/models/product_model.dart';
import 'package:shoesappclient/services/remote/firestore_service.dart';
import 'package:shoesappclient/ui/general/brand_color.dart';
import 'package:shoesappclient/ui/search/search_product.dart';
import 'package:shoesappclient/ui/widgets/common_text.dart';
import 'package:shoesappclient/ui/widgets/common_widget.dart';
import 'package:shoesappclient/ui/widgets/item_offer_widget.dart';
import 'package:shoesappclient/ui/widgets/item_product_widget.dart';

class ExplorePage extends StatelessWidget {
  FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // body: CustomScrollView(
      //   slivers: [
      //     SliverAppBar(
      //       title: Text("Hola"),
      //       backgroundColor: Colors.black,
      //       expandedHeight: 180,
      //       floating: true,
      //       pinned: false,
      //       flexibleSpace: FlexibleSpaceBar(
      //         background: Image.network(
      //           "https://images.pexels.com/photos/14360308/pexels-photo-14360308.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      //           fit: BoxFit.cover,
      //         ),
      //       ),
      //       // bottom: PreferredSize(
      //       //   preferredSize: Size(200, 70),
      //       //   child: Expanded(
      //       //     child: Container(
      //       //       width: double.infinity,
      //       //       color: Colors.amber,
      //       //       child: Text("Hola"),
      //       //     ),
      //       //   ),
      //       // ),
      //     ),
      //     SliverList(
      //       delegate: SliverChildListDelegate(
      //         [
      //           Container(
      //             height: 150,
      //             color: Colors.indigo,
      //           ),
      //           Container(
      //             height: 150,
      //             color: Colors.red,
      //           ),
      //           Container(
      //             height: 150,
      //             color: Colors.green,
      //           ),
      //           Container(
      //             height: 150,
      //             color: Colors.indigo,
      //           ),
      //           Container(
      //             height: 150,
      //             color: Colors.red,
      //           ),
      //           Container(
      //             height: 150,
      //             color: Colors.green,
      //           ),
      //         ],
      //       ),
      //     ),
      //     SliverGrid.count(
      //       crossAxisCount: 2,
      //       children: [
      //         Container(
      //           color: Colors.amber,
      //         ),
      //         Container(
      //           color: Colors.teal,
      //         ),
      //         Container(
      //           color: Colors.pink,
      //         ),
      //       ],
      //     ),
      //     SliverPadding(
      //       padding: const EdgeInsets.all(20.0),
      //       sliver: SliverGrid(
      //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //           crossAxisCount: 2,
      //           mainAxisSpacing: 10,
      //           crossAxisSpacing: 10,
      //         ),
      //         delegate: SliverChildBuilderDelegate(
      //           (BuildContext context, int index) {
      //             return Container(
      //               color: Colors.teal,
      //             );
      //           },
      //           childCount: 10,
      //         ),
      //         // delegate: SliverChildListDelegate(
      //         //   [
      //         //     Container(
      //         //       color: Colors.amber,
      //         //     ),
      //         //     Container(
      //         //       color: Colors.teal,
      //         //     ),
      //         //     Container(
      //         //       color: Colors.pink,
      //         //     ),
      //         //   ],
      //         // ),
      //       ),
      //     ),
      //   ],
      // ),
      body: FutureBuilder(
        future: firestoreService.getProducts(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData) {
            List<ProductModel> products = snap.data;
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: BrandColor.primaryColor,
                  floating: true,
                  pinned: false,
                  centerTitle: true,
                  //expandedHeight: 300.0,
                  title: TextField(
                    onTap: () async {
                      await showSearch(
                          context: context, delegate: SearchProduct());
                    },
                    cursorColor: BrandColor.secondaryFontColor,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: BrandColor.secondaryFontColor,
                    ),
                    // enabled: false,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: "Buscar producto...",
                      hintStyle: const TextStyle(
                        fontSize: 14.0,
                        color: BrandColor.secondaryFontColor,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.35),
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 18.0,
                        color: BrandColor.secondaryFontColor,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 0,
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
                    ),
                  ),
                  titleSpacing: 16.0,
                  //collapsedHeight: 100,
                  toolbarHeight: 80,
                  shadowColor: BrandColor.primaryColor,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 14.0,
                        ),
                        child: H5(
                          text: "Nuestros productos",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 6.0,
                    crossAxisSpacing: 6.0,
                    childAspectRatio: 0.9,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return ItemProductWidget(
                        model: products[index],
                      );
                      //return Text("Hola");
                    },
                    childCount: products.length,
                  ),
                ),
              ],
            );
          }
          return loadingWidget;
        },
      ),
    );
  }
}
