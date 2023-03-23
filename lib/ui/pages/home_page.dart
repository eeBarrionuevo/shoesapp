import 'package:flutter/material.dart';
import 'package:shoesappclient/ui/widgets/common_text.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            H1(
              text: "Hola de nuevo",
            ),
            H2(
              text: "Hola Juan",
            ),
            H3(
              text: "Hola Daniel",
            ),
            H1(
              text: "Bienvenido Juan",
            ),
          ],
        ),
      ),
    );
  }
}
