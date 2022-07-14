import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../context/data_context.dart';
import '../controller/login_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final controller = LoginController();
  
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
                                'Login',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff17a2d0)
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10),
                              child: TextField(
                                onTap: () => controller.resetUserError(),
                                controller: controller.user,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                style: const TextStyle(
                                  fontSize: 18
                                ),
                                decoration: InputDecoration(  
                                  border: const OutlineInputBorder(),
                                  labelText: 'Matrícula',
                                  prefixIcon: const Icon(
                                    Icons.person
                                  ),
                                  errorText: controller.userError.value == '' ? null : controller.userError.value
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 15),
                              child: TextField(
                                onSubmitted: (_) => controller.logIn(ctxt.setData),
                                onTap: () => controller.resetPassworError(),
                                controller: controller.password,
                                obscureText: controller.obscurePassword.value,
                                style: const TextStyle(
                                  fontSize: 18
                                ),
                                decoration: InputDecoration(  
                                  border: const OutlineInputBorder(),
                                  labelText: 'Senha',
                                  prefixIcon: const Icon(
                                    Icons.lock
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () => controller.setObscurePassword(), 
                                    icon: Icon(
                                      controller.obscurePassword.value ? Icons.visibility_off : Icons.visibility
                                    )
                                  ),
                                  errorText: controller.passwordError.value == '' ? null : controller.passwordError.value
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: ElevatedButton(
                                onPressed: () => controller.logIn(ctxt.setData), 
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  child: Text(
                                    'Entrar',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 25
                                    ),
                                  ),
                                )
                              )
                            ),
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