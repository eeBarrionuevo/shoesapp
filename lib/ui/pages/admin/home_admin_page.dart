import 'package:flutter/material.dart';
import 'package:shoesappclient/ui/widgets/admin/item_menu_widget.dart';
import 'package:shoesappclient/ui/widgets/common_text.dart';
import 'package:shoesappclient/ui/widgets/common_widget.dart';
import 'package:shoesappclient/utils/asset_data.dart';

class HomeAdminPage extends StatelessWidget {
  const HomeAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backgroundWidget(context),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    spacing30,
                    H1(
                      text: "Bienvenido al adminstrador de ShoesApp",
                      height: 1.1,
                    ),
                    spacing12,
                    H5(
                      text: "Puedes gestionar todo desde aquí",
                    ),
                    GridView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      children: [
                        ItemMenuWidget(
                          text: "Productos",
                          icon: AssetData.imageShoes,
                          onTap: () {},
                        ),
                        ItemMenuWidget(
                          text: "Categorías",
                          icon: AssetData.imageTag,
                          onTap: () {},
                        ),
                        ItemMenuWidget(
                          text: "Clientes",
                          icon: AssetData.imageShoes,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
