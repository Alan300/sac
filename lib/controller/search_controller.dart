import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../context/database.dart';
import 'package:mysql_utils/mysql_utils.dart';
import '../screen/list_screen.dart';

class SearchController extends GetxController{

  var loading = false.obs;
  var idClient = TextEditingController();
  var idClientError = ''.obs;
  var numeroProtocolo = TextEditingController();
  var numeroProtocoloError = ''.obs;

  void resetIdClientError() => idClientError.value = '';
  void resetNumeroProtocolError() => numeroProtocoloError.value = '';

  void searchForms() async{
    if(numeroProtocolo.text.isEmpty && idClient.text.isEmpty) {
      numeroProtocoloError.value = 'Digite um número de protocolo válido';
      idClientError.value = 'Digite um cpf/cnpj válido.';
    } else if(numeroProtocolo.text.isEmpty && idClient.text.length != 14 && idClient.text.length != 18) {
      idClientError.value = 'Digite um cpf/cnpj válido.';
    } 
    else {
      loading.value = true;
      final db = MysqlUtils(settings: DataBase.settings);
      String query;
      if(numeroProtocolo.text.isNotEmpty) {
        query = "select  * from form where protocol = '${numeroProtocolo.text}'";
      } else {
        query = "select  * from form where client_id = '${idClient.text}'";
      }
      var result = await db.query(query);
      db.close();
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
        await Get.to(ListScreen(result.rows));
        numeroProtocolo.text = '';
        idClient.text = '';
      }
      loading.value = false;
    }
  }

  void goToHome() => Get.back(); 
}