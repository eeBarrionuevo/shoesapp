import 'package:flutter/material.dart';
import 'package:shoesappclient/ui/general/brand_color.dart';
import 'package:shoesappclient/ui/widgets/item_product_widget.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              color: BrandColor.primaryColor,
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      cursorColor: BrandColor.secondaryFontColor,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: BrandColor.secondaryFontColor,
                      ),
                      // enabled: false,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: "Buscar producto...",
                        hintStyle: const TextStyle(
                          fontSize: 14.0,
                          color: BrandColor.secondaryFontColor,
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.35),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 18.0,
                          color: BrandColor.secondaryFontColor,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 12.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: 30,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 6.0,
                crossAxisSpacing: 6.0,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ItemProductWidget();
              },
            ),
          ],
        ),
      ),
    );
  }
}
