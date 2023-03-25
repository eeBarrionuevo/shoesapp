import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoesappclient/ui/widgets/common_widget.dart';
import 'package:shoesappclient/utils/asset_data.dart';

class BrandPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        children: [
          Container(
            color: Colors.red,
            child: CachedNetworkImage(
              imageUrl:
                  "https://cooljsonline.com/wp-content/uploads/2020/05/shop-adidas-banner.jpg",
              fit: BoxFit.cover,
              errorWidget: (context, url, error) {
                return Image.asset(AssetData.imagePlaceholder);
              },
              progressIndicatorBuilder: (context, url, progress) {
                return loadingWidget;
              },
            ),
          ),
          Container(
            color: Colors.teal,
          ),
          Container(
            color: Colors.yellow,
          )
        ],
      ),
    );
  }
}
