import 'package:get/get.dart';
import '../context/database.dart';
import '../screen/log_screen.dart';
import 'package:mysql_utils/mysql_utils.dart';


class SpecificController extends GetxController{

  var loading = false.obs;


  void searchLogs(String protocol) async{
    loading.value = true;
    final db = MysqlUtils(settings: DataBase.settings);
    var result = await db.query("select * from log_form where protocol = $protocol");
    db.close();
    await Get.to(LogScreen(result.rows));
    loading.value = false;
  }
}