import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoesappclient/models/product_model.dart';

class FirestoreService {
  Future<List<ProductModel>> getProducts() async {
    CollectionReference reference =
        FirebaseFirestore.instance.collection("products");

    QuerySnapshot collection = await reference.get();

    List<QueryDocumentSnapshot> docs = collection.docs;

    List<ProductModel> products = [];

    // products = docs
    //     .map((e) => ProductModel.fromJson(e.data() as Map<String, dynamic>))
    //     .toList();

    for (QueryDocumentSnapshot item in docs) {
      ProductModel product =
          ProductModel.fromJson(item.data() as Map<String, dynamic>);
      products.add(product);
      // print(product.toJson());
    }

    return products;
  }
}
