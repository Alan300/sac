import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysql_utils/mysql_utils.dart';
import '../screen/list_screen.dart';

class SearchController extends GetxController{

  var loading = false.obs;
  var search = TextEditingController();
  var searchError = ''.obs;

  void resetSearchError() => searchError.value = '';

  void searchForms(MysqlUtils? db) async{
    if(search.text.length != 14 && search.text.length != 18) {
      searchError.value = 'Digite um cpf/cnpj válido.';
    } else {
      loading.value = true;
      var result = await db!.query("select  * from form where client_id = '${search.text}'");
      if(result.rows.isEmpty) {
        Get.defaultDialog(
          title: 'Atenção',
          middleText: 'Não há atendimentos com esse id.',
          confirm: ElevatedButton(
            onPressed: (){
              Get.back();
            }, 
            child: const Text('Ok')
          ),
        );
      } else {
        Get.to(ListScreen(result.rows));
        search.text = '';
      }
      loading.value = false;
    }
  }

  void goToHome() => Get.back(); 
}