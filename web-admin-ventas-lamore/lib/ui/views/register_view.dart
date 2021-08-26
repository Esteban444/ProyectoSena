import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( _ ) => RegisterFormProvider(),
      child: Builder(builder: (context) {

        final registerFormProvider = Provider.of<RegisterFormProvider>(context, listen: false);

        return Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.symmetric( horizontal: 10 ),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints( maxWidth: 370 ),
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: registerFormProvider.formKey,
                child: Column(
                  children: [

                    // Email
                    TextFormField(
                      onChanged: ( value ) => registerFormProvider.name = value,
                      validator: ( value ) {
                        if ( value == null || value.isEmpty ) return 'El nombre es obligatario';
                        return null;
                      },
                      style: TextStyle( color: Colors.white ),
                      decoration: CustomInputs.loginInputDecoration(
                        hint: 'Ingrese su nombre',
                        label: 'Nombre completo',
                        icon: Icons.supervised_user_circle_sharp
                      ),
                    ),

                    SizedBox( height: 10 ),
                    
                    // Email
                    TextFormField(
                      onChanged: ( value ) => registerFormProvider.email = value,
                      validator: ( value ) {
                        if( !EmailValidator.validate(value ?? '') ) return 'Email no válido';
                        return null;
                      },
                      style: TextStyle( color: Colors.white ),
                      decoration: CustomInputs.loginInputDecoration(
                        hint: 'Ingrese su email',
                        label: 'Email',
                        icon: Icons.email_outlined
                      ),
                    ),

                    SizedBox( height: 10 ),

                    TextFormField(
                      onChanged: ( value ) => registerFormProvider.username = value,
                      validator: ( value ) {
                        if ( value == null || value.isEmpty ) return 'El nombre de usuario es obligatario';
                        return null;
                      },
                      style: TextStyle( color: Colors.white ),
                      decoration: CustomInputs.loginInputDecoration(
                        hint: 'Ingrese su nmobre de usuario',
                        label: 'Nombre Usuario',
                        icon: Icons.person
                      ),
                    ),

                    SizedBox( height: 10 ),

                    // Password
                    TextFormField(
                      onChanged: ( value ) => registerFormProvider.password = value,
                      validator: ( value ) {
                        if ( value == null || value.isEmpty ) return 'Ingrese su contraseña';
                        if ( value.length < 6 ) return 'La contraseña debe de ser de 6 caracteres';

                        return null; // Válido
                      },
                      obscureText: true,
                      style: TextStyle( color: Colors.white ),
                      decoration: CustomInputs.loginInputDecoration(
                        hint: '*********',
                        label: 'Contraseña',
                        icon: Icons.lock_outline_rounded
                      ),
                    ),
                    
                    SizedBox( height: 10 ),

                     TextFormField(
                      onChanged: ( value ) => registerFormProvider.confirmarcontrasena = value,
                      validator: ( value ) {
                        if ( value == null || value.isEmpty ) return 'Confirme su contraseña';
                        if ( value.length < 6 ) return 'La contraseña debe de ser de mas de 6 caracteres, tener mayusculas, minusculas y numeros';

                        return null; // Válido
                      },
                      obscureText: true,
                      style: TextStyle( color: Colors.white ),
                      decoration: CustomInputs.loginInputDecoration(
                        hint: '*********',
                        label: 'Confirmar Contraseña',
                        icon: Icons.lock_outline_rounded
                      ),
                    ),

                    SizedBox( height: 10 ),

                    CustomOutlinedButton(
                      onPressed: () {

                        registerFormProvider.validateForm();

                      }, 
                      text: 'Crear cuenta',
                    ),


                    SizedBox( height: 10 ),
                    LinkText(
                      text: 'Ir al login',
                      onPressed: () {
                        Navigator.pushNamed(context, Flurorouter.loginRoute );
                      },
                    )

                  ],
                )
              ),
            ),
          ),
        );

      }),
    );
  }

  
}