import 'package:app/res/components/auth_button.dart';
import 'package:app/utils/routes/routes_name.dart';
import 'package:app/utils/routes/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/auth_viewmodel.dart';

class Sginupview extends StatefulWidget {
  const Sginupview({super.key});

  @override
  State<Sginupview> createState() => _SginupviewState();
}

class _SginupviewState extends State<Sginupview> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFoucsNode = FocusNode();
  FocusNode passwordFoucsNode = FocusNode();
  FocusNode sumbitFoucsNode = FocusNode();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordFoucsNode.dispose();
    emailFoucsNode.dispose();
    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewmodel = Provider.of<AuthViewmodel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              focusNode: emailFoucsNode,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: "Email",
                  label: Text("Email"),
                  prefix: Icon(Icons.alternate_email)),
              onFieldSubmitted: (value) {
                Utils.fieldFoucsChange(
                    context, emailFoucsNode, passwordFoucsNode);
              },
            ),
            SizedBox(height: height * 0.1),
            ValueListenableBuilder(
              valueListenable: _obsecurePassword,
              builder: (context, value, child) {
                return TextFormField(
                  controller: passwordController,
                  focusNode: passwordFoucsNode,
                  obscureText: _obsecurePassword.value,
                  //  value,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    hintText: "Password",
                    label: Text("Password"),
                    prefix: Icon(Icons.lock),
                    suffixIcon: InkWell(
                        onTap: () {
                          _obsecurePassword.value = !_obsecurePassword.value;
                        },
                        child: Icon(_obsecurePassword.value
                            ? Icons.visibility_off
                            : Icons.visibility)),
                  ),
                  // onFieldSubmitted: (valuw) {
                  //   Utils.fieldFoucsChange(
                  //       context, passwordFoucsNode, sumbitFoucsNode);
                  // },
                );
              },
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
            AuthButton(
              
                buttontext: "SginUp",
                loading: authViewmodel.loading,
                onPress: () {
                  if (emailController.text.isEmpty) {
                    Utils.flushBarErrorMassage(
                        "Please Enter Email First", context);
                  } else if (passwordController.text.isEmpty) {
                    Utils.flushBarErrorMassage(
                        "Please Enter Password First", context);
                  } else if (passwordController.text.length < 8) {
                    Utils.flushBarErrorMassage(
                        "Please Enter 8 digeits", context);
                  } else {
                    Map<String, String> headr = {"x-api-key": "reqres-free-v1"};
                    Map data = {
                      'email': emailController.text.toString(),
                      'password': passwordController.text.toString()
                    };
                    authViewmodel.SginUpApi(data, headr, context);
                  }
                }),
                Text.rich(textAlign: TextAlign.center,
                  TextSpan(
                    text: "Already have an account?",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: [
                      TextSpan(
                        text: "Login",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, RoutesName.login);
                          },
                      )
                    ],
                  )),
          ],
        ),
      ),
    );
  }
}