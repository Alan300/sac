import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class LogScreen extends StatelessWidget {
  final List listLog;
  final List<TableRow> listWidget = [];
  LogScreen(this.listLog, {Key? key}) : super(key: key) {

    listWidget.add(
      TableRow(
        children: [
          'Data da Alteração',
          'Responsável',
          'Descrição da Ocorrência',
          'Resolvido no 1º Contato',
          'Situação',
          'Visita Técnica',
          'Procedência'
        ].map((e){
          return TableCell(
            child: Text(
              e,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            )
          );
        }).toList()
        ),
      );
    for(var i in listLog) {
      TableRow row = TableRow(
        children: [
          TableCell(
            child: Text(
              DateFormat('dd/MM/yyyy - HH:mm').format(DateTime.parse(i['date_change'])),
              textAlign: TextAlign.center
            )
          ),
          TableCell(
            child: Text(
              i['user_name'],
              textAlign: TextAlign.center
            )
          ),
          TableCell(
            child: Text(
              i['occurrence_desc'],
              textAlign: TextAlign.center
            )
          ),
          TableCell(
            child: Text(
              i['solve_frist_contact'],
              textAlign: TextAlign.center
            )
          ),
          TableCell(
            child: Text(
              i['situation'],
              textAlign: TextAlign.center
            )
          ),
          TableCell(
            child: Text(
              i['technical_visit'],
              textAlign: TextAlign.center
            )
          ),
          TableCell(
            child: Text(
              i['origin'],
              textAlign: TextAlign.center
            )
          )
        ]
      );
      listWidget.add(row);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height/2 - 770/2 <= 0 ? 0 : MediaQuery.of(context).size.height/2 - 770/2,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    width: 1280,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 20),
                          child: Text(
                            'Registro de Mudanças',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff17a2d0)
                            ),
                          ),
                        ),
                        Table(
                          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                          border: const TableBorder(
                            horizontalInside: BorderSide(
                              width: 1,
                              color: Color(0xFFDDDDDD),
                            ),
                            verticalInside: BorderSide(
                              width: 1,
                              color: Color(0xFFDDDDDD),
                            ),
                          ),
                          children: listWidget,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
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
      )
    );
  }
}