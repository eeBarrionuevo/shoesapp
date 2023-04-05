import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesappclient/models/user_model.dart';
import 'package:shoesappclient/services/local/sp_global.dart';
import 'package:shoesappclient/services/remote/firestore_service.dart';
import 'package:shoesappclient/ui/general/brand_color.dart';
import 'package:shoesappclient/ui/pages/init_page.dart';
import 'package:shoesappclient/ui/pages/register_page.dart';
import 'package:shoesappclient/ui/widgets/common_button_widget.dart';
import 'package:shoesappclient/ui/widgets/common_input_widget.dart';
import 'package:shoesappclient/ui/widgets/common_password_widget.dart';
import 'package:shoesappclient/ui/widgets/common_text.dart';
import 'package:shoesappclient/ui/widgets/common_widget.dart';
import 'package:shoesappclient/utils/asset_data.dart';
import 'package:shoesappclient/utils/responsive.dart';
import 'package:shoesappclient/utils/types.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  FirestoreService firestoreService = FirestoreService();

  final formKeyLogin = GlobalKey<FormState>();

  bool isLoading = false;

  login() async {
    if (formKeyLogin.currentState!.validate()) {
      try {
        isLoading = true;
        setState(() {});
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        if (userCredential.user != null) {
          UserModel? userModel =
              await firestoreService.getUser(emailController.text);
          if (userModel != null) {
            SPGlobal().fullName = userModel.name;
            SPGlobal().isLogin = true;
            isLoading = false;
            setState(() {});
            // ignore: use_build_context_synchronously
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => InitPage()));
          }
        }
      } on FirebaseAuthException catch (e) {
        isLoading = false;
        setState(() {});
        if (e.code == "wrong-password") {
          ScaffoldMessenger.of(context).showSnackBar(
            snackBarError(
              "La contraseña ingresada es incorrecta",
            ),
          );
        } else if (e.code == "user-not-found") {
          ScaffoldMessenger.of(context).showSnackBar(
            snackBarError(
              "El correo electrónico no está registrado",
            ),
          );
        }
      }
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
                child: Form(
                  key: formKeyLogin,
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
                            color:
                                BrandColor.primaryFontColor.withOpacity(0.70),
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
          ),

          isLoading
              ? Container(
                  color: Colors.white70,
                  child: loadingWidget,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
