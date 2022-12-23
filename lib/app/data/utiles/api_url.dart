abstract class ApiURL {
  ApiURL._();

  static const String globalUrl = 'https://soft29.bdtask.com/nextdecade/';
  static const String baseApiUrl = 'https://soft29.bdtask.com/nextdecade/app_v2/';

  ///------------------- Authentication  url path -----------------------
  static const String loginUrl = '${baseApiUrl}login';
  static const String registerUrl = '${baseApiUrl}registration';
  static const String contactUsUrl = '${baseApiUrl}contact_us?';
  static const String changePasswordUrl = '${baseApiUrl}change_password?';
  static const String userProfileUrl = '${baseApiUrl}user_info?';
  static const String userUpdateProfileUrl = '${baseApiUrl}user_update?';
  static const String getCountryUrl = '${baseApiUrl}country_list';
  static const String getStateByCountryIdUrl = '${baseApiUrl}state_list?country_id=';

  ///------------------------ Home Url Path ------------------------
  static const String homeSliderUrl = '${baseApiUrl}slider_list';
  static const String homeBestSaleUrl = '${baseApiUrl}best_sale';
  static const String homeAllProductUrl = '${baseApiUrl}productlist';
  static const String homeHotCategoriesUrl = '${baseApiUrl}hot_categories';
  static const String homeBrandListUrl = '${baseApiUrl}brand_list';
  static const String homeBrandWiseProductListUrl = '${baseApiUrl}retrieve_brand_product?brand_id=';
  static const String pDetailsByProductIdeUrl = '${baseApiUrl}product_info?product_id=69428333';

  ///------------------------ Categories Url Path ------------------------
  static const String homeC1ategoriesUrl = '${baseApiUrl}categorylist';
  static const String homeSubCategoryChildByIdUrl = '${baseApiUrl}get_category_childs?category_id=';

  ///------------------------ Checkout Url Path ------------------------
  static const String getShippingAddressUrl = '${baseApiUrl}shipping_info?customer_id=';
  static const String updateShippingAddressUrl = '${baseApiUrl}shipping_update';
  static const String shippingMethodAddressUrl = '${baseApiUrl}shipping_list';

  /// --------------------------- Order Url Path ------------------
  static const String getOrderUrl = '${baseApiUrl}order_all_info?user_id=';
  static const String getOrderDetailsUrl = '${baseApiUrl}order_details?order_id=';
  static const String createReviewUrl = '${baseApiUrl}review_entry?';

  /// --------------------------- WishList Url Path ------------------
  static const String getWishesUrl = '${baseApiUrl}wishlist';
  static const String addWishesUrl = '${baseApiUrl}wishlist';
  static const String removeWishesUrl = '${baseApiUrl}wishlist_remove';

  /// --------------------------- Checkout Url Path ------------------
  static const String checkoutUrlPath = '${baseApiUrl}checkout';

/// ---------------------------- product search -----------------------
  static const String productSearchUrl = '${baseApiUrl}search?keyword=';


  /// ------------------------------ Coupon List -----------------
  static const String couponListUrl = '${baseApiUrl}coupon_list';
  static const String couponApplyUrl = '${baseApiUrl}apply_coupon?';


  /// -------------------- Website Info --------------------
  static const String webSiteInfo = '${baseApiUrl}website_info';
  static const String getReviewList = '${baseApiUrl}/review_list?product_id=';

}
