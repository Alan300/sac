import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controller/form_controller.dart';
import '../context/data_context.dart';
import 'package:mask/mask.dart';
import 'package:dropdown_search/dropdown_search.dart';


class FormScreen extends StatelessWidget {
  FormScreen({Key? key}) : super(key: key);

  final controller = FormController();
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
                                    child: DropdownSearch<String>(
                                        popupProps: const PopupProps.menu(
                                            showSelectedItems: true,
                                            showSearchBox: true,
                                        ),
                                        dropdownDecoratorProps : DropDownDecoratorProps(
                                          dropdownSearchDecoration: InputDecoration (
                                            border: const OutlineInputBorder(),
                                            labelText: 'Tipo do Cliente',
                                            errorText: controller.tipoClienteError.value == '' ? null : controller.tipoClienteError.value,
                                            labelStyle: const TextStyle(
                                              fontSize: 18,
                                            )
                                          )
                                        ),
                                        items: ctxt.tipoCliente,
                                        onChanged: (e) {
                                          controller.setTipoCliente(e);
                                          controller.resetTipoClienteError();
                                        },
                                    ),
                                  ),
                                ),
                                //ID Cliente
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                                    child: TextField(
                                      onTap: () => controller.resetIdClienteError(),
                                      onChanged: (e) => controller.resetIdClienteError(),
                                      controller: controller.idCliente,
                                      inputFormatters: [
                                        Mask.cpfOrCnpj()
                                      ],
                                      style: const TextStyle(
                                        fontSize: 18
                                      ),
                                      decoration: InputDecoration(  
                                        border: const OutlineInputBorder(),
                                        labelText: 'CNPJ/CPF',
                                        errorText: controller.idClienteError.value == '' ? null : controller.idClienteError.value
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
                                      onChanged: (e) => controller.resetnomeClienteError(),
                                      onTap: () => controller.resetnomeClienteError(),
                                      controller: controller.nomeCliente,
                                      style: const TextStyle(
                                        fontSize: 18
                                      ),
                                      decoration: InputDecoration(  
                                        border: const OutlineInputBorder(),
                                        labelText: 'Razão Social',
                                        errorText: controller.nomeClienteError.value == '' ? null : controller.nomeClienteError.value
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
                                onChanged: (e) => controller.resetEnderecoClienteError(),
                                onTap: () => controller.resetEnderecoClienteError(),
                                controller: controller.enderecoCliente,
                                style: const TextStyle(
                                  fontSize: 18
                                ),
                                decoration: InputDecoration(  
                                  border: const OutlineInputBorder(),
                                  labelText: 'Endereço do Cliente',
                                  errorText: controller.enderecoClienteError.value == '' ? null : controller.enderecoClienteError.value
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
                                      onChanged: (e){
                                        controller.resetTelefoneFixoError();
                                      },
                                      onTap: () => controller.resetTelefoneFixoError(),
                                      controller: controller.telefoneFixo,
                                      inputFormatters: [
                                        Mask.generic(masks: ['(##) ####-####'])
                                      ],
                                      style: const TextStyle(
                                        fontSize: 18
                                      ),
                                      decoration: InputDecoration(  
                                        border: const OutlineInputBorder(),
                                        labelText: 'Telefone Fixo',
                                        errorText: controller.telefoneFixoError.value == '' ? null : controller.telefoneFixoError.value
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
                                      onChanged: (e) =>controller.resetTelefoneCelularError(),
                                      onTap: () => controller.resetTelefoneCelularError(),
                                      controller: controller.telefoneCelular,
                                      inputFormatters: [
                                        Mask.generic(masks: ['(##) ####-####','(##) #####-####'])
                                      ],
                                      style: const TextStyle(
                                        fontSize: 18
                                      ),
                                      decoration: InputDecoration(  
                                        border: const OutlineInputBorder(),
                                        labelText: 'Telefone Celular',
                                        errorText: controller.telefoneCelularError.value == '' ? null : controller.telefoneCelularError.value
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
                                      onChanged: (e) => controller.resetEmailError(),
                                      onTap: () => controller.resetEmailError(),
                                      controller: controller.email,
                                      style: const TextStyle(
                                        fontSize: 18
                                      ),
                                      decoration: InputDecoration(  
                                        border: const OutlineInputBorder(),
                                        labelText: 'E-mail',
                                        errorText: controller.emailError.value == '' ? null : controller.emailError.value
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
                                    child: DropdownSearch<String>(
                                        popupProps: const PopupProps.menu(
                                            showSelectedItems: true,
                                            showSearchBox: true,
                                        ),
                                        dropdownDecoratorProps : DropDownDecoratorProps(
                                          dropdownSearchDecoration: InputDecoration (
                                            border: const OutlineInputBorder(),
                                            labelText: 'Marca',
                                            errorText: controller.marcaError.value == '' ? null : controller.marcaError.value,
                                            labelStyle: const TextStyle(
                                              fontSize: 18
                                            )
                                          )
                                        ),
                                        items: ctxt.marca,
                                        onChanged: (e) {
                                          controller.setMarca(e);
                                          controller.resetMarcaError();
                                        },
                                    ),
                                  ),
                                ),
                                //Produto
                                Flexible(
                                  flex: 4,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: TextField(
                                      onChanged: (e){
                                        controller.resetProdutoError();
                                      },
                                      onTap: () => controller.resetProdutoError(),
                                      controller: controller.produto,
                                      style: const TextStyle(
                                        fontSize: 18
                                      ),
                                      decoration: InputDecoration(  
                                        border: const OutlineInputBorder(),
                                        labelText: 'Produto',
                                        errorText: controller.produtoError.value == '' ? null : controller.produtoError.value
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
                                      onChanged: (e){
                                        controller.resetDataDaCompraError();
                                      },
                                      onTap: () => controller.resetDataDaCompraError(),
                                      controller: controller.dataDaCompra,
                                      inputFormatters: [
                                        Mask.date()
                                      ],
                                      style: const TextStyle(
                                        fontSize: 18
                                      ),
                                      decoration: InputDecoration(  
                                        border: const OutlineInputBorder(),
                                        labelText: 'Data da Compra',
                                        errorText: controller.dataDaCompraError.value == '' ? null : controller.dataDaCompraError.value
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
                                      onChanged: (e){
                                        controller.resetNotaFiscalError();
                                      },
                                      onTap: () => controller.resetNotaFiscalError(),
                                      controller: controller.notaFiscal,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        Mask.generic(masks: ['#########'])
                                      ],
                                      style: const TextStyle(
                                        fontSize: 18
                                      ),
                                      decoration: InputDecoration(  
                                        border: const OutlineInputBorder(),
                                        labelText: 'Nota Fiscal',
                                        errorText: controller.notaFiscalError.value == '' ? null : controller.notaFiscalError.value
                                      ),
                                    ),
                                  ),
                                ),
                                //Origem Compra
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                                    child: DropdownSearch<String>(
                                        popupProps: const PopupProps.menu(
                                            showSelectedItems: true,
                                            showSearchBox: true,
                                        ),
                                        dropdownDecoratorProps : DropDownDecoratorProps(
                                          dropdownSearchDecoration: InputDecoration (
                                            border: const OutlineInputBorder(),
                                            labelText: 'Origem da Compra',
                                            errorText: controller.origemDaCompraError.value == '' ? null : controller.origemDaCompraError.value,
                                            labelStyle: const TextStyle(
                                              fontSize: 18
                                            )
                                          )
                                        ),
                                        items: ctxt.origemDaCompra.map<String>((element) => element).toList(),
                                        onChanged: (e){
                                          controller.setOrigemDaCompra(e);
                                          controller.resetOrigemDaCompraError();
                                        },
                                    ),
                                  ),
                                ),
                                //Representante
                                controller.tipoCliente.value == 'B2B' ?
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                                    child: TextField(
                                      onChanged: (e){
                                      },
                                      onTap: () {},
                                      controller: controller.representante,
                                      style: const TextStyle(
                                        fontSize: 18
                                      ),
                                      decoration: const InputDecoration(  
                                        border: OutlineInputBorder(),
                                        labelText: 'Representante',
                                        //errorText: controller.userError.value == '' ? null : controller.userError.value
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
                                    child: DropdownSearch<String>(
                                        popupProps: const PopupProps.menu(
                                            showSelectedItems: true,
                                            showSearchBox: true,
                                        ),
                                        dropdownDecoratorProps : DropDownDecoratorProps(
                                          dropdownSearchDecoration: InputDecoration (
                                            border: const OutlineInputBorder(),
                                            labelText: 'Tipo da Ocorrência',
                                            errorText: controller.tipoOcorrenciaError.value == '' ? null : controller.tipoOcorrenciaError.value,
                                            labelStyle: const TextStyle(
                                              fontSize: 18
                                            )
                                          )
                                        ),
                                        items: ctxt.tipoOcorrencia,
                                        onChanged: (e) {
                                          controller.setTipoOcorrencia(e);
                                          controller.resetTipoOcorrenciaError();
                                        },
                                    ),
                                  ),
                                ),
                                //Descrição Ocorrencia
                                Flexible(
                                  flex: 4,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                                    child: TextField(
                                      onChanged: (e){
                                        controller.resetDescOcorrenciaError();
                                      },
                                      onTap: () => controller.resetDescOcorrenciaError(),
                                      controller: controller.descOcorrencia,
                                      style: const TextStyle(
                                        fontSize: 18
                                      ),
                                      decoration: InputDecoration(  
                                        border: const OutlineInputBorder(),
                                        labelText: 'Descrição da Ocorrência',
                                        errorText: controller.descOcorrenciaError.value == '' ? null : controller.descOcorrenciaError.value
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
                                    child: DropdownButtonFormField<String>(
                                      onTap: () => controller.resetResolvidono1Error(),
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(),
                                        labelText: 'Resolvido no 1º Contato?',
                                        labelStyle: const TextStyle(
                                          fontSize: 18
                                        ),
                                        errorText: controller.resolvidono1Error.value == '' ? null : controller.resolvidono1Error.value,
                                      ),
                                      isExpanded: true,
                                      onChanged: (e) {
                                        controller.resetResolvidono1Error();
                                        controller.setResolvidono1(e);
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
                                      onTap: () => controller.resetSitaucaoError(),
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(),
                                        labelText: 'Situação',
                                        labelStyle: const TextStyle(
                                          fontSize: 18
                                        ),
                                        errorText: controller.sitaucaoError.value == '' ? null : controller.sitaucaoError.value,
                                      ),
                                      isExpanded: true,
                                      onChanged: (e) {
                                        controller.setSitaucao(e);
                                        controller.resetSitaucaoError();
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
                                      onTap: () => controller.resetVisitaTecnicaError(),
                                      decoration: InputDecoration(
                                        border: const  OutlineInputBorder(),
                                        labelText: 'Visita Técnica',
                                        labelStyle: const TextStyle(
                                          fontSize: 18
                                        ),
                                        errorText: controller.visitaTecnicaError.value == '' ? null : controller.visitaTecnicaError.value,
                                      ),
                                      isExpanded: true,
                                      onChanged: (e) {
                                        controller.setVisitaTecnica(e);
                                        controller.resetVisitaTecnicaError();
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
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                                    child: DropdownButtonFormField<String>(
                                      onTap: () => controller.resetProcedenciaError(),
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(),
                                        labelText: 'Procedência',
                                        labelStyle: const TextStyle(
                                          fontSize: 18
                                        ),
                                        errorText: controller.procedenciaError.value == '' ? null : controller.procedenciaError.value,
                                      ),
                                      isExpanded: true,
                                      onChanged: (e) {
                                        controller.setProcedencia(e);
                                        controller.resetProcedenciaError();
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
                                    child: DropdownSearch<String>(
                                        popupProps: const PopupProps.menu(
                                            showSelectedItems: true,
                                            showSearchBox: true,
                                        ),
                                        dropdownDecoratorProps : DropDownDecoratorProps(
                                          dropdownSearchDecoration: InputDecoration (
                                            border: const OutlineInputBorder(),
                                            errorText: controller.destinoAtendimentoError.value == '' ? null : controller.destinoAtendimentoError.value,
                                            labelText: 'Destino do Atendimento',
                                            labelStyle: const TextStyle(
                                              fontSize: 18
                                            )
                                          )
                                        ),
                                        items: ctxt.destinoAtendimento.map<String>((element) => element['name']).toList(),
                                        onChanged: (e) {
                                          controller.setDestinoAtendimento(e);
                                          controller.resetDestinoAtendimentoError();
                                        },
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
                                    onPressed: () => controller.send(ctxt.user,
                                    ctxt.destinoAtendimento.where((element) => element['name'] == controller.destinoAtendimento.value).toList().isNotEmpty ? 
                                    ctxt.destinoAtendimento.where((element) => element['name'] == controller.destinoAtendimento.value).toList()[0]['email'].toString(): '') , 
                                    child: const Padding(
                                      padding: EdgeInsets.only(top: 10, bottom: 10),
                                      child: Text(
                                        'Enviar',
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
                                    onPressed: () => controller.cancel(), 
                                    child: const Padding(
                                      padding: EdgeInsets.only(top: 10, bottom: 10),
                                      child: Text(
                                        'Cancelar',
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