import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../screen/home_screen.dart';
import 'package:get/get.dart';


class SpecificScreen extends StatelessWidget {
  final dynamic form;
  final bool newForm;
  const SpecificScreen(this.form, this.newForm,{Key? key}) : super(key: key);

  

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
    TextEditingController descricaoDaOcorrencia = TextEditingController();
    TextEditingController resolvidono1 = TextEditingController();
    TextEditingController situacao = TextEditingController();
    TextEditingController visitaTecnica = TextEditingController();
    TextEditingController procedencia = TextEditingController();
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
    descricaoDaOcorrencia.text = form['occurrence_desc'];
    resolvidono1.text = form['solve_frist_contact'];
    situacao.text = form['situation'];
    visitaTecnica.text = form['technical_visit'];
    procedencia.text = form['origin'];
    destino.text = form['destiny_name'];
    
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
                            'Formulário',
                            textAlign: TextAlign.center,
                            style: TextStyle(
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
                                    labelText: 'Identificação do Cliente'
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
                                    labelText: 'Nome do Cliente'
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
                                  readOnly: true,
                                  controller: descricaoDaOcorrencia,
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
                        Row(
                          children: [
                            //Resolvido 1
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10, bottom: 10),
                                child: TextField(
                                  readOnly: true,
                                  controller: resolvidono1,
                                  style: const TextStyle(
                                    fontSize: 18
                                  ),
                                  decoration: const InputDecoration(  
                                    border: OutlineInputBorder(),
                                    labelText: 'Resolvido no 1º contato?'
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
                                  controller: situacao,
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
                                  controller: visitaTecnica,
                                  style: const TextStyle(
                                    fontSize: 18
                                  ),
                                  decoration: const InputDecoration(  
                                    border: OutlineInputBorder(),
                                    labelText: 'Visita Técnica?'
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            //Procedência
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                                child: TextField(
                                  readOnly: true,
                                  controller: procedencia,
                                  style: const TextStyle(
                                    fontSize: 18
                                  ),
                                  decoration: const InputDecoration(  
                                    border: OutlineInputBorder(),
                                    labelText: 'Procedência'
                                  ),
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
                                  var texto = 'Protocol: ${form['protocol']}\n';
                                  texto += 'responsável pelo cadastro: ${form['user_name']}\n';
                                  texto += 'Tipo de Cliente: ${tipoCliente.text}\n';
                                  texto += "Identificação do Cliente: ${idCliente.text}\n";
                                  texto += "Nome do Cliente: ${nomeCliente.text}\n";
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
                                  texto += "Descrição da Ocorrência: ${descricaoDaOcorrencia.text}\n";
                                  texto += "Resolvido no 1º contato: ${resolvidono1.text}\n";
                                  texto += "Situação: ${situacao.text}\n";
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
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red
                                ),
                                onPressed: () => newForm ? Get.offAll(HomeScreen()): Get.back(), 
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