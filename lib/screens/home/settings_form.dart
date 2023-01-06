import 'package:colorviu/models/user.dart';
import 'package:colorviu/services/database.dart';
import 'package:colorviu/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:colorviu/shared/constants.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  String? _currentName;
  String? _currentGender;
  String? _currentDof;

  @override
  Widget build(BuildContext context) {
    final coloruser = Provider.of<MyUser>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: coloruser.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData? userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    'Update your brew settings',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    initialValue: userData?.name,
                    decoration: textInputDecoration,
                    validator: (val) =>
                        val!.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  const SizedBox(height: 20),
                  // DropdownButtonFormField<String>(
                  //   decoration: textInputDecoration,
                  //   value: _currentGender ?? userData?.gender,
                  //   items: sugars.map((sugar) {
                  //     return DropdownMenuItem(
                  //       value: sugar,
                  //       child: Text("Male"),  
                  //     );
                  //   }).toList(),
                  //   onChanged: (val) => setState(() => _currentGender = val),
                  // ),
                  // Slider(
                  //   value: (_currentStrength ?? userData!.strength).toDouble(),
                  //   activeColor: Colors.brown[_currentStrength ?? 100],
                  //   inactiveColor: Colors.brown[_currentStrength ?? 100],
                  //   min: 100,
                  //   max: 900,
                  //   divisions: 8,
                  //   onChanged: (val) =>
                  //       setState(() => _currentStrength = val.round()),
                  // ),
                  ElevatedButton(
                    //color: Colors.pink[400],
                    child: const Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await DatabaseService(uid: coloruser.uid)
                            .updateUserData(
                                _currentName ?? userData!.name,
                                _currentGender ?? userData!.gender,
                                _currentDof ?? userData!.dof);
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      }
                    },
                  )
                ],
              ),
            );
          } else {
            return const Loading();
          }
        });
  }
}
