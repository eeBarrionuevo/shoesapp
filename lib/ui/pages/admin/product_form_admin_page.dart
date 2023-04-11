import 'package:flutter/material.dart';
import 'package:shoesappclient/ui/general/brand_color.dart';
import 'package:shoesappclient/ui/widgets/common_input_widget.dart';
import 'package:shoesappclient/ui/widgets/common_text.dart';
import 'package:shoesappclient/ui/widgets/common_widget.dart';
import 'package:shoesappclient/utils/asset_data.dart';
import 'package:shoesappclient/utils/types.dart';

class ProductFormAdminPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColor.secondaryColor,
        title: H4(
          text: "Agregar Producto",
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonInputWidget(
                label: "Nombre del producto",
                hintText: "Nombre del producto",
                icon: AssetData.iconRocket,
                controller: nameController,
                inputType: InputTypeEnum.text,
              ),
              spacing20,
              H5(
                text: "  Marca:",
                fontWeight: FontWeight.w500,
              ),
              spacing8,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 12,
                      offset: const Offset(4, 4),
                    ),
                  ],
                ),
                child: DropdownButton(
                  value: "Adidas",
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(20.0),
                  elevation: 6,
                  underline: const SizedBox(),
                  items: [
                    DropdownMenuItem(
                      child: H5(text: "Adidas"),
                      value: "Adidas",
                    ),
                    DropdownMenuItem(
                      child: H5(text: "Nike"),
                      value: "Nike",
                    ),
                    DropdownMenuItem(
                      child: H5(text: "New Balance"),
                      value: "New Balance",
                    ),
                  ],
                  onChanged: (value) {},
                ),
              ),
              spacing20,
              Row(
                children: [
                  Expanded(
                    child: CommonInputWidget(
                      label: "Precio (S/.)",
                      hintText: "Precio",
                      icon: AssetData.iconRocket,
                      controller: nameController,
                      inputType: InputTypeEnum.text,
                    ),
                  ),
                  spacing16Width,
                  Expanded(
                    child: CommonInputWidget(
                      label: "Descuento (%)",
                      hintText: "Descuent",
                      icon: AssetData.iconRocket,
                      controller: nameController,
                      inputType: InputTypeEnum.text,
                    ),
                  ),
                ],
              ),
              spacing20,
              Row(
                children: [
                  Expanded(
                    child: CommonInputWidget(
                      label: "Stock",
                      hintText: "Stock",
                      icon: AssetData.iconRocket,
                      controller: nameController,
                      inputType: InputTypeEnum.text,
                    ),
                  ),
                  spacing16Width,
                  const Expanded(
                    child: SizedBox(),
                  ),
                ],
              ),
              spacing20,
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: CommonInputWidget(
                      label: "Tallas",
                      hintText: "Talla",
                      icon: AssetData.iconRocket,
                      controller: nameController,
                      inputType: InputTypeEnum.text,
                    ),
                  ),
                  spacing16Width,
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: BrandColor.primaryFontColor,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
