import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoesappclient/ui/general/brand_color.dart';
import 'package:shoesappclient/ui/widgets/common_text.dart';
import 'package:shoesappclient/ui/widgets/common_widget.dart';
import 'package:shoesappclient/utils/asset_data.dart';
import 'package:shoesappclient/utils/responsive.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8,
                    ),
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
                                text: "Adidas",
                              ),
                              H5(
                                text: "Adidas Samba OG ASDAD  asdsadsa",
                              ),
                              H5(text: "S/ 259.00")
                            ],
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/9882f76dc5b14339a92bac5a0160ac4f_9366/Zapatillas_Samba_Veganas_Blanco_H01877_01_standard.jpg",
                            height: 90.0,
                            width: 105,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) {
                              return Image.asset(
                                AssetData.imagePlaceholder,
                              );
                            },
                            progressIndicatorBuilder: (context, url, progress) {
                              return CircularProgressIndicator();
                            },
                          ),
                        ),
                      ],
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
