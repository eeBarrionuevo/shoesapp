import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoesappclient/models/product_model.dart';
import 'package:shoesappclient/ui/general/brand_color.dart';
import 'package:shoesappclient/ui/widgets/common_text.dart';
import 'package:shoesappclient/ui/widgets/common_widget.dart';
import 'package:shoesappclient/ui/widgets/item_discount_widget.dart';
import 'package:shoesappclient/utils/asset_data.dart';

class ItemProductWidget extends StatelessWidget {
  ProductModel model;

  ItemProductWidget({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: model.image,
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
                  Positioned(
                    top: 6,
                    left: 6,
                    child: model.discount > 0
                        ? ItemDiscountWidget(
                            discount: model.discount,
                          )
                        : const SizedBox(),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                H6(
                  text: model.brand,
                  color: BrandColor.primaryFontColor.withOpacity(0.55),
                ),
                H5(
                  text: model.name,
                ),
                H5(
                  text: "S/ ${model.price.toStringAsFixed(2)}",
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
