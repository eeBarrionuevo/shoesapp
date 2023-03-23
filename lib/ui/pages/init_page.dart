import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesappclient/ui/general/brand_color.dart';
import 'package:shoesappclient/utils/asset_data.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        selectedItemColor: BrandColor.primaryFontColor,
        unselectedItemColor: BrandColor.primaryFontColor.withOpacity(0.45),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetData.iconStore,
              height: 22.0,
            ),
            label: "Inicio",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetData.iconRocket,
              height: 22.0,
            ),
            label: "Explorar",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetData.iconBrand,
              height: 22.0,
            ),
            label: "Marcas",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetData.iconFavorite,
              height: 22.0,
            ),
            label: "Favoritos",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetData.iconProfile,
              height: 22.0,
            ),
            label: "Perfil",
          ),
        ],
      ),
    );
  }
}
