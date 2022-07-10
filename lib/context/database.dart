import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mysql_utils/mysql_utils.dart';

class DataBase extends GetxController {
  late MysqlUtils db;
  late bool isConnect = true;
  DataBase() {
    conn();
  }
  void conn() async {
     db = MysqlUtils (
      settings: {
        'host': 'localhost',
        'port': 3306,
        'user': 'root',
        'password': '1234',
        'db': 'sacassaabloy',
        'maxConnections': 10,
        'secure': false,
        'prefix': '',
        'pool': false,
        'collation': 'utf8mb4_general_ci',
      },
      errorLog: (error) {
        isConnect = false;
      },
      sqlLog: (sql) {

      },
      connectInit: (db1) async {
      
      },
    );
    await db.isConnectionAlive();
  }
}
