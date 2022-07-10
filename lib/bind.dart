import 'package:get/get.dart';
import 'context/data_context.dart';
import 'context/database.dart';

class Bind implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<DataContext>(() => DataContext());
    Get.lazyPut<DataBase>(() => DataBase());
  }
}
