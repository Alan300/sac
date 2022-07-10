import 'package:flutter/material.dart';

class FormCard extends StatelessWidget {

  final GestureTapCallback? onTap;
  final List<String> title;

  
  const FormCard({
    Key? key,
    this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color:  const Color(0xFF18A2D0),
      child: ListTile(
        onTap: onTap,
        title: Text(
          'Data da Compra: ${title[0].toString()}\nNota Fiscal: ${title[1].toString()}\nProduto: ${title[2].toString().length >= 20 ? '${title[2].toString().substring(0,20)}...' : title[2].toString()}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
        ),
      ),
    );
  }
}