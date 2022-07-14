import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask/mask.dart';
import '../controller/search_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  final controller = SearchController();

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
                                'Busca',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff17a2d0)
                                )
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10),
                              child: TextField(
                                onSubmitted: (_) => controller.searchForms(),
                                onTap: () => controller.resetSearchError(),
                                controller: controller.search,
                                inputFormatters: [
                                  Mask.cpfOrCnpj()
                                ],
                                style: const TextStyle(
                                  fontSize: 18
                                ),
                                decoration: InputDecoration(  
                                  border: const OutlineInputBorder(),
                                  labelText: 'CNPJ/CPF',
                                  prefixIcon: const Icon(
                                    Icons.search
                                  ),
                                  errorText: controller.searchError.value == '' ? null : controller.searchError.value
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10,  right: 10),
                                  child: ElevatedButton(
                                    onPressed: () => controller.searchForms(), 
                                    child: const Padding(
                                      padding: EdgeInsets.only(top: 10, bottom: 10),
                                      child: Text(
                                        'Buscar',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18
                                        ),
                                      ),
                                    )
                                  )
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red
                                    ),
                                    onPressed: () => controller.goToHome(), 
                                    child: const Padding(
                                      padding: EdgeInsets.only(top: 10, bottom: 10),
                                      child: Text(
                                        'Voltar',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18
                                        ),
                                      ),
                                    )
                                  )
                                )
                              ],
                            )
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