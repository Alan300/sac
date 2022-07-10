import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../screen/form_screen.dart';
import '../screen/search_screen.dart';
import '../screen/login_screen.dart';


class HomeController extends GetxController {
  var loading = false.obs;
  
  void goToNewForm() => Get.offAll(FormScreen());
  void goToSearchForm() => Get.to(SearchScreen());
  void logout(Function cleanData){
    Get.defaultDialog(
      title: 'Atenção',
      middleText: 'Você realmente deseja sair?',
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
          cleanData();
          Get.offAll(LoginScreen());
        }, 
        child: const Text('Sim')
      ),
    );
  }
}