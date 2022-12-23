
import 'new_productinfo_model.dart';

class ProductCart{
  NewProductModel? productInfo;
  var  productQty;
  bool  isCheckProductCart=false;

  ProductCart(this.productInfo, this.productQty,this.isCheckProductCart);

  ProductCart.fromJson(Map<String, dynamic> json) {
    productInfo = NewProductModel.fromJson(json['product_info']);
    productQty = json['product_qty'];
    isCheckProductCart = json['isCheckProductCart'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['product_info'] = productInfo;
    data['product_qty'] = productQty;
    data['isCheckProductCart'] = isCheckProductCart;

    return data;
  }

  void setQty(int i) {
    if (i < 1) {
      productQty = i;
    } else {
      productQty = i;
    }
  }
}


