import 'package:belajar_getx/controllers/cart_controller.dart';
import 'package:belajar_getx/controllers/product_controller.dart';
import 'package:get/get.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductController());
    // CartController di-register permanen agar bisa diakses dari semua halaman
    Get.put(CartController(), permanent: true);
  }
}