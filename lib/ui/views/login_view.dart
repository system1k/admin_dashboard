import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/buttons/buttons.dart';
import 'package:admin_dashboard/ui/inputs/inputs.dart';
import 'package:admin_dashboard/routes/routes_barrel.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 370),
          child: Form(
            child: Column(
              children: [

                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: CustomInputs.loginInputDecoration(
                    hint: 'Ingrese su correo',
                    label: 'eMail',
                    icon: Icons.email_outlined
                  ),
                ),

                const SizedBox(height: 20),

                TextFormField(
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
                  onPressed: (){}, 
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
}