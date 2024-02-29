import 'package:dasha/providers/auth_provider.dart';
import 'package:dasha/providers/register_form_provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:dasha/router/router.dart';

import 'package:dasha/ui/inputs/custom_inputs.dart';
import 'package:dasha/ui/buttons/custom_outlined_button.dart';
import 'package:dasha/ui/buttons/link_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: Builder(builder: (context) {
        final screenWidth = MediaQuery.of(context).size.width;
        final registerFormProvider =
            Provider.of<RegisterFormProvider>(context, listen: false);

        return Container(
          color: Colors.black,
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 370),
            child: SingleChildScrollView(
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: registerFormProvider.formKey,
                child: Column(
                  children: [
              // Nombre de la marca
              TextFormField(
                onChanged: (value) => registerFormProvider.brand = value,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'El nombre de la Empresa/Marca es obligatorio';
                  if (value.length < 2 || value.length > 50) return 'El nombre de la Empresa/Marca debe tener entre 2 y 50 caracteres';
                  return null;
                },
                style: TextStyle(color: Colors.white),
                decoration: CustomInputs.loginInputDecoration(
                  hint: 'Ingrese el nombre de su empresa o marca',
                  label: 'Empresa o Marca',
                  icon: Icons.store,
                ),
              ),

          
              SizedBox( height: 20 ),
          
              // Nombre de la sucursal
              TextFormField(
                onChanged: (value) => registerFormProvider.branch = value,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'El nombre de la Sucursal es obligatorio';
                  if (value.length < 2 || value.length > 50) return 'El nombre de la Sucursal debe tener entre 2 y 50 caracteres';
                  return null;
                },
                style: TextStyle(color: Colors.white),
                decoration: CustomInputs.loginInputDecoration(
                  hint: 'Ingrese el nombre de su sucursal',
                  label: 'Sucursal',
                  icon: Icons.location_on,
                ),
              ),

          
              SizedBox( height: 20 ),
          
              if (screenWidth > 1000) 
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                      onChanged: (value) => registerFormProvider.firstName = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'El nombre es obligatorio';
                        if (value.length < 2 || value.length > 50) return 'Entre 2 y 50 caracteres';
                        return null;
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: CustomInputs.loginInputDecoration(
                        hint: 'Ingrese su(s) nombre(s)',
                        label: 'Nombre(s)',
                        icon: Icons.account_circle,
                      ),
                    ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                      onChanged: (value) => registerFormProvider.lastName = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'El apellido es obligatorio';
                        if (value.length < 2 || value.length > 50) return 'Entre 2 y 50 caracteres';
                        return null;
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: CustomInputs.loginInputDecoration(
                        hint: 'Ingrese su(s) apellido(s)',
                        label: 'Apellido(s)',
                        icon: Icons.recent_actors,
                      ),
                    ),

                    ),
                  ],
                )
              else ...[
                TextFormField(
                  onChanged: (value) => registerFormProvider.firstName = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'El nombre es obligatorio';
                    if (value.length < 2 || value.length > 50) return 'El nombre debe tener entre 2 y 50 caracteres';
                    return null;
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: CustomInputs.loginInputDecoration(
                    hint: 'Ingrese su(s) nombre(s)',
                    label: 'Nombre(s)',
                    icon: Icons.account_circle,
                  ),
                ),

                SizedBox(height: 20),
                TextFormField(
                onChanged: (value) => registerFormProvider.lastName = value,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'El apellido es obligatorio';
                  if (value.length < 2 || value.length > 50) return 'El apellido debe tener entre 2 y 50 caracteres';
                  return null;
                },
                style: TextStyle(color: Colors.white),
                decoration: CustomInputs.loginInputDecoration(
                  hint: 'Ingrese su(s) apellido(s)',
                  label: 'Apellido(s)',
                  icon: Icons.recent_actors,
                ),
              ),

              ],
                  
                  SizedBox(height: 20),
          
                  // Email
                  TextFormField(
                    onChanged: ( value ) => registerFormProvider.email = value,
                    validator: ( value ) {
                      if( !EmailValidator.validate(value ?? '') ) return 'Email no válido';
                      return null;
                    },
                    style: TextStyle( color: Colors.white ),
                    decoration: CustomInputs.loginInputDecoration(
                      hint: 'Ingrese su correo',
                      label: 'Email',
                      icon: Icons.email_outlined
                    ),
                  ),
          
                  SizedBox( height: 20 ),
                  TextFormField(
                    onChanged: (value) => registerFormProvider.password = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Ingrese su contraseña';

                      String message = "";
                      bool hasMinLength = value.length >= 6;
                      bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
                      bool hasLowercase = value.contains(RegExp(r'[a-z]'));
                      bool hasDigit = value.contains(RegExp(r'[0-9]'));

                      if (!hasMinLength) message += 'Debe tener al menos 6 caracteres.\n';
                      if (!hasUppercase) message += 'Incluir al menos una letra mayúscula.\n';
                      if (!hasLowercase) message += 'Incluir al menos una letra minúscula.\n';
                      if (!hasDigit) message += 'Incluir al menos un dígito.';

                      // Si algún criterio no se cumple, devuelve el mensaje acumulado. De lo contrario, devuelve nulo.
                      return message.isNotEmpty ? message : null;
                    },
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: CustomInputs.loginInputDecoration(
                      hint: '*********',
                      label: 'Contraseña',
                      icon: Icons.lock_outline_rounded,
                    ),
                  ),
                  
                  SizedBox( height: 20 ),
                  CustomOutlinedButton(
                    onPressed: () {
          
                      final validForm = registerFormProvider.validateForm();
                      
                      if ( !validForm ) return;
          
                      final authProvider = Provider.of<AuthProvider>(context, listen: false);
                      authProvider.register(
                        registerFormProvider.brand,
                        registerFormProvider.branch,
                        registerFormProvider.firstName,
                        registerFormProvider.lastName,
                        registerFormProvider.email, 
                        registerFormProvider.password
                      ); 
          
                    }, 
                    text: 'Crear cuenta',
                  ),
          
          
                  SizedBox( height: 20 ),
                  LinkText(
                    text: 'Ir al login',
                    onPressed: () {
                      Navigator.pushNamed(context, Flurorouter.loginRoute );
                    },
                  ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
