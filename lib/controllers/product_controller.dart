import 'package:belajar_getx/models/product.dart';
import 'package:belajar_getx/services/product_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final ProductService _service = ProductService();

  final RxList<Product> _product = <Product>[].obs;
  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;
  List<Product> get products => _product;

  @override
  void onInit(){
    _fetchProducts();
    super.onInit();
  }
 
  Future<void> _fetchProducts() async {
    _isLoading.value = true;
    await Future.delayed(Duration(seconds: 3));
    final data = await _service.fetchProducts();

    _product.assignAll(data);
    _isLoading.value = false;
  }
}