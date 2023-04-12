import 'package:flutter/material.dart';
import 'package:shoesappclient/ui/general/brand_color.dart';
import 'package:shoesappclient/ui/widgets/common_input_widget.dart';
import 'package:shoesappclient/ui/widgets/common_text.dart';
import 'package:shoesappclient/ui/widgets/common_widget.dart';
import 'package:shoesappclient/utils/asset_data.dart';
import 'package:shoesappclient/utils/responsive.dart';
import 'package:shoesappclient/utils/types.dart';

class ProductFormAdminPage extends StatefulWidget {
  @override
  State<ProductFormAdminPage> createState() => _ProductFormAdminPageState();
}

class _ProductFormAdminPageState extends State<ProductFormAdminPage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController sizeController = TextEditingController();

  List<double> sizes = [];

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
                icon: AssetData.iconNotepad,
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
                      icon: AssetData.iconDollar,
                      controller: nameController,
                      inputType: InputTypeEnum.text,
                    ),
                  ),
                  spacing16Width,
                  Expanded(
                    child: CommonInputWidget(
                      label: "Descuento (%)",
                      hintText: "Descuento",
                      icon: AssetData.iconOffer,
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
                      icon: AssetData.iconShape,
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
                      icon: AssetData.iconSize,
                      controller: sizeController,
                      inputType: InputTypeEnum.text,
                    ),
                  ),
                  spacing16Width,
                  InkWell(
                    onTap: () {
                      double size = double.parse(sizeController.text);
                      sizes.add(size);
                      setState(() {});
                    },
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
              spacing16,
              Container(
                height: ResponsiveUI.pDiagonal(context, 0.25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 12,
                      offset: const Offset(4, 4),
                    ),
                  ],
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: sizes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: H5(text: "Talla: ${sizes[index]}"),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete_rounded,
                          size: 20.0,
                          color: Colors.redAccent,
                        ),
                        onPressed: () {},
                      ),
                    );
                  },
                ),
              ),
              spacing40,
            ],
          ),
        ),
      ),
    );
  }
}
