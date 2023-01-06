import 'package:colorviu/services/auth.dart';
import 'package:colorviu/shared/constants.dart';
import 'package:colorviu/shared/loading.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:intl/intl.dart';

final List<Map<String, dynamic>> genders = [
  {'value': 'Male', 'label': 'Male'},
  {'value': 'Female', 'label': 'Female'},
];

class Register extends StatefulWidget {
  final Function toggleView;
  const Register({super.key, required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String fullName = '';
  String email = '';
  String password = '';
  String gender = '';

  late DateTime selectedData;
  String dof = '';

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
            label: const Text('Sign In'),
            onPressed: () {
              widget.toggleView();
            }
          )
        ],
      ),
      body: SingleChildScrollView( 
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
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
                'Register for a \n' 'ColorViu Account',
                style: TextStyle(
                  fontSize: 37,
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
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val) =>
                            val!.isEmpty ? 'Enter an Email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        }),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                          hintText: 'Password'),
                      obscureText: true,
                      validator: (val) => val!.length < 6
                          ? 'Enter a Password 6+ characters long'
                          : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: 'Full Name'),
                        validator: (val) =>
                            val!.isEmpty ? 'Enter your Name' : null,
                        onChanged: (val) {
                          setState(() => fullName = val);
                        }),
                    const SizedBox(height: 20),
                    SelectFormField(
                      type: SelectFormFieldType.dropdown,
                      initialValue: '',
                      labelText: 'Gender',
                      items: genders,
                      onChanged: (val) =>
                          {setState(() => gender = val)},
                    ),
                    const SizedBox(height: 20),
                    DateTimeFormField(
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.black45),
                        errorStyle: TextStyle(color: Colors.redAccent),
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.event_note),
                        labelText: 'Enter Your Birthday',
                      ),
                      mode: DateTimeFieldPickerMode.date,
                      autovalidateMode: AutovalidateMode.always,
                      validator: (e) => (e?.day ?? 0) == 1
                          ? 'Please not the first day'
                          : null,
                      onDateSelected: (DateTime val) {
                        String selectedData =
                            DateFormat('dd-MM-yyyy').format(val);
                        //print(selectedData);
                        setState(() => dof = selectedData);
                      },
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 50,
                      width: 120,
                      child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.pink[400]!),
                          textStyle: MaterialStateProperty.all(
                            const TextStyle(color: Colors.white))),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() => loading = true);
                            dynamic result = await _auth.registerAccount(
                                email, password, fullName, gender, dof);
                            if (result == null) {
                              setState(() {
                                error = 'Please supply a valid Email';
                                loading = false;
                              });
                            }
                          }
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 20
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      error,
                      style: const TextStyle(color: Colors.red, fontSize: 14),
                    )
                  ],
                )
              ),
            ],
          )
        ),
      )
    );
  }
}
