import 'package:belajar_getx/models/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  // RxList untuk menyimpan daftar produk di keranjang
  final RxList<Product> _cartItems = <Product>[].obs;

  // Getter untuk daftar produk
  List<Product> get cartItems => _cartItems;

  // Getter untuk jumlah item
  int get itemCount => _cartItems.length;

  // Getter untuk total harga
  double get totalPrice =>
      _cartItems.fold(0.0, (sum, product) => sum + product.price);

  // Menambah produk ke keranjang
  void addProduct(Product product) {
    _cartItems.add(product);
    Get.snackbar(
      'Berhasil',
      '${product.title} ditambahkan ke keranjang',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  // Menghapus produk dari keranjang berdasarkan index
  void removeProduct(int index) {
    final name = _cartItems[index].title;
    _cartItems.removeAt(index);
    Get.snackbar(
      'Dihapus',
      '$name dihapus dari keranjang',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }
}
