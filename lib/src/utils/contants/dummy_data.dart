import 'package:e_commerce_app/src/utils/contants/image_strings.dart';
import '../../features/shop/model/category_model.dart';

class danDummyData {

  // static final List<BannerModel> banners = [
  //
  //   BannerModel();
  //
  // ];

  // static final UserModel user = UserModel(
  //     // id: id,
  //     firstname: "Danniel",
  //     lastname: "Nsoffor",
  //     username: "danni",
  //     email: "dannielnsofor2@gmail.com",
  //     phoneNumber: "08135997383",
  //     profilePicture: danImage.google,
  //
  // );


  static final List<CategoryModel> categories = [


    CategoryModel(id: "1", name: "Sports", image: danImage.google, isFeatured: true, parentId: "2",),
    CategoryModel(id: "2", name: "Furniture", image: danImage.imageNft, isFeatured: true, parentId: "2",),
    CategoryModel(id: "3", name: "Electronics", image: danImage.successImage, isFeatured: true, parentId: "2",),
    CategoryModel(id: "4", name: "Clothes", image: danImage.facebook, isFeatured: true, parentId: "2",),
    CategoryModel(id: "5", name: "Animals", image: danImage.loadingImage2, isFeatured: true, parentId: "2",),
    CategoryModel(id: "6", name: "Shoes", image: danImage.google, isFeatured: true, parentId: "2",),
    CategoryModel(id: "7", name: "Cosmetics", image: danImage.google, isFeatured: true, parentId: "2",),
    CategoryModel(id: "8", name: "Jewelery", image: danImage.google, isFeatured: true, parentId: "2",),


    //subcategories
    CategoryModel(id: "9", name: "Sport shoes", image: danImage.google, isFeatured: false, parentId: "2",),
    CategoryModel(id: "10", name: "Track Suits", image: danImage.imageNft, isFeatured: false, parentId: "2",),
    CategoryModel(id: "12", name: "Sports Equipment", image: danImage.loadingImage2, isFeatured: false, parentId: "2",),

    //furniture
    CategoryModel(id: "13", name: "Bedroom funiture", image: danImage.loadingImage2, isFeatured: false, parentId: "5",),
    CategoryModel(id: "14", name: "Kitchen Furniture", image: danImage.imageNft, isFeatured: false, parentId: "5",),
    CategoryModel(id: "15", name: "Office furniture", image: danImage.google, isFeatured: false, parentId: "5",),

    //electionics
    CategoryModel(id: "16", name: "Laptop", image: danImage.imageNft, isFeatured: false, parentId: "3",),
    CategoryModel(id: "17", name: "Mobile", image: danImage.google, isFeatured: false, parentId: "3",),

    CategoryModel(id: "18", name: "Airpod", image: danImage.facebook, isFeatured: false, parentId: "3",),
  ];
}