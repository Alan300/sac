import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screen/home_screen.dart';
import '../context/database.dart';
import 'package:mysql_utils/mysql_utils.dart';

class LoginController extends GetxController{

  var loading = false.obs;
  var user = TextEditingController();
  var userError = ''.obs;
  var password =TextEditingController();
  var passwordError = ''.obs;
  var obscurePassword = true.obs;

  void resetUserError() => userError.value = '';

  void resetPassworError() => passwordError.value = '';

  void setObscurePassword() => obscurePassword.value = !obscurePassword.value;

  void logIn(Function setData) async {
    if(user.text == '') {
      userError.value = 'Matrícula inválida.';
    } else if (password.text == '') {
      passwordError.value = 'Senha inválida.';
    } else {
      loading.value = true;
      final db = MysqlUtils(settings: DataBase.settings);
      final userdb = await db.query('select * from users where id = ${user.text}');
      if(userdb.rows.isEmpty) {
        userError.value = 'Matrícula não encontrada.';
      } else if(userdb.rows[0]['password'] != password.text) {
        passwordError.value = 'Senha incorreta.';
      } else {
        final clientType = await db.query('select * from client_type');
        final brand = await db.query('select * from brand');
        final purchaseOrigin = await db.query('select * from purchase_origin');
        final occurrenceOrigin = await db.query('select * from occurrence_origin');
        final occurrenceType = await db.query('select * from occurrence_type');
        final destiny = await db.query('select * from destiny');
        setData(
          { 'id': userdb.rows[0]['id'].toString(),
            'name': userdb.rows[0]['name'].toString()},
          clientType.rows.map<String>((e) => e['descr'].toString()).toList(),
          brand.rows.map<String>((e) => e['name'].toString()).toList(),
          purchaseOrigin.rows.map<String>((e) => e['name'].toString()).toList(),
          occurrenceOrigin.rows.map<String>((e) => e['name'].toString()).toList(),
          occurrenceType.rows.map<String>((e) => e['name'].toString()).toList(),
          destiny.rows.map<Map>((e) => {
            'name': e['name'].toString(),
            'email': e['email'].toString()
          }).toList()
        );
          db.close();
          await Get.offAll(HomeScreen());
        }
      loading.value = false;
    }
  }
}