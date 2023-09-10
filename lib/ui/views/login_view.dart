import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

import 'package:admin_dashboard/providers/providers.dart';
import 'package:admin_dashboard/ui/buttons/buttons.dart';
import 'package:admin_dashboard/ui/inputs/inputs.dart';
import 'package:admin_dashboard/routes/routes_barrel.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context);

    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: Builder(
        builder: (context) {

          final loginFormProvider = Provider.of<LoginFormProvider>(context, listen: false);

          return Container(
            margin: const EdgeInsets.only(top: 100),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 370),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: loginFormProvider.formKey,
                  child: Column(
                    children: [
                    
                      TextFormField(
                        validator: (value) {
                          if(!EmailValidator.validate(value ?? '')) return 'eMail no válido';
                          return null;
                        },
                        onChanged: (value) => loginFormProvider.email = value,
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                          hint: 'Ingrese su correo',
                          label: 'eMail',
                          icon: Icons.email_outlined
                        ),
                      ),

                      const SizedBox(height: 20),

                      TextFormField(
                        validator: (value) {
                          if(value == null || value.isEmpty) return 'Ingrese su contraseña';
                          if(value.length < 8) return 'La contraseña debe tener minimo 8 caracteres';
                          return null;
                        },
                        onChanged: (value) => loginFormProvider.password = value,
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                          hint: '******',
                          label: 'Contraseña',
                          icon: Icons.lock_outline_rounded
                        ),
                      ),

                      const SizedBox(height: 20),
                      CustomOutlinedButtons(
                        onPressed: (){
                          final isValid = loginFormProvider.validateForm();
                          if(isValid)
                            // ignore: curly_braces_in_flow_control_structures
                            authProvider.login(loginFormProvider.email, loginFormProvider.password);
                        }, 
                        text: 'Ingresar'
                      ),

                      const SizedBox(height: 20),
                      LinkText(
                        text: 'Nueva cuenta',
                        onPressed: () => Navigator.pushNamed(context, Flurorouter.registerRoute)
                      )

                    ],
                  ),
                ),
              )
            ),
          );
        }
      )
    );
  }
}