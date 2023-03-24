import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoesappclient/ui/general/brand_color.dart';
import 'package:shoesappclient/ui/widgets/common_text.dart';
import 'package:shoesappclient/ui/widgets/common_widget.dart';
import 'package:shoesappclient/ui/widgets/item_offer_widget.dart';
import 'package:shoesappclient/utils/asset_data.dart';
import 'package:shoesappclient/utils/responsive.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                      text: "Hey José Daniel Diaz, bievenido nuevamente",
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
                        children: [
                          ItemOfferWidget(),
                          ItemOfferWidget(),
                          ItemOfferWidget(),
                        ],
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
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 6.0,
                crossAxisSpacing: 6.0,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/e37f5cef58e244a09192ae2e015707ba_9366/Zapatillas_ADI2000_Amarillo_GZ6189_011_hover_standard.jpg",
                            fit: BoxFit.cover,
                            width: double.infinity,
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
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            H6(
                              text: "Adidas",
                              color:
                                  BrandColor.primaryFontColor.withOpacity(0.55),
                            ),
                            H5(
                              text: "Adidas Adi2000",
                            ),
                            H5(
                              text: "S/ 299.00",
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
