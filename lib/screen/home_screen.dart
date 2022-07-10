import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/main_card.dart';
import '../controller/home_controller.dart';
import '../context/data_context.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final controller = HomeController();
  final ctxt = Get.find<DataContext>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((){
        if(controller.loading.value) {
          return const Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 6,
              ),
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height/2 - 360/2 <= 200 ? 200 : MediaQuery.of(context).size.height/2 - 360/2,
                    child: SvgPicture.asset(
                      'images/logo.svg',
                      width: 600,
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: SizedBox(
                        width: 350,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 20),
                              child: Text(
                                'Home',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff17a2d0)
                                ),
                              ),
                            ),
                            MainCard(
                              onTap: () => controller.goToNewForm(),
                              enabled: true, 
                              title: 'Novo Atendimento',
                              icon: Icons.add_box_rounded,
                            ),
                            MainCard(
                              onTap: () => controller.goToSearchForm(),
                              enabled: true, 
                              title: 'Histórico de Atendimento',
                              icon: Icons.file_open_sharp,
                            ),
                            MainCard(
                              onTap: () => controller.logout(ctxt.cleanData),
                              enabled: true, 
                              title: 'Sair',
                              icon: Icons.logout,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      })
    );
  }
}