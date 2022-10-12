import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/pages/auth/register/presenter/register_presenter.dart';
import 'package:fwc_album_app/app/pages/auth/register/view/register_view_impl.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  final RegisterPresenter presenter;

  const RegisterPage({
    super.key,
    required this.presenter,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends RegisterViewImpl {
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final confirmPasswordEC = TextEditingController();

  @override
  void dispose() {
    nameEC.dispose();
    emailEC.dispose();
    passwordEC.dispose();
    confirmPasswordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // alinhar ao centro
            children: [
// *            SEPARADOR
              const SizedBox(
                height: 20,
              ),
// *            LOGO
              Container(
                height: 106.82,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bola.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
// *            SEPARADOR
              const SizedBox(
                height: 50,
              ),
// *            TEXT DE LOGIN
              Text(
                'Cadastrar Usuário',
                style: context.textStyles.titleBlack,
              ),
// *            SEPARADOR
              const SizedBox(
                height: 30,
              ),
// *            AGRUPADOR DOS INPUTS
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
// *            INPUT DE NOME
                    TextFormField(
                      controller: nameEC,
                      decoration: const InputDecoration(
                        label: Text('Nome Completo *'),
                      ),
                      validator: Validatorless.required('Obrigatório'),
                    ),
// *            SEPARADOR
                    const SizedBox(
                      height: 20,
                    ),
// *            INPUT DE EMAIL
                    TextFormField(
                      controller: emailEC,
                      decoration: const InputDecoration(
                        label: Text('Email *'),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required('Obrigatório'),
                        Validatorless.email('E-mail inválido'),
                      ]),
                    ),
// *            SEPARADOR
                    const SizedBox(
                      height: 20,
                    ),
// *            INPUT DE SENHA
                    TextFormField(
                      controller: passwordEC,
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Text('Senha *'),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required('Obrigatório'),
                        Validatorless.min(
                            6, 'A senha deve conter pelo menos 6 caracteres'),
                      ]),
                    ),
// *            SEPARADOR
                    const SizedBox(
                      height: 20,
                    ),
// *            INPUT DE CONFIRMAR SENHA
                    TextFormField(
                      controller: confirmPasswordEC,
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Text('Confirmar Senha *'),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required('Obrigatório'),
                        Validatorless.min(
                            6, 'A senha deve conter pelo menos 6 caracteres'),
                        Validatorless.compare(
                            passwordEC, 'Senha diferente de confirmação'),
                      ]),
                    ),
// *            SEPARADOR
                    const SizedBox(
                      height: 20,
                    ),
// *            BOTÃO DE CADASTRAR
                    Button.primary(
                        onPressed: () {
                          showLoader();
                          final formValid =
                              formKey.currentState?.validate() ?? false;
                          if (formValid) {
                            widget.presenter.register(
                              name: nameEC.text,
                              email: emailEC.text,
                              password: passwordEC.text,
                              confirmPassword: confirmPasswordEC.text,
                            );
                          }
                        },
                        width: MediaQuery.of(context).size.width * .9,
                        label: 'Cadastrar'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
