import 'package:e_commerce_app/src/common/widgets/loaders/snackbar.dart';
import 'package:e_commerce_app/src/features/shop/controller/product/variation_controller.dart';
import 'package:e_commerce_app/src/features/shop/model/cart_item_model.dart';
import 'package:e_commerce_app/src/features/shop/model/product_model.dart';
import 'package:e_commerce_app/src/utils/contants/enums.dart';
import 'package:e_commerce_app/src/utils/local_storage/storage_utility.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  // Variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;


  cartController() {
    loadCartItems();
  }

  // Add item to cart
  // but first we check quantity
  void addToCart(ProductModel product) {
    // Quantity check
    if (productQuantityInCart.value < 1) {
      danLoaders.customToast(message: "Select quantity, cart controller!");
      return;
    }

    // Variation selected?
    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      danLoaders.customToast(message: "Select Variation");
      return;
    }

    // Out of Stock Status
    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1) {
        danLoaders.warningSnackBar(
            title: "Oh snap!",
            message: " Selected variation is out of stock. cart controller");
        return;
      }
    } else {
      if (product.stock < 1) {
        danLoaders.warningSnackBar(
            title: "Oh snap!",
            message: "Selected product is out of stock. cart controller");
        return;
      }
    }

    // convert the productModel to a cartitem with the given quantity
    final selectedCartItem = convertToCartItem(product, productQuantityInCart.value);

    // check if already added in the cart
    int index =  cartItems.indexWhere((cartItem) => cartItem.productId == selectedCartItem.productId && cartItem.variationId == selectedCartItem.variationId);

    if(index >= 0){
      // This quantity is already added or Updated/remove from the design (cart)(-)
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    updateCart();
    danLoaders.customToast(message: "Your product has been added to the cart.");
  }



  /// add a single item to the cart
  void addOneItemToCart(CartItemModel item){
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == item.productId && cartItem.variationId == item.variationId);

    if (index >= 0){
      cartItems[index].quantity +=1;
    } else {
      cartItems.add(item);
    }

    updateCart();
  }

  void removeOneFromCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == item.productId && cartItem.variationId == item.variationId);

    if(index >= 0) {
      if(cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        // show dialog before completely removing
        cartItems[index].quantity == 1 ? removeFromCartDialog(index) : cartItems.removeAt(index);
      }
      updateCart();
    }
  }

  // this is that pop to ask are you sure you wan to cancel
  void removeFromCartDialog(int index)
  {
    Get.defaultDialog(
      title: "Remove Product",
      middleText: 'Are you sure you want to remove this product',
      onConfirm: () {
        // remove the item from the cart
        cartItems.removeAt(index);
        updateCart();
        danLoaders.customToast(message: 'Product removed from the cart.');
        Get.back();
      },
      onCancel: () => () => Get.back(),
    );
  }


  /// -- Initialize already added item's count in the cart
  void updateAlreadyAddedProductCount(ProductModel product) {
    // if product has no variation then calculate cartEntries and display total number.
    // Else make default entries to 0 and show cartEntries when variation is selected.
    if(product.productType == ProductType.single.toString()) {
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    } else {
      // Get selected variation if any...
      final variationId = variationController.selectedVariation.value.id;
      if(variationId.isNotEmpty) {
        productQuantityInCart.value = getvariationQuantityInCart(product.id, variationId);
      } else {
        productQuantityInCart.value = 0;
      }
    }

  }



  /// this function converts a productmodel to a cartItemModel
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      // Reset variation in case of string product type.
      variationController.resetSelectedAttributes();
    }

    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    // this checks if theres variation, and if there is check if it has a sale price if it does not normal return the price and so on -- video 51 --- 14:56,
    final price = isVariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;

    return CartItemModel(
      productId: product.id,
      quantity: quantity,
      price: price,
      title: product.title,
      variationId: variation.id,
      image: isVariation ? variation.image : product.thumbnail,
      brandName: product.brand != null ? product.brand!.name : '',
      selectedVariation: isVariation ? variation.attributeValues : null,
    );
  }


  /// Update cart values
  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }


  void updateCartTotals() {
    double calculateTotalPrice = 0.0;
    int calculatedNoOfitems = 0;


    for (var item in cartItems) {
      calculateTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedNoOfitems += item.quantity;
    }

    totalCartPrice.value = calculateTotalPrice;
    noOfCartItems.value = calculatedNoOfitems;
  }

  ///// to save data to the local storage using a key
  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    danLocalStorage.instance().writeData('CARTITEMS', cartItemStrings);
  }

  //// to load the local data from the local storage using a key
  void loadCartItems() {
    final cartItemStrings = danLocalStorage.instance().readData<List<dynamic>>('CARTITEMS');
    if (cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings.map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotals();
    }
  }



  //// this two functions are responsible for return the quantity in the cart
  //// product quantity of the current selected product in cart
  int getProductQuantityInCart(String productId) {
    //// this here loops through the item, initially its zero so it gets the new quantity then adds it together -- video 51 -23:39
    final foundItem = cartItems.where((item) => item.productId == productId).fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  //variation quantity in cart
  //// this returns the product quantity of current selected variation  product in cart
  int getvariationQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere((item) => item.productId == productId && item.variationId == variationId,
    orElse: () => CartItemModel.empty(),
    );
    return foundItem.quantity;
  }


  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();

  }


}
