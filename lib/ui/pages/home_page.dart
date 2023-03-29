import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoesappclient/models/product_model.dart';
import 'package:shoesappclient/services/remote/firestore_service.dart';
import 'package:shoesappclient/ui/general/brand_color.dart';
import 'package:shoesappclient/ui/widgets/common_text.dart';
import 'package:shoesappclient/ui/widgets/common_widget.dart';
import 'package:shoesappclient/ui/widgets/item_offer_widget.dart';
import 'package:shoesappclient/ui/widgets/item_product_widget.dart';
import 'package:shoesappclient/utils/asset_data.dart';
import 'package:shoesappclient/utils/responsive.dart';

class HomePage extends StatelessWidget {
  FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: firestoreService.getProducts(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData) {
            List<ProductModel> products = snap.data;
            List<ProductModel> productsDiscount = [];

            // for (var item in products) {
            //   if (item.discount > 0) {
            //     productsDiscount.add(item);
            //   }
            // }

            // products.forEach((item) {
            //   if (item.discount > 0) {
            //     productsDiscount.add(item);
            //   }
            // });

            productsDiscount = products.where((e) => e.discount > 0).toList();

            print(productsDiscount.length);

            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    color: BrandColor.primaryColor,
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          spacing40,
                          H1(
                            text: "Hey José Daniel Diaz, bienvenido nuevamente",
                            height: 1.15,
                          ),
                          spacing8,
                          H5(
                            text: "Tenemos las mejores ofertas siempre",
                          ),
                          spacing16,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            child: Row(
                              children: productsDiscount
                                  .map(
                                    (e) => ItemOfferWidget(
                                      model: e,
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          spacing4,
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        H5(
                          text: "Últimos ingresos",
                          fontWeight: FontWeight.w700,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 4.0,
                          ),
                          decoration: BoxDecoration(
                            color: BrandColor.primaryColor.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Row(
                            children: [
                              H6(
                                text: "Ver todo",
                                color: BrandColor.secondaryFontColor,
                              ),
                              const Icon(
                                Icons.arrow_right_alt,
                                size: 16.0,
                                color: BrandColor.secondaryFontColor,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 6.0,
                      crossAxisSpacing: 6.0,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return ItemProductWidget(
                        model: products[index],
                      );
                    },
                  ),
                ],
              ),
            );
          }
          return Center(
            child: loadingWidget,
          );
        },
      ),
    );
  }
}
