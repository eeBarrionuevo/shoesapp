import 'dart:io';
import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shoesappclient/ui/general/brand_color.dart';
import 'package:shoesappclient/ui/widgets/common_button_widget.dart';
import 'package:shoesappclient/ui/widgets/common_text.dart';
import 'package:shoesappclient/ui/widgets/common_widget.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

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
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Text("Hola");
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
