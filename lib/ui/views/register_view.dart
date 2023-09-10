import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

import 'package:admin_dashboard/providers/providers.dart';
import 'package:admin_dashboard/ui/buttons/buttons.dart';
import 'package:admin_dashboard/ui/inputs/inputs.dart';
import 'package:admin_dashboard/routes/routes_barrel.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: Builder(
        builder: (context) {

          final registerFormProvider = Provider.of<RegisterFormProvider>(context, listen: false);

          return Container(
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 370),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: registerFormProvider.formKey,
                  child: Column(
                    children: [
                    
                      TextFormField(
                        validator: (value) {
                          if(value == null || value.isEmpty) return 'El nombre es obligatorio';
                          return null;
                        },
                        onChanged: (value) => registerFormProvider.name = value,
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                          hint: 'Ingrese su nombre y apellido',
                          label: 'Nombre',
                          icon: Icons.email_outlined
                        ),
                      ),

                      const SizedBox(height: 20),

                      TextFormField(
                        validator: (value) {
                          if(!EmailValidator.validate(value ?? '')) return 'eMail no válido';
                          return null;
                        },
                        onChanged: (value) => registerFormProvider.email = value,
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
                        onChanged: (value) => registerFormProvider.password = value,
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
                          registerFormProvider.validateForm();
                        }, 
                        text: 'Crear cuenta'
                      ),

                      const SizedBox(height: 20),
                      LinkText(
                        text: 'Ya tengo una cuenta',
                        onPressed: () => Navigator.pushNamed(context, Flurorouter.loginRoute)
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