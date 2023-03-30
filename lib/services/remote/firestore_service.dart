import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoesappclient/models/brand_model.dart';
import 'package:shoesappclient/models/product_model.dart';

class FirestoreService {
  Future<List<ProductModel>> getProducts() async {
    CollectionReference reference =
        FirebaseFirestore.instance.collection("products");

    QuerySnapshot collection = await reference.get();

    List<QueryDocumentSnapshot> docs = collection.docs;

    List<ProductModel> products = [];

    List<BrandModel> brands = await getBrands();

    for (QueryDocumentSnapshot item in docs) {
      ProductModel product =
          ProductModel.fromJson(item.data() as Map<String, dynamic>);
      String newBrand =
          brands.where((element) => element.id == product.brand).first.name;
      product.brand = newBrand;
      products.add(product);
    }

    return products;
  }

  Future<List<BrandModel>> getBrands() async {
    CollectionReference reference =
        FirebaseFirestore.instance.collection("brands");
    QuerySnapshot collection = await reference.get();
    List<QueryDocumentSnapshot> docs = collection.docs;
    List<BrandModel> brands = [];
    for (QueryDocumentSnapshot item in docs) {
      BrandModel model =
          BrandModel.fromJson(item.data() as Map<String, dynamic>);
      model.id = item.id;
      brands.add(model);
    }
    return brands;
  }
}
