import 'dart:io';
import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shoesappclient/ui/general/brand_color.dart';
import 'package:shoesappclient/ui/widgets/common_button_widget.dart';
import 'package:shoesappclient/ui/widgets/common_text.dart';
import 'package:shoesappclient/ui/widgets/common_widget.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:shoesappclient/utils/asset_data.dart';

class ReportAdminPage extends StatelessWidget {
  exportExcel() async {
    Excel myExcel = Excel.createExcel();
    Sheet? sheet = myExcel.sheets[myExcel.getDefaultSheet() as String];
    sheet!.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0)).value =
        "Julioooo";

    List<int>? bytes = myExcel.save();
    Directory directory = await getApplicationDocumentsDirectory();
    File fileExcel = File("${directory.path}/prueba_excel.xlsx")
      ..createSync(recursive: true)
      ..writeAsBytesSync(bytes!);
    await OpenFilex.open(fileExcel.path);
  }

  exportPDF() async {
    ByteData byteData = await rootBundle.load(AssetData.imageLogo);
    Uint8List bytesImage = byteData.buffer.asUint8List();

    final pdf = pw.Document();
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        header: (context) {
          return pw.Container(
            height: 20,
            width: double.infinity,
            color: PdfColors.blue,
          );
        },
        footer: (context) {
          return pw.Container(
            height: 20,
            width: double.infinity,
            color: PdfColors.amber,
          );
        },
        build: (pw.Context context) {
          return [
            pw.Image(
              pw.MemoryImage(bytesImage),
              height: 44.0,
            ),
            pw.Text(
              "Aurora Studio",
              style: pw.TextStyle(
                fontSize: 16.0,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.Text(
              "Av. Gonzales Prada 113 - Cayma",
              style: pw.TextStyle(
                fontSize: 14.0,
                fontWeight: pw.FontWeight.normal,
              ),
            ),
            pw.Text(
              "Tel. 965 343 123",
              style: pw.TextStyle(
                fontSize: 14.0,
                fontWeight: pw.FontWeight.normal,
              ),
            ),
            pw.SizedBox(
              height: 20.0,
            ),
            pw.ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) {
                return pw.Container(
                  margin: const pw.EdgeInsets.symmetric(vertical: 8.0),
                  padding: const pw.EdgeInsets.all(10.0),
                  decoration: pw.BoxDecoration(
                    borderRadius: pw.BorderRadius.circular(10.0),
                    border: pw.Border.all(
                      color: PdfColors.black,
                      width: 0.7,
                    ),
                  ),
                  child: pw.Row(
                    children: [
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text("Nombre del producto: "),
                          pw.Text("Precio: "),
                          pw.Text("Descuento: "),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ];
        },
      ),
    );
    Uint8List bytes = await pdf.save();
    Directory directory = await getApplicationDocumentsDirectory();
    File pdfFile = File("${directory.path}/prueba_pdf.pdf")
      ..createSync(recursive: true)
      ..writeAsBytesSync(bytes);
    await OpenFilex.open(pdfFile.path);
  }

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
              onPressed: () {
                exportExcel();
              },
            ),
            spacing20,
            CommonButtonWidget(
              text: "Generar PDF",
              color: BrandColor.primaryFontColor,
              onPressed: () {
                exportPDF();
              },
            ),
          ],
        ),
      ),
    );
  }
}
