import 'package:get/get.dart';
import '../context/database.dart';
import 'package:mysql_utils/mysql_utils.dart';

class SpecificController extends GetxController{

  var loading = false.obs;


  void searchLogs(String protocol) async{
    final db = MysqlUtils(settings: DataBase.settings);
    var result = await db.query("select * from log_form where protocol = $protocol");
    db.close();
    print(result.rows);
  }
}