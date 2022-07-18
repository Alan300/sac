import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/form_card.dart';
import '../screen/specific_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ListScreen extends StatelessWidget {
  final List<dynamic> forms;
  const ListScreen(this.forms,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
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
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red
                            ),
                            onPressed: () => Get.back(), 
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
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: forms.length,
                          itemBuilder: (context, index) {
                            return FormCard(
                              onTap: () async {
                                Map<String,dynamic> data = await Get.to(SpecificScreen(forms[index], false));
                                if(data.isNotEmpty) {
                                  forms[index]['occurrence_desc'] = data['occurrence_desc'];
                                  forms[index]['solve_frist_contact'] = data['solve_frist_contact'];
                                  forms[index]['situation'] = data['situation'];
                                  forms[index]['technical_visit'] = data['technical_visit'];
                                  forms[index]['origin'] = data['origin'];
                                }
                              },
                              title: [forms[index]['purchase_date'],forms[index]['invoice'],forms[index]['product']],
                            );
                          }
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}