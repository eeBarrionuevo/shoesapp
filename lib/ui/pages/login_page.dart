import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesappclient/ui/general/brand_color.dart';
import 'package:shoesappclient/ui/pages/register_page.dart';
import 'package:shoesappclient/ui/widgets/common_button_widget.dart';
import 'package:shoesappclient/ui/widgets/common_input_widget.dart';
import 'package:shoesappclient/ui/widgets/common_password_widget.dart';
import 'package:shoesappclient/ui/widgets/common_text.dart';
import 'package:shoesappclient/ui/widgets/common_widget.dart';
import 'package:shoesappclient/utils/asset_data.dart';
import 'package:shoesappclient/utils/responsive.dart';
import 'package:shoesappclient/utils/types.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: "mandarina@gmail.com",
      password: "3volution",
    );
    if (userCredential.user != null) {
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Background
          backgroundWidget(context),
          //Formulario
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: ResponsiveUI.pDiagonal(context, 0.07),
                    ),
                    Image.asset(
                      AssetData.imageLogo,
                      height: 52,
                    ),
                    H1(
                      text: "ShoesApp",
                    ),
                    spacing8,
                    H4(
                      text: "Iniciar Sesión",
                    ),
                    // spacing4,
                    // H5(
                    //   text: "Por favor ingresa tus credenciales",
                    //   color: BrandColor.primaryFontColor.withOpacity(0.80),
                    // ),
                    spacing20,
                    CommonInputWidget(
                      label: "Correo electrónico",
                      hintText: "Tu correo electrónico",
                      icon: AssetData.iconMail,
                      controller: emailController,
                      inputType: InputTypeEnum.email,
                    ),
                    spacing20,
                    CommonPasswordWidget(
                      controller: passwordController,
                    ),
                    spacing30,
                    CommonButtonWidget(
                      color: BrandColor.secondaryColor,
                      text: "Iniciar Sesión",
                      onPressed: () {
                        login();
                      },
                    ),
                    spacing16,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        H5(
                          text: "Aún no tienes una cuenta?  ",
                          color: BrandColor.primaryFontColor.withOpacity(0.70),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()));
                          },
                          child: H5(
                            text: "Regístrate",
                            fontWeight: FontWeight.w700,
                            color: BrandColor.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    spacing40,
                    H5(
                      text: "También puedes",
                      color: BrandColor.primaryFontColor.withOpacity(0.80),
                    ),
                    spacing20,
                    CommonButtonWidget(
                      color: Color(0xff000814),
                      text: "Iniciar Sesión con Google",
                      icon: AssetData.iconGoogle,
                      onPressed: () {},
                    ),
                    spacing20,
                    CommonButtonWidget(
                      color: Color(0xff0A82ED),
                      text: "Iniciar Sesión con Facebook",
                      icon: AssetData.iconFacebook,
                      onPressed: () {},
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
