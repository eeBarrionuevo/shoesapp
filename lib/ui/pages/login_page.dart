import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesappclient/ui/general/brand_color.dart';
import 'package:shoesappclient/ui/widgets/common_text.dart';
import 'package:shoesappclient/ui/widgets/common_widget.dart';
import 'package:shoesappclient/utils/asset_data.dart';
import 'package:shoesappclient/utils/responsive.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Background
          Stack(
            children: [
              Positioned(
                top: -ResponsiveUI.pDiagonal(context, 0.2),
                left: -ResponsiveUI.pDiagonal(context, 0.05),
                child: Transform.rotate(
                  angle: pi / 3.5,
                  child: Container(
                    height: ResponsiveUI.pDiagonal(context, 0.48),
                    width: ResponsiveUI.pDiagonal(context, 0.48),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(90.0),
                      gradient: const LinearGradient(
                        colors: [
                          BrandColor.secondaryColor,
                          BrandColor.primaryColor,
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: BrandColor.primaryColor.withOpacity(0.6),
                          blurRadius: 12.0,
                          offset: const Offset(6, 6),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          //Formulario
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: ResponsiveUI.pDiagonal(context, 0.1),
                    ),
                    H1(
                      text: "ShoesApp",
                    ),
                    spacing4,
                    H4(
                      text: "Iniciar Sesión",
                    ),
                    spacing4,
                    H5(
                      text: "Por favor ingresa tus credenciales",
                      color: BrandColor.primaryFontColor.withOpacity(0.80),
                    ),
                    spacing20,
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 12,
                            offset: const Offset(4, 4),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Tu correo electrónico",
                          hintStyle: TextStyle(
                            fontSize: 14.0,
                            color:
                                BrandColor.primaryFontColor.withOpacity(0.60),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          prefixIcon: SvgPicture.asset(
                            AssetData.iconMail,
                            fit: BoxFit.scaleDown,
                            color:
                                BrandColor.primaryFontColor.withOpacity(0.50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none,
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
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
