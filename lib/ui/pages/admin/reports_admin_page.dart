import 'package:flutter/material.dart';
import 'package:shoesappclient/ui/general/brand_color.dart';
import 'package:shoesappclient/ui/widgets/common_button_widget.dart';
import 'package:shoesappclient/ui/widgets/common_text.dart';
import 'package:shoesappclient/ui/widgets/common_widget.dart';

class ReportAdminPage extends StatelessWidget {
  const ReportAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColor.secondaryColor,
        title: H4(
          text: "Reportes",
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonButtonWidget(
              text: "Generar Excel",
              color: BrandColor.secondaryColor,
              onPressed: () {},
            ),
            spacing20,
            CommonButtonWidget(
              text: "Generar PDF",
              color: BrandColor.primaryFontColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
