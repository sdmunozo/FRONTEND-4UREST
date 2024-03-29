import 'package:dasha/providers/auth_provider.dart';
import 'package:dasha/providers/login_form_provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:dasha/router/router.dart';
import 'package:dasha/ui/inputs/custom_inputs.dart';
import 'package:dasha/ui/buttons/custom_outlined_button.dart';
import 'package:dasha/ui/buttons/link_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return ChangeNotifierProvider(
        create: (_) => LoginFormProvider(),
        child: Builder(builder: (context) {
          final loginFormProvider =
              Provider.of<LoginFormProvider>(context, listen: false);

          // Inicializar los valores del formulario
          loginFormProvider.email = 'fruterialaunicasistemas@gmail.com';
          loginFormProvider.password = 'Mexico123!';

          return Container(
            color: Colors.black,
            margin: EdgeInsets.only(top: 100),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 370),
                child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: loginFormProvider.formKey,
                    child: Column(
                      children: [
                        // Email
                        TextFormField(
                          onFieldSubmitted: (_) =>
                              onFormSubmit(loginFormProvider, authProvider),
                          validator: (value) {
                            if (!EmailValidator.validate(value ?? ''))
                              return 'Email no válido';

                            return null;
                          },
                          onChanged: (value) => loginFormProvider.email = value,
                          initialValue: loginFormProvider
                              .email, // TODO: solo en desarroll, ELIMINAR
                          style: TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Ingrese su correo',
                              label: 'Email',
                              icon: Icons.email_outlined),
                        ),

                        SizedBox(height: 20),

                        // Password
                        TextFormField(
                          onFieldSubmitted: (_) =>
                              onFormSubmit(loginFormProvider, authProvider),
                          onChanged: (value) =>
                              loginFormProvider.password = value,
                          initialValue: loginFormProvider
                              .password, // TODO: solo en desarroll, ELIMINAR
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Ingrese su contraseña';
                            if (value.length < 6)
                              return 'La contraseña debe de ser de 6 caracteres';

                            return null; // Válido
                          },
                          obscureText: true,
                          style: TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                              hint: '*********',
                              label: 'Contraseña',
                              icon: Icons.lock_outline_rounded),
                        ),

                        SizedBox(height: 20),
                        CustomOutlinedButton(
                          onPressed: () =>
                              onFormSubmit(loginFormProvider, authProvider),
                          text: 'Ingresar',
                        ),

                        SizedBox(height: 20),
                        LinkText(
                          text: 'Nueva cuenta',
                          onPressed: () {
                            Navigator.pushNamed(
                                context, Flurorouter.registerRoute);
                          },
                        )
                      ],
                    )),
              ),
            ),
          );
        }));
  }

  void onFormSubmit(
      LoginFormProvider loginFormProvider, AuthProvider authProvider) {
    final isValid = loginFormProvider.validateForm();
    if (isValid)
      authProvider.login(loginFormProvider.email, loginFormProvider.password);
  }
}
