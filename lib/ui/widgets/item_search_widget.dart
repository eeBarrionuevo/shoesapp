import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoesappclient/models/product_model.dart';
import 'package:shoesappclient/ui/general/brand_color.dart';
import 'package:shoesappclient/ui/pages/product_detail_page.dart';
import 'package:shoesappclient/ui/widgets/common_text.dart';
import 'package:shoesappclient/ui/widgets/common_widget.dart';
import 'package:shoesappclient/utils/asset_data.dart';
import 'package:shoesappclient/utils/calculate.dart';

class ItemSearchWidget extends StatelessWidget {
  ProductModel model;
  ItemSearchWidget({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(model: model),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: BrandColor.primaryFontColor.withOpacity(0.09),
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: CachedNetworkImage(
                imageUrl: model.image,
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
                    text: model.brand,
                    color: BrandColor.primaryFontColor.withOpacity(0.55),
                  ),
                  spacing2,
                  H5(
                    text: model.name,
                    height: 1.1,
                    maxLines: 2,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  spacing4,
                  Row(
                    children: [
                      H5(
                        text:
                            "S/ ${Calculate.getPrice(model.price, model.discount).toStringAsFixed(2)}",
                        fontWeight: FontWeight.w700,
                      ),
                      spacing8Width,
                      model.discount > 0
                          ? H6(
                              text: "S/ ${model.price.toStringAsFixed(2)}",
                              color:
                                  BrandColor.primaryFontColor.withOpacity(0.55),
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
      ),
    );
  }
}
