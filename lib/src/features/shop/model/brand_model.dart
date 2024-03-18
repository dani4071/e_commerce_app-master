

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;


  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productsCount,
});



  // empty Helper function
  static BrandModel empty() => BrandModel(id: "", name: "", image: "");

  /// convert model to Json structure so that you can store data in firebase
  toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'ProductsCount': productsCount,
      'isFeatured': isFeatured,
    };
  }



  /// Map Json oriented document to snapshot from firebase to Usermodel
  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if(data.isEmpty) return BrandModel.empty();
    return BrandModel(
        id: data['Id'] ?? '',
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
      isFeatured: data['isFeatured'] ?? '',
      productsCount: data['ProductsCount'] ?? '',
    );
  }

}