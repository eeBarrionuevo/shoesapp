import 'package:flutter/material.dart';
import 'package:shoesappclient/main.dart';
import 'package:shoesappclient/ui/general/brand_color.dart';
import 'package:shoesappclient/ui/widgets/common_button_widget.dart';
import 'package:shoesappclient/ui/widgets/common_input_widget.dart';
import 'package:shoesappclient/ui/widgets/common_password_widget.dart';
import 'package:shoesappclient/ui/widgets/common_text.dart';
import 'package:shoesappclient/ui/widgets/common_widget.dart';
import 'package:shoesappclient/utils/asset_data.dart';
import 'package:shoesappclient/utils/responsive.dart';
import 'package:shoesappclient/utils/types.dart';

class RegisterPage extends StatelessWidget {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

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
                    CommonPasswordWidget(),
                    spacing30,
                    CommonButtonWidget(
                      color: BrandColor.secondaryColor,
                      text: "Regístrate",
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
