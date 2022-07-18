import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../context/database.dart';
import '../screen/home_screen.dart';
import '../screen/log_screen.dart';
import 'package:mysql_utils/mysql_utils.dart';
import 'package:ntp/ntp.dart';

class SpecificController extends GetxController{

  var loading = false.obs;
  var isChanged = false.obs;
  var isUpdate = false.obs;

  var descOcorrencia = TextEditingController();
  var resolvidono1 = ''.obs;
  var sitaucao = ''.obs;
  var visitaTecnica = ''.obs;
  var procedencia = ''.obs;
  Map<String,dynamic> updateData = {};

  void checkIsChanged(dynamic form) {
    if(descOcorrencia.text != form['occurrence_desc'] ||
      resolvidono1.value != form['solve_frist_contact'] || 
      sitaucao.value != form['situation'] ||
      visitaTecnica.value != form['technical_visit'] ||
      procedencia.value != form['origin'] ) {
      isChanged.value = true;
    } else {
      isChanged.value = false;
    }
  }

  void setResolvidono1(String? value) {
    resolvidono1.value = value??'';
  }
  void setSitaucao(String? value) {
    sitaucao.value = value??'';
  }
  void setVisitaTecnica(String? value) { 
    visitaTecnica.value = value??'';
  }
  void setProcedencia(String? value) {
    procedencia.value = value??'';
  }

  void searchLogs(String protocol) async{
    loading.value = true;
    final db = MysqlUtils(settings: DataBase.settings);
    var result = await db.query("select * from log_form where protocol = $protocol");
    db.close();
    await Get.to(LogScreen(result.rows));
    loading.value = false;
  }

  void updateForm(int protocol, Map<String,dynamic> user, Function form) async {
    if(!isChanged.value) {
      Get.defaultDialog(
        title: 'Erro',
        middleText: 'A ocorrência só pode ser atualizada se houver mudança.',
        confirm: ElevatedButton(
          onPressed: (){
            Get.back();
          }, 
          child: const Text('Ok')
        ),
      );
    } else {
      loading.value = true;
      DateTime changeDate = await NTP.now();
      final db = MysqlUtils(settings: DataBase.settings);
      updateData  = {
        'occurrence_desc':descOcorrencia.text,
        'solve_frist_contact':resolvidono1.value ,
        'situation':sitaucao.value,
        'technical_visit':visitaTecnica.value ,
        'origin':procedencia.value,
      };
      await db.update(
        table: 'form', 
        updateData: updateData, 
        where:{
          'protocol': protocol
        }
      );
      await db.insert(
        table: 'log_form', 
        insertData: {
          'protocol': protocol,
          'date_change': changeDate,
          'user_name': user['name'],
          'occurrence_desc': descOcorrencia.text,
          'solve_frist_contact': resolvidono1.value,
          'situation': sitaucao.value,
          'technical_visit': visitaTecnica.value, 
          'origin': procedencia.value  
        }
      );
      form(updateData);
      isUpdate.value = true;
      isChanged.value = false;
      loading.value = false;
      Get.defaultDialog(
        title: 'Sucesso',
        middleText: 'Ocorrência atualizada.',
        confirm: ElevatedButton(
          onPressed: (){
            Get.back();
          }, 
          child: const Text('Ok')
        ),
      );

    }
  }

  void back(bool newForm) {
    if(newForm) {
      Get.offAll(HomeScreen());
    } else {
      if(isChanged.value) {
        Get.defaultDialog(
          title: 'Atenção',
          middleText: 'Os dados alterados não foram salvos.\nVocê deseja voltar?',
          cancel: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red
            ),
            onPressed: (){
              Get.back();
            }, 
            child: const Text('Não')
          ),
          confirm: ElevatedButton(
            onPressed: (){
              Get.back();
              Get.back(result: updateData);
            }, 
            child: const Text('Sim')
          ),
        );
      } else {
        Get.back(result: updateData);
      }
    }
  }
}