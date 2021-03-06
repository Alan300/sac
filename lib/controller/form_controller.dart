import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../screen/home_screen.dart';
import '../screen/specific_screen.dart';
import '../context/database.dart';
import 'package:mysql_utils/mysql_utils.dart';
import 'package:ntp/ntp.dart';

class FormController extends GetxController {

  var cpf = true.obs;
  var loading = false.obs;
  var tipoCliente = ''.obs;
  var idCliente = TextEditingController();
  var nomeCliente = TextEditingController();
  var enderecoCliente = TextEditingController();
  var telefoneFixo = TextEditingController();
  var telefoneCelular =TextEditingController();
  var email =TextEditingController();
  var marca =''.obs;
  var produto =TextEditingController();
  var dataDaCompra =TextEditingController();
  var notaFiscal =TextEditingController();
  var origemDaCompra = ''.obs;
  var representante = TextEditingController();
  var origemOcorrencia = ''.obs;
  var tipoOcorrencia = ''.obs;
  var descOcorrencia =TextEditingController();
  var resolvidono1 = ''.obs;
  var sitaucao = ''.obs;
  var visitaTecnica = ''.obs;
  var procedencia = ''.obs;
  var destinoAtendimento = ''.obs;
  var isCheck = true.obs;
  //Errors
  var tipoClienteError = ''.obs;
  var idClienteError = ''.obs;
  var nomeClienteError = ''.obs;
  var enderecoClienteError = ''.obs;
  var telefoneFixoError = ''.obs;
  var telefoneCelularError = ''.obs;
  var emailError = ''.obs;
  var marcaError = ''.obs;
  var produtoError = ''.obs;
  var dataDaCompraError = ''.obs;
  var notaFiscalError = ''.obs;
  var origemDaCompraError = ''.obs;
  var origemOcorrenciaError = ''.obs;
  var tipoOcorrenciaError = ''.obs;
  var descOcorrenciaError = ''.obs;
  var resolvidono1Error = ''.obs;
  var sitaucaoError = ''.obs;
  var visitaTecnicaError = ''.obs;
  var procedenciaError = ''.obs;
  var destinoAtendimentoError = ''.obs;


  void setTipoCliente(String? value) => tipoCliente.value = value??'';
  void setMarca(String? value) => marca.value = value??'';
  void setOrigemDaCompra(String? value) => origemDaCompra.value = value??'';
  void setOrigemOcorrencia(String? value) => origemOcorrencia.value = value??'';
  void setTipoOcorrencia(String? value) => tipoOcorrencia.value = value??'';
  void setResolvidono1(String? value) => resolvidono1.value = value??'';
  void setSitaucao(String? value) => sitaucao.value = value??'';
  void setVisitaTecnica(String? value) => visitaTecnica.value = value??'';
  void setProcedencia(String? value) => procedencia.value = value??'';
  void setDestinoAtendimento(String? value) => destinoAtendimento.value = value??'';
  //Errors
  void resetTipoClienteError() => tipoClienteError.value = '';
  void resetIdClienteError() => idClienteError.value = '';
  void resetnomeClienteError() => nomeClienteError.value = '';
  void resetEnderecoClienteError() => enderecoClienteError.value = '';
  void resetTelefoneFixoError() => telefoneFixoError.value = '';
  void resetTelefoneCelularError() => telefoneCelularError.value = '';
  void resetEmailError() => emailError.value = '';
  void resetMarcaError()=> marcaError.value = '';
  void resetProdutoError()=> produtoError.value = '';
  void resetDataDaCompraError()=> dataDaCompraError.value = '';
  void resetNotaFiscalError() => notaFiscalError.value = '';
  void resetOrigemDaCompraError() => origemDaCompraError.value = '';
  void resetOrigemOcorrenciaError() => origemOcorrenciaError.value = '';
  void resetTipoOcorrenciaError() => tipoOcorrenciaError.value = '';
  void resetDescOcorrenciaError() => descOcorrenciaError.value = '';
  void resetResolvidono1Error() => resolvidono1Error.value = '';
  void resetSitaucaoError() => sitaucaoError.value = '';
  void resetVisitaTecnicaError() => visitaTecnicaError.value = '';
  void resetProcedenciaError() => procedenciaError.value = '';
  void resetDestinoAtendimentoError() => destinoAtendimentoError.value = ''; 

  void send(Map<String,dynamic> user, String emailDestiny) async {
    loading.value = true;
    if(tipoCliente.value == '') {
      tipoClienteError.value = 'Selecione o tipo de cliente.';
      isCheck.value = false;
    }

    if(idCliente.text.length != 14 && idCliente.text.length != 18) {
      idClienteError.value = 'Digite um cpf/cnpj v??lido.';
      isCheck.value = false;
    }


    if(nomeCliente.text.length < 5) {
      nomeClienteError.value = 'Digite uma raz??o social v??lida.';
      isCheck.value = false;
    }

    if(enderecoCliente.text.length < 5) {
      enderecoClienteError.value = 'Digite um endere??o v??lido.';
      isCheck.value = false;
    }

    if(telefoneFixo.text.isNotEmpty && telefoneFixo.text.length != 14) {
      telefoneFixoError.value = 'Digite um telefone v??lido.';
      isCheck.value = false;
    }

    if(telefoneCelular.text.length != 14 && telefoneCelular.text.length != 15) {
      telefoneCelularError.value = 'Digite um celular v??lido.';
      isCheck.value = false;
    }

    if(email.text.length < 7) {
      emailError.value = 'Digite um e-mail v??lido.';
      isCheck.value = false;
    }

    if(marca.value == '') {
      marcaError.value = 'Selecione a marca.';
      isCheck.value = false;
    }

    if(produto.text.length < 5) {
      produtoError.value = 'Digite um produto v??lido.';
      isCheck.value = false;
    }

    if(dataDaCompra.text.length != 10) {
      dataDaCompraError.value = 'Digite uma data v??lida.';
      isCheck.value = false;
    }

    if(notaFiscal.text.length < 7) {
      notaFiscalError.value = 'Digite uma nota fiscal v??lida.';
      isCheck.value = false;
    }

    if(origemDaCompra.value == '') {
      origemDaCompraError.value = 'Selecione a origem da compra.';
      isCheck.value = false;
    }

    if(origemOcorrencia.value == '') {
      origemOcorrenciaError.value = 'Selecione a origem da ocorr??ncia.';
      isCheck.value = false;
    }

    if(tipoOcorrencia.value == '') {
      tipoOcorrenciaError.value = 'Selecione o tipo da ocorr??ncia.';
      isCheck.value = false;
    }

    if(descOcorrencia.text.length < 7) {
      descOcorrenciaError.value = 'Digite uma descri????o v??lida.';
      isCheck.value = false;
    }

    if(resolvidono1.value == '') {
      resolvidono1Error.value = 'Selecione uma op????o.';
      isCheck.value = false;
    }

    if(sitaucao.value == '') {
      sitaucaoError.value = 'Selecione uma situa????o.';
      isCheck.value = false;
    }

    if(visitaTecnica.value == '') {
      visitaTecnicaError.value = 'Selecione uma op????o.';
      isCheck.value = false;
    }

    if(procedencia.value == '') {
      procedenciaError.value = 'Selecione uma op????o.';
      isCheck.value = false;
    }

    if(destinoAtendimento.value == '') {
      destinoAtendimentoError.value = 'Selecione um destino.';
      isCheck.value = false;
    }

    if(isCheck.value) {
      DateTime openingDate = await NTP.now();
      Map<String, dynamic> obj = {
        'opening_date': openingDate,
        'user_id' : user['id'],
        'user_name': user['name'],
        'client_type': tipoCliente.value,
        'client_id': idCliente.text,
        'client_name': nomeCliente.text,
        'client_adress': enderecoCliente.text,
        'telephone': telefoneFixo.text,
        'cellphone': telefoneCelular.text,
        'email': email.text,
        'brand': marca.value,
        'product': produto.text,
        'purchase_date': dataDaCompra.text,
        'invoice': notaFiscal.text,
        'purchase_origin':origemDaCompra.value,
        'representative':representante.text,
        'occurrence_origin': origemOcorrencia.value,
        'occurrence_type': tipoOcorrencia.value,
        'occurrence_desc':descOcorrencia.text,
        'solve_frist_contact':resolvidono1.value ,
        'situation':sitaucao.value,
        'technical_visit':visitaTecnica.value ,
        'origin':procedencia.value,
        'destiny_name': destinoAtendimento.value,
        'destiny_email': emailDestiny 
      };
      final  db = MysqlUtils(settings: DataBase.settings);
      int value = await db.insert(
        table: 'form', 
        insertData: obj
      );
      obj['protocol'] = value;
      await db.insert(
        table: 'log_form', 
        insertData: {
          'protocol': value,
          'date_change': obj['opening_date'],
          'user_name': obj['user_name'] ,
          'occurrence_desc': obj['occurrence_desc'] ,
          'solve_frist_contact': obj['solve_frist_contact']  ,
          'situation': obj['situation']  ,
          'technical_visit': obj['technical_visit']  , 
          'origin': obj['origin']  
        }
      );
      Get.offAll(SpecificScreen(obj, true));
      Get.defaultDialog(
        title: 'Sucesso',
        middleText: 'Ocorr??ncia Cadastrada.\nProtocolo: $value',
        confirm: ElevatedButton(
          onPressed: (){
            Get.back();
          }, 
          child: const Text('Ok')
        ),
      );
      db.close();
    } else {
      isCheck.value = true;
      loading.value = false;
    }
  }

  void cancel() async {
    Get.defaultDialog(
      title: 'Aten????o',
      middleText: 'Voc?? realmente deseja cancelar?',
      cancel: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.red
        ),
        onPressed: (){
          Get.back();
        }, 
        child: const Text('N??o')
      ),
      confirm: ElevatedButton(
        onPressed: (){
          Get.offAll(HomeScreen());
        }, 
        child: const Text('Sim')
      ),
    );
  }
}