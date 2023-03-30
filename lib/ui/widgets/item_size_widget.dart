import 'package:flutter/material.dart';
import 'package:shoesappclient/ui/general/brand_color.dart';
import 'package:shoesappclient/ui/widgets/common_text.dart';

class ItemSizeWidget extends StatelessWidget {
  const ItemSizeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: 64,
      decoration: BoxDecoration(
        // color: Colors.amber,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          width: 0.95,
          color: BrandColor.primaryFontColor.withOpacity(0.30),
        ),
      ),
      alignment: Alignment.center,
      child: H5(
        text: "10.5",
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
