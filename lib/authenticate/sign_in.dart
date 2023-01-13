import 'package:colorviu/authenticate/forgot_password.dart';
import 'package:colorviu/authenticate/google.dart';
import 'package:colorviu/services/auth.dart';
import 'package:colorviu/shared/constants.dart';
import 'package:colorviu/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({super.key, required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? const Loading() : Scaffold(
    backgroundColor: Colors.brown[100],
    appBar: AppBar(
      backgroundColor: Colors.brown[400],
      elevation: 0,
      title: const Text(
        'ColorViu',
        style: TextStyle(
          fontSize: 25,
        ),
      ),
      actions: [
        ElevatedButton.icon(
            icon: const Icon(Icons.person),
            label: const Text('Register'),
            onPressed: () {
              widget.toggleView();
            }),
      ],
    ),
    body: SingleChildScrollView(
      child: Container(
        padding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        height: 900,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background.jpg"),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            const Text(
              'Sign In to \n' 'Your ColorViu Account',
              style: TextStyle(
                fontSize: 40,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Email'),
                    validator: (val) =>
                        val!.isEmpty ? 'Enter an Email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    }
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Password'),
                    obscureText: true,
                    validator: (val) => val!.length < 6
                        ? 'Enter a password 6+ characters long'
                        : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.lock_open, size: 32),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() => loading = true);
                        dynamic result =
                          await _auth.signInWithEmailAndPassword(
                              email, password);
                        if (result == null) {
                          setState(() {
                            error = 'Could not Sign In';
                            loading = false;
                          });
                        }
                      }
                    },
                    label: const Text(
                      'Sign In',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 50)),
                    onPressed: () {
                      final provider = Provider.of<Google>(
                        context,
                        listen: false);
                      provider.googleLogin();
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.red,
                    ),
                    label: const Text('Sign Up with Google')
                  ),
                  const SizedBox(height: 24),
                  GestureDetector(
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context)
                            .colorScheme
                            .secondary,
                        fontSize: 20
                      ),
                    ),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ForgotPassword()
                      )
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    error,
                    style: const TextStyle(
                      color: Colors.red, 
                      fontSize: 14
                    ),
                  )
                ],
              )
            ),
          ],
        )
      ),
    ));
  }
}
