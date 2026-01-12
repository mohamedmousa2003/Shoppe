const String baseURL = "https://ecommerce.routemisr.com";
class EndPoints{
  static const String signIn='$baseURL/api/v1/auth/signin';
  static const String signUp='$baseURL/api/v1/auth/signup';
  static const String getAllCategories = "$baseURL/api/v1/categories";
  static String subCategories(String id) {
    return '$baseURL/api/v1/categories/$id/subcategories';
  }
  static const String cart='$baseURL/api/v1/cart';

  static const String getAllProducts='$baseURL/api/v1/products';

}