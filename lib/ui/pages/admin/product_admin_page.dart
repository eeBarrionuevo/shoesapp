import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoesappclient/ui/general/brand_color.dart';
import 'package:shoesappclient/ui/widgets/common_text.dart';
import 'package:shoesappclient/ui/widgets/common_widget.dart';

class ProductAdminPage extends StatelessWidget {
  CollectionReference productReference =
      FirebaseFirestore.instance.collection("products");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColor.secondaryColor,
        title: H4(
          text: "Productos",
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: StreamBuilder(
        stream: productReference.snapshots(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData) {
            QuerySnapshot collection = snap.data;
            List<QueryDocumentSnapshot> docs = collection.docs;
            return Text(docs.toString());
          }
          return loadingWidget;
        },
      ),
    );
  }
}
