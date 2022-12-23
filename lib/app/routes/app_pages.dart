import 'package:get/get.dart';

import '../../main.dart';
import '../data/utiles/app_strings.dart';
import '../modules/aboutus/bindings/aboutus_binding.dart';
import '../modules/aboutus/views/aboutus_view.dart';
import '../modules/account_settings/bindings/account_settings_binding.dart';
import '../modules/account_settings/views/account_settings_view.dart';
import '../modules/allproduct/bindings/allproduct_binding.dart';
import '../modules/allproduct/views/allproduct_view.dart';
import '../modules/authentication/bindings/authentication_binding.dart';
import '../modules/authentication/views/authentication_view.dart';
import '../modules/bottomnavigationbar/bindings/bottomnavigationbar_binding.dart';
import '../modules/bottomnavigationbar/views/bottomnavigationbar_view.dart';
import '../modules/brands/bindings/brands_binding.dart';
import '../modules/brands/views/brands_view.dart';
import '../modules/brandwise_product/bindings/brandwise_product_binding.dart';
import '../modules/brandwise_product/views/brandwise_product_view.dart';
import '../modules/changepassword/bindings/changepassword_binding.dart';
import '../modules/changepassword/views/changepassword_view.dart';
import '../modules/checkout/bindings/checkout_binding.dart';
import '../modules/checkout/views/checkout_view.dart';
import '../modules/contactus/bindings/contactus_binding.dart';
import '../modules/contactus/views/contactus_view.dart';
import '../modules/coupon/bindings/coupon_binding.dart';
import '../modules/coupon/views/coupon_view.dart';
import '../modules/giftcard/bindings/giftcard_binding.dart';
import '../modules/giftcard/views/giftcard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/morevall_product/bindings/morevall_product_binding.dart';
import '../modules/morevall_product/views/morevall_product_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/order/bindings/order_binding.dart';
import '../modules/order/views/order_view.dart';
import '../modules/order_details/bindings/order_details_binding.dart';
import '../modules/order_details/views/order_details_view.dart';
import '../modules/policy/bindings/policy_binding.dart';
import '../modules/policy/views/policy_view.dart';
import '../modules/product_cart/bindings/product_cart_binding.dart';
import '../modules/product_cart/views/product_cart_view.dart';
import '../modules/product_categories/bindings/product_categories_binding.dart';
import '../modules/product_categories/views/product_categories_view.dart';
import '../modules/product_details/bindings/product_details_binding.dart';
import '../modules/product_details/views/product_details_view.dart';
import '../modules/product_wishlist/bindings/product_wishlist_binding.dart';
import '../modules/product_wishlist/views/product_wishlist_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/select_langauge/bindings/select_langauge_binding.dart';
import '../modules/select_langauge/views/select_langauge_view.dart';
import '../modules/slash/bindings/slash_binding.dart';
import '../modules/slash/views/slash_view.dart';
import '../modules/termsandcondition/bindings/termsandcondition_binding.dart';
import '../modules/termsandcondition/views/termsandcondition_view.dart';
import '../modules/update_profile/bindings/update_profile_binding.dart';
import '../modules/update_profile/views/update_profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static String INITIAL =
      preferences.getString(AppStrings.onBoardingKey) == AppStrings.valueInit
          ? Routes.ONBOARDING
          : Routes.BOTTOMNAVIGATIONBAR;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTHENTICATION,
      page: () => const AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS,
      page: () => ProductDetailsView(),
      binding: ProductDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_CART,
      page: () => const ProductCartView(),
      binding: ProductCartBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_WISHLIST,
      page: () => const ProductWishlistView(),
      binding: ProductWishlistBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_SETTINGS,
      page: () => const AccountSettingsView(),
      binding: AccountSettingsBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_CATEGORIES,
      page: () => const ProductCategoriesView(),
      binding: ProductCategoriesBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOMNAVIGATIONBAR,
      page: () => const BottomnavigationbarView(),
      binding: BottomnavigationbarBinding(),
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => const OrderView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_PROFILE,
      page: () => const UpdateProfileView(),
      binding: UpdateProfileBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT,
      page: () => CheckoutView(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_DETAILS,
      page: () => const OrderDetailsView(),
      binding: OrderDetailsBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.BRANDS,
      page: () => const BrandsView(),
      binding: BrandsBinding(),
    ),
    GetPage(
      name: _Paths.ALLPRODUCT,
      page: () => const AllproductView(),
      binding: AllproductBinding(),
    ),
    GetPage(
      name: _Paths.ABOUTUS,
      page: () => const AboutusView(),
      binding: AboutusBinding(),
    ),
    GetPage(
      name: _Paths.TERMSANDCONDITION,
      page: () => const TermsandconditionView(),
      binding: TermsandconditionBinding(),
    ),
    GetPage(
      name: _Paths.CONTACTUS,
      page: () => const ContactusView(),
      binding: ContactusBinding(),
    ),
    GetPage(
      name: _Paths.POLICY,
      page: () => const PolicyView(),
      binding: PolicyBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.COUPON,
      page: () => const CouponView(),
      binding: CouponBinding(),
    ),
    GetPage(
      name: _Paths.GIFTCARD,
      page: () => const GiftcardView(),
      binding: GiftcardBinding(),
    ),
    GetPage(
      name: _Paths.SLASH,
      page: () => const SlashView(),
      binding: SlashBinding(),
    ),
    GetPage(
      name: _Paths.CHANGEPASSWORD,
      page: () => const ChangepasswordView(),
      binding: ChangepasswordBinding(),
    ),
    GetPage(
      name: _Paths.MOREVALL_PRODUCT,
      page: () => const MorevallProductView(),
      binding: MorevallProductBinding(),
    ),
    GetPage(
      name: _Paths.BRANDWISE_PRODUCT,
      page: () => const BrandwiseProductView(),
      binding: BrandwiseProductBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_LANGAUGE,
      page: () => const SelectLangaugeView(),
      binding: SelectLangaugeBinding(),
    ),
  ];
}
