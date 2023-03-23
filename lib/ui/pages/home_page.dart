import 'package:flutter/material.dart';
import 'package:shoesappclient/ui/general/brand_color.dart';
import 'package:shoesappclient/ui/widgets/common_text.dart';
import 'package:shoesappclient/ui/widgets/common_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            H1(
              text: "Hola de nuevo, espero que estes bien",
            ),
            H2(
              text: "Hola de nuevo, espero que estes bien",
            ),
            H3(
              text: "Hola de nuevo, espero que estes bien",
            ),
            H4(
              text: "Hola de nuevo, espero que estes bien",
            ),
            H5(
              text: "Hola de nuevo, espero que estes bien",
            ),
            H6(
              text: "Hola de nuevo, espero que estes bien",
            ),
            H5(
              text: "Bienvenidos de nuevo a las clases",
            ),
          ],
        ),
      ),
    );
  }
}
