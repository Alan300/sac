import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {

  final GestureTapCallback? onTap;
  final IconData? icon;
  final String title;
  final bool enabled;
  
  const MainCard({
    Key? key,
    this.onTap,
    this.icon,
    required this.enabled,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (enabled) {
      return Card(
        color: title == 'Sair' ? Colors.red : const Color(0xFF18A2D0),
        child: ListTile(
          enabled: enabled,
          onTap: onTap,
          leading: icon != null ? Icon(
            icon,
            size: 30,
            color: Colors.white,
          ) : null,
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}