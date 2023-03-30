import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesappclient/ui/general/brand_color.dart';
import 'package:shoesappclient/ui/widgets/common_text.dart';
import 'package:shoesappclient/ui/widgets/common_widget.dart';
import 'package:shoesappclient/ui/widgets/item_discount_widget.dart';
import 'package:shoesappclient/ui/widgets/item_size_widget.dart';
import 'package:shoesappclient/utils/asset_data.dart';
import 'package:shoesappclient/utils/responsive.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl:
                    "https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/7a06ef7e04df4ffeb487aeec00f47786_9366/Zapatillas_Campus_00s_Verde_HR1467_04_standard.jpg",
                height: ResponsiveUI.pDiagonal(context, 0.37),
                width: double.infinity,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) {
                  return Image.asset(AssetData.imagePlaceholder);
                },
                progressIndicatorBuilder: (context, url, progress) {
                  return loadingWidget;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ItemDiscountWidget(discount: 40),
                    spacing8,
                    H4(
                      text: "Adidas",
                      color: BrandColor.primaryFontColor.withOpacity(0.60),
                    ),
                    spacing8,
                    H2(
                      text: "Adidas Campus 00",
                      fontWeight: FontWeight.w900,
                      height: 1,
                    ),
                    spacing16,
                    H5(
                      text: "Tallas disponibles:",
                      color: BrandColor.primaryFontColor.withOpacity(0.60),
                    ),
                    spacing12,
                    Wrap(
                      spacing: 8,
                      runSpacing: 10,
                      children: [
                        ItemSizeWidget(),
                        ItemSizeWidget(),
                        ItemSizeWidget(),
                        ItemSizeWidget(),
                        ItemSizeWidget(),
                        ItemSizeWidget(),
                        ItemSizeWidget(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              height: 100,
              // color: Colors.amber,
              child: Row(
                children: [
                  H2(
                    text: "S/ 545.99",
                  ),
                  spacing14Width,
                  Expanded(
                    child: SizedBox(
                      height: 50.0,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: BrandColor.secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        icon: SvgPicture.asset(
                          AssetData.iconWhatsApp,
                          color: Colors.white,
                        ),
                        label: H4(
                          text: "Obtener ahora",
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
