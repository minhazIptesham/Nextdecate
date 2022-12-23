import 'package:get/get.dart';

import '../../../data/models/new_productinfo_model.dart';
import '../../../data/models/product_cart_model.dart';
import '../../../data/utiles/local_helper/cart_local_store.dart';


class ProductCartController extends GetxController {
/*  var productInfoWithQty = List<ProductCart>.empty(growable: true).obs;

  @override
  void onInit() {
    super.onInit();
    productInfoWithQty.assignAll(DBHelper.object.getTheCartList());
  }

  double get totalPrice => productInfoWithQty.fold(
      0,
      (sum, price) => sum = sum +
          double.parse(price.productInfo!.basePrice.toString()) * double.parse(price.productQty.toString()));

  addToCart(NewProductModel _products) {
    for (var i = 0; i < productInfoWithQty.length; i++) {
      ProductCart temp = productInfoWithQty[i];

      if (temp.productInfo!.id == _products.id) {
        productInfoWithQty[i].productQty++;
        // save the cart list to database
        DBHelper.object.updateCartList(productInfoWithQty);
        return;
      }
    }
    ProductCart itemCart = ProductCart(_products, 1);
    productInfoWithQty.add(itemCart);

    // save the cart list to database
    //DBHelper.object.updateCartList(productInfoWithQty);
  }

  removeFromCart(int index) {
    productInfoWithQty.removeAt(index);
    // save the cart list to database
    DBHelper.object.updateCartList(productInfoWithQty);
  }

  removeAllCart() {
    productInfoWithQty.clear();
    // save the cart list to database
    DBHelper.object.updateCartList(productInfoWithQty);
  }

  addToCartQtyIncrement(NewProductModel products, int index) {
    productInfoWithQty[index].productQty++;
    // save the cart list to database
    DBHelper.object.updateCartList(productInfoWithQty);
  }

  addToCartQtyDecrement(NewProductModel _products, int index) {
    productInfoWithQty[index].productQty--;
    // save the cart list to database
    DBHelper.object.updateCartList(productInfoWithQty);
  }*/
}
