import 'package:get/get.dart';

class DataContext extends GetxController {
  Map<String, dynamic> user = {
    'id':'',
    'name': ''
  };
  var tipoCliente = <String>[];
  var marca = <String>[];
  var origemDaCompra = <String>[];
  var representante = <String>[];
  var origemOcorrencia = <String>[];
  var tipoOcorrencia = <String>[];
  var destinoAtendimento = <Map>[];

  void setData(
    Map<String, dynamic> user,
    List<String> tipoCliente, 
    List<String> marca, 
    List<String> origemDaCompra,
    List<String> origemOcorrencia,
    List<String> tipoOcorrencia,
    List<Map> destinoAtendimento
  ) {
    this.user = user;
    this.tipoCliente.addAll(tipoCliente);
    this.marca.addAll(marca);
    this.origemDaCompra.addAll(origemDaCompra);
    this.origemOcorrencia.addAll(origemOcorrencia);
    this.tipoOcorrencia.addAll(tipoOcorrencia);
    this.destinoAtendimento.addAll(destinoAtendimento);
  }

  void cleanData () {
  user = {
    'id':'',
    'name': ''
  };
  tipoCliente = <String>[];
  marca = <String>[];
  origemDaCompra = <String>[];
  representante = <String>[];
  origemOcorrencia = <String> [];
  tipoOcorrencia = <String>[];
  destinoAtendimento = <Map>[];
  }
}