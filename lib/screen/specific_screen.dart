import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../context/data_context.dart';
import '../controller/specific_controller.dart';


class SpecificScreen extends StatelessWidget {
  final dynamic form;
  final bool newForm;
  SpecificScreen(this.form, this.newForm,{Key? key}) : super(key: key);
  final controller = SpecificController();
  final ctxt = Get.find<DataContext>();

  void updateForm(data) {
    form['occurrence_desc'] = data['occurrence_desc'];
    form['solve_frist_contact'] = data['solve_frist_contact'];
    form['situation'] = data['situation'];
    form['technical_visit'] = data['technical_visit'];
    form['origin'] = data['origin'];
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController tipoCliente = TextEditingController();
    TextEditingController idCliente = TextEditingController();
    TextEditingController nomeCliente = TextEditingController();
    TextEditingController enderecoCliente = TextEditingController();
    TextEditingController telefoneFixo = TextEditingController();
    TextEditingController telefoneCelular = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController marca = TextEditingController();
    TextEditingController produto = TextEditingController();
    TextEditingController dataDaCompra = TextEditingController();
    TextEditingController notaFiscal = TextEditingController();
    TextEditingController origemDaCompra = TextEditingController();
    TextEditingController representante = TextEditingController();
    TextEditingController tipoDaOcorrencia = TextEditingController();
    TextEditingController destino = TextEditingController();

    tipoCliente.text = form['client_type'];
    idCliente.text = form['client_id'];
    nomeCliente.text = form['client_name'];
    enderecoCliente.text = form['client_adress'];
    telefoneFixo.text = form['telephone'];
    telefoneCelular.text = form['cellphone'];
    email.text = form['email'];
    marca.text = form['brand'];
    produto.text = form['product'];
    dataDaCompra.text = form['purchase_date'];
    notaFiscal.text = form['invoice'];
    origemDaCompra.text = form['purchase_origin'];
    representante.text = form['representative'];
    tipoDaOcorrencia.text = form['occurrence_type'];
    controller.descOcorrencia.text = form['occurrence_desc'];
    controller.setResolvidono1(form['solve_frist_contact']);
    controller.setSitaucao(form['situation']);
    controller.setVisitaTecnica(form['technical_visit']);
    controller.setProcedencia(form['origin']);
    destino.text = form['destiny_name'];
    
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
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 20),
                              child: Text(
                                'Ocorrência n°${form['protocol']}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff17a2d0)
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                //Tipo Cliente
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                                    child: TextField(
                                      readOnly: true,
                                      controller: tipoCliente,
                                      style: const TextStyle(
                                        fontSize: 18
                                      ),
                                      decoration: const InputDecoration(  
                                        border: OutlineInputBorder(),
                                        labelText: 'Tipo de Cliente'
                                      ),
                                    ),
                                  ),
                                ),
                                //ID Cliente
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                                    child: TextField(
                                      readOnly: true,
                                      controller: idCliente,
                                      style: const TextStyle(
                                        fontSize: 18
                                      ),
                                      decoration: const InputDecoration(  
                                        border: OutlineInputBorder(),
                                        labelText: 'CNPJ/CPF'
                                      ),
                                    ),
                                  ),
                                ),
                                //Nome Cliente
                                Flexible(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                                    child: TextField(
                                      readOnly: true,
                                      controller: nomeCliente,
                                      style: const TextStyle(
                                        fontSize: 18
                                      ),
                                      decoration: const InputDecoration(  
                                        border: OutlineInputBorder(),
                                        labelText: 'Razão Social'
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            
                            //Endereço Cliente
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10),
                              child: TextField(
                                readOnly: true,
                                controller: enderecoCliente,
                                style: const TextStyle(
                                  fontSize: 18
                                ),
                                decoration: const InputDecoration(  
                                  border: OutlineInputBorder(),
                                  labelText: 'Endereço do Cliente'
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                //Telefone Fixo
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                                    child: TextField(
                                      readOnly: true,
                                      controller: telefoneFixo,
                                      style: const TextStyle(
                                        fontSize: 18
                                      ),
                                      decoration: const InputDecoration(  
                                        border: OutlineInputBorder(),
                                        labelText: 'Telefone Fixo'
                                      ),
                                    ),
                                  ),
                                ),
                                //Telefone Celular
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                                    child: TextField(
                                      readOnly: true,
                                      controller: telefoneCelular,
                                      style: const TextStyle(
                                        fontSize: 18
                                      ),
                                      decoration: const InputDecoration(  
                                        border: OutlineInputBorder(),
                                        labelText: 'Telefone Celular'
                                      ),
                                    ),
                                  ),
                                ),
                                //Email
                                Flexible(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                                    child: TextField(
                                      readOnly: true,
                                      controller: email,
                                      style: const TextStyle(
                                        fontSize: 18
                                      ),
                                      decoration: const InputDecoration(  
                                        border: OutlineInputBorder(),
                                        labelText: 'E-mail'
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                //Marca
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                                    child: TextField(
                                      readOnly: true,
                                      controller: marca,
                                      style: const TextStyle(
                                        fontSize: 18
                                      ),
                                      decoration: const InputDecoration(  
                                        border: OutlineInputBorder(),
                                        labelText: 'Marca'
                                      ),
                                    ),
                                  ),
                                ),
                                //Produto
                                Flexible(
                                  flex: 4,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: TextField(
                                      readOnly: true,
                                      controller: produto,
                                      style: const TextStyle(
                                        fontSize: 18
                                      ),
                                      decoration: const InputDecoration(  
                                        border: OutlineInputBorder(),
                                        labelText: 'Produto'
                                      ),
                                    ),
                                  ),
                                ),
                                //Data da Compra
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                                    child: TextField(
                                      readOnly: true,
                                      controller: dataDaCompra,
                                      style: const TextStyle(
                                        fontSize: 18
                                      ),
                                      decoration: const InputDecoration(  
                                        border: OutlineInputBorder(),
                                        labelText: 'Data da Compra'
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                //Nota Fiscal
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                                    child: TextField(
                                      readOnly: true,
                                      controller: notaFiscal,
                                      style: const TextStyle(
                                        fontSize: 18
                                      ),
                                      decoration: const InputDecoration(  
                                        border: OutlineInputBorder(),
                                        labelText: 'Nota Fiscal'
                                      ),
                                    ),
                                  ),
                                ),
                                //Origem Compra
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                                    child: TextField(
                                      readOnly: true,
                                      controller: origemDaCompra,
                                      style: const TextStyle(
                                        fontSize: 18
                                      ),
                                      decoration: const InputDecoration(  
                                        border: OutlineInputBorder(),
                                        labelText: 'Origem da Compra'
                                      ),
                                    ),
                                  ),
                                ),
                                //Representante
                                tipoCliente.text == 'B2B' ?
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                                    child: TextField(
                                      readOnly: true,
                                      controller: representante,
                                      style: const TextStyle(
                                        fontSize: 18
                                      ),
                                      decoration: const InputDecoration(  
                                        border: OutlineInputBorder(),
                                        labelText: 'Representante'
                                      ),
                                    ),
                                  )
                                )
                                : const SizedBox.shrink(),
                              ],
                            ),
                            Row(
                              children: [
                                //Tipo Ocorrencia
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                                    child: TextField(
                                      readOnly: true,
                                      controller: tipoDaOcorrencia,
                                      style: const TextStyle(
                                        fontSize: 18
                                      ),
                                      decoration: const InputDecoration(  
                                        border: OutlineInputBorder(),
                                        labelText: 'Tipo da Ocorrência'
                                      ),
                                    ),
                                  ),
                                ),
                                //Descrição Ocorrencia
                                Flexible(
                                  flex: 4,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                                    child: TextField(
                                      readOnly: newForm,
                                      onChanged: (_) => controller.checkIsChanged(form),
                                      controller: controller.descOcorrencia,
                                      style: const TextStyle(
                                        fontSize: 18
                                      ),
                                      decoration: const InputDecoration(  
                                        border: OutlineInputBorder(),
                                        labelText: 'Descrição da Ocorrência'
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            newForm ?
                            Row(
                              children: [
                                //Resolvido 1
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                                    child: TextField(
                                      readOnly: true,
                                      controller: TextEditingController(text: form['solve_frist_contact']),
                                      style: const TextStyle(
                                        fontSize: 18
                                      ),
                                      decoration: const InputDecoration(  
                                        border: OutlineInputBorder(),
                                        labelText: 'Resolvido no 1º Contato?'
                                      ),
                                    ),
                                  ),
                                ),
                                //Situação
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: TextField(
                                      readOnly: true,
                                      controller: TextEditingController(text: form['situation']),
                                      style: const TextStyle(
                                        fontSize: 18
                                      ),
                                      decoration: const InputDecoration(  
                                        border: OutlineInputBorder(),
                                        labelText: 'Situação'
                                      ),
                                    ),
                                  ),
                                ),
                                //Visita Tecnica
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                                    child: TextField(
                                      readOnly: true,
                                      controller: TextEditingController(text: form['technical_visit']),
                                      style: const TextStyle(
                                        fontSize: 18
                                      ),
                                      decoration: const InputDecoration(  
                                        border: OutlineInputBorder(),
                                        labelText: 'Visita Técnica'
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                            :
                            Row(
                              children: [
                                //Resolvido 1
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                                    child: DropdownButtonFormField<String>(
                                      value: controller.resolvidono1.value,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Resolvido no 1º Contato?',
                                        labelStyle: TextStyle(
                                          fontSize: 18
                                        ),
                                      ),
                                      isExpanded: true,
                                      onChanged: (e) {
                                        controller.setResolvidono1(e);
                                        controller.checkIsChanged(form);
                                      },
                                      items: const [
                                        DropdownMenuItem<String>(
                                          value: 'Sim',
                                          child: Text('Sim'),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: 'Não',
                                          child: Text('Não'),
                                        )
                                      ]
                                    ),
                                  ),
                                ),
                                //Situação
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: DropdownButtonFormField<String>(
                                      value: controller.sitaucao.value,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Situação',
                                        labelStyle: TextStyle(
                                          fontSize: 18
                                        )
                                      ),
                                      isExpanded: true,
                                      onChanged: (e) { 
                                        controller.setSitaucao(e);
                                        controller.checkIsChanged(form);
                                      },
                                      items: const [
                                        DropdownMenuItem<String>(
                                          value: 'Andamento',
                                          child: Text('Andamento'),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: 'Follow-up',
                                          child: Text('Follow-up'),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: 'Finalizado',
                                          child: Text('Finalizado'),
                                        )
                                      ]
                                    ),
                                  ),
                                ),
                                //Visita Tecnica
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                                    child: DropdownButtonFormField<String>(
                                      value: controller.visitaTecnica.value,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Visita Técnica',
                                        labelStyle: TextStyle(
                                          fontSize: 18
                                        )
                                      ),
                                      isExpanded: true,
                                      onChanged: (e) {
                                        controller.setVisitaTecnica(e);
                                        controller.checkIsChanged(form);
                                      },
                                      items: const [
                                        DropdownMenuItem<String>(
                                          value: 'Sim',
                                          child: Text('Sim'),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: 'Não',
                                          child: Text('Não'),
                                        )
                                      ]
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                //Procedência
                                newForm ?
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                                    child: TextField(
                                      readOnly: true,
                                      controller: TextEditingController(text: form['origin']),
                                      style: const TextStyle(
                                        fontSize: 18
                                      ),
                                      decoration: const InputDecoration(  
                                        border: OutlineInputBorder(),
                                        labelText: 'Procedência'
                                      ),
                                    ),
                                  ),
                                )
                                :
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                                    child: DropdownButtonFormField<String>(
                                      value: controller.procedencia.value,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Procedência',
                                        labelStyle: TextStyle(
                                          fontSize: 18 
                                        )
                                      ),
                                      isExpanded: true,
                                      onChanged: (e) {
                                        controller.setProcedencia(e);
                                        controller.checkIsChanged(form);
                                      },
                                      items: const [
                                        DropdownMenuItem<String>(
                                          value: 'Procedente',
                                          child: Text('Procedente'),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: 'Improcedente',
                                          child: Text('Improcedente'),
                                        )
                                      ]
                                    ),
                                  ),
                                ),
                                //Destino Atendimento
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                                    child: TextField(
                                      readOnly: true,
                                      controller: destino,
                                      style: const TextStyle(
                                        fontSize: 18
                                      ),
                                      decoration: InputDecoration(  
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            Clipboard.setData(
                                              ClipboardData(
                                                text: form['destiny_email']
                                              )
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.copy,
                                            color: Color(0xff17a2d0),
                                          ),
                                        ),
                                        border: const OutlineInputBorder(),
                                        labelText: 'Destino do Atendimento'
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10,  right: 10),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      var texto = 'Protocolo: ${form['protocol']}\n';
                                      texto += 'Responsável Pelo Cadastro: ${form['user_name']}\n';
                                      texto += 'Tipo de Cliente: ${tipoCliente.text}\n';
                                      texto += "CNPJ/CPF: ${idCliente.text}\n";
                                      texto += "Razão Social: ${nomeCliente.text}\n";
                                      texto += "Endereço do Cliente: ${enderecoCliente.text}\n";
                                      texto += "Telefone Fixo: ${telefoneFixo.text}\n";
                                      texto += "Telefone Celular: ${telefoneCelular.text}\n";
                                      texto += "E-mail: ${email.text}\n";
                                      texto += "Marca: ${marca.text}\n";
                                      texto += "Produto: ${produto.text}\n";
                                      texto += "Data da Compra: ${dataDaCompra.text}\n";
                                      texto += "Nota Fiscal: ${notaFiscal.text}\n";
                                      texto += "Origem da Compra: ${origemDaCompra.text}\n";
                                      if(tipoCliente.text == 'B2B') {
                                        texto += "Representante: ${representante.text}\n";
                                      }
                                      texto += "Tipo da Ocorrência: ${tipoDaOcorrencia.text}\n";
                                      texto += "Descrição da Ocorrência: ${form['occurrence_desc']}\n";
                                      texto += "Resolvido no 1º Contato: ${form['solve_frist_contact']}\n";
                                      texto += "Situação: ${form['situation']}\n";
                                      texto += "Visita Técnica: ${form['technical_visit']}\n";
                                      texto += "Procedência: ${form['origin']}\n";
                                      texto += "Destino do Atendimento: ${destino.text}";
                                      Clipboard.setData(
                                        ClipboardData(
                                          text: texto
                                        )
                                      );
                                    }, 
                                    child: const Padding(
                                      padding: EdgeInsets.only(top: 10, bottom: 10),
                                      child: Text(
                                        'Copiar Dados',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18
                                        ),
                                      ),
                                    )
                                  )
                                ),
                                newForm ?
                                const SizedBox.shrink() 
                                : 
                                Padding(
                                  padding: const EdgeInsets.only(top: 10,  right: 10),
                                  child: ElevatedButton(
                                    onPressed: () => controller.searchLogs(form['protocol'].toString()), 
                                    child: const Padding(
                                      padding: EdgeInsets.only(top: 10, bottom: 10),
                                      child: Text(
                                        'Histórico',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18
                                        ),
                                      ),
                                    )
                                  )
                                ),
                                newForm ?
                                const SizedBox.shrink() 
                                : 
                                Padding(
                                  padding: const EdgeInsets.only(top: 10,  right: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green
                                    ),
                                    onPressed: () => controller.updateForm(int.parse(form['protocol'].toString()), ctxt.user, updateForm), 
                                    child: const Padding(
                                      padding: EdgeInsets.only(top: 10, bottom: 10),
                                      child: Text(
                                        'Atualizar',
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
                                    onPressed: () => controller.back(newForm), 
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