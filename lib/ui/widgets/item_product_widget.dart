import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoesappclient/ui/general/brand_color.dart';
import 'package:shoesappclient/ui/widgets/common_text.dart';
import 'package:shoesappclient/ui/widgets/common_widget.dart';
import 'package:shoesappclient/utils/asset_data.dart';

class ItemProductWidget extends StatelessWidget {
  const ItemProductWidget({super.key});

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
                  Positioned(
                    top: 6,
                    left: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 2.0,
                      ),
                      decoration: BoxDecoration(
                        color: BrandColor.primaryColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: H6(
                        text: "-30%",
                        color: BrandColor.secondaryFontColor,
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
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
                  text: "Adidas",
                  color: BrandColor.primaryFontColor.withOpacity(0.55),
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
  }
}
