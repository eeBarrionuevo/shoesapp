import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoesappclient/models/brand_model.dart';
import 'package:shoesappclient/services/remote/firestore_service.dart';
import 'package:shoesappclient/ui/widgets/common_text.dart';
import 'package:shoesappclient/ui/widgets/common_widget.dart';
import 'package:shoesappclient/ui/widgets/item_brand_widget.dart';
import 'package:shoesappclient/utils/asset_data.dart';

class BrandPage extends StatelessWidget {
  FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: firestoreService.getBrands(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData) {
            List<BrandModel> brands = snap.data;
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  floating: true,
                  title: H5(
                    text: "Nuestras marcas",
                    fontWeight: FontWeight.w700,
                  ),
                  toolbarHeight: 50,
                  centerTitle: true,
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(14.0),
                  sliver: SliverGrid.count(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    children: brands
                        .map(
                          (e) => ItemBrandWidget(),
                        )
                        .toList(),
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
