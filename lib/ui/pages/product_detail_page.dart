import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesappclient/models/product_model.dart';
import 'package:shoesappclient/ui/general/brand_color.dart';
import 'package:shoesappclient/ui/widgets/common_text.dart';
import 'package:shoesappclient/ui/widgets/common_widget.dart';
import 'package:shoesappclient/ui/widgets/item_discount_widget.dart';
import 'package:shoesappclient/ui/widgets/item_size_widget.dart';
import 'package:shoesappclient/utils/asset_data.dart';
import 'package:shoesappclient/utils/calculate.dart';
import 'package:shoesappclient/utils/responsive.dart';

class ProductDetailPage extends StatelessWidget {
  ProductModel model;
  ProductDetailPage({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: model.image,
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
                      text: model.brand,
                      color: BrandColor.primaryFontColor.withOpacity(0.60),
                    ),
                    // spacing8,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: H2(
                            text: model.name,
                            fontWeight: FontWeight.w900,
                            height: 1,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            H6(
                              text: "S/ 1000.00",
                              color:
                                  BrandColor.primaryFontColor.withOpacity(0.60),
                              textDecoration: TextDecoration.lineThrough,
                            ),
                            spacing4,
                            H4(
                              text:
                                  "S/ ${Calculate.getPrice(model.price, model.discount).toStringAsFixed(2)}",
                              fontWeight: FontWeight.w900,
                              height: 1,
                            ),
                          ],
                        ),
                      ],
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
                      children: model.sizes
                          .map((e) => ItemSizeWidget(
                                size: e,
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              height: 100,
              // color: Colors.amber,
              child: Row(
                children: [
                  H2(
                    text:
                        "S/ ${Calculate.getPrice(model.price, model.discount).toStringAsFixed(2)}",
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
