import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoesappclient/main.dart';
import 'package:shoesappclient/models/user_model.dart';
import 'package:shoesappclient/services/remote/firestore_service.dart';
import 'package:shoesappclient/ui/general/brand_color.dart';
import 'package:shoesappclient/ui/pages/init_page.dart';
import 'package:shoesappclient/ui/widgets/common_button_widget.dart';
import 'package:shoesappclient/ui/widgets/common_input_widget.dart';
import 'package:shoesappclient/ui/widgets/common_password_widget.dart';
import 'package:shoesappclient/ui/widgets/common_text.dart';
import 'package:shoesappclient/ui/widgets/common_widget.dart';
import 'package:shoesappclient/utils/asset_data.dart';
import 'package:shoesappclient/utils/responsive.dart';
import 'package:shoesappclient/utils/types.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  FirestoreService firestoreService = FirestoreService();

  registerUser() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (userCredential.user != null) {
        UserModel model = UserModel(
          email: emailController.text,
          name: fullNameController.text,
          phone: phoneController.text,
          role: "client",
        );
        String value = await firestoreService.registerUser(model);
        if (value.isNotEmpty) {
          // ignore: use_build_context_synchronously
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => InitPage()));
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        ScaffoldMessenger.of(context).showSnackBar(
          snackBarError(
            "La contraseña es muy débil, debe de tener como mínimo 6 caracteres",
          ),
        );
      } else if (e.code == "email-already-in-use") {
        ScaffoldMessenger.of(context).showSnackBar(
          snackBarError(
            "El correo electrónico ya está registrado",
          ),
        );
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
          //Form
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
                      text: "Regístrate",
                    ),
                    spacing20,
                    CommonInputWidget(
                      label: "Nombre completo",
                      hintText: "Tu nombre completo",
                      icon: AssetData.iconUser,
                      controller: fullNameController,
                      inputType: InputTypeEnum.text,
                    ),
                    spacing20,
                    CommonInputWidget(
                      label: "Teléfono",
                      hintText: "Tu teléfono",
                      icon: AssetData.iconPhone,
                      controller: phoneController,
                      inputType: InputTypeEnum.phone,
                    ),
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
                      text: "Regístrate",
                      onPressed: () {
                        registerUser();
                      },
                    ),
                    spacing16,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        H5(
                          text: "Ya tienes una cuenta?  ",
                          color: BrandColor.primaryFontColor.withOpacity(0.70),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: H5(
                            text: "Inicia Sesión",
                            fontWeight: FontWeight.w700,
                            color: BrandColor.primaryColor,
                          ),
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
