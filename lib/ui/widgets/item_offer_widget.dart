import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoesappclient/models/product_model.dart';
import 'package:shoesappclient/ui/general/brand_color.dart';
import 'package:shoesappclient/ui/widgets/common_text.dart';
import 'package:shoesappclient/ui/widgets/common_widget.dart';
import 'package:shoesappclient/utils/asset_data.dart';
import 'package:shoesappclient/utils/responsive.dart';

class ItemOfferWidget extends StatelessWidget {
  ProductModel model;

  ItemOfferWidget({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 8,
      ),
      margin: const EdgeInsets.only(right: 12.0),
      width: ResponsiveUI.pDiagonal(context, 0.33),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
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
                H5(
                  text: "S/ ${model.price.toStringAsFixed(2)}",
                  fontWeight: FontWeight.w700,
                )
              ],
            ),
          ),
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
        ],
      ),
    );
  }
}
