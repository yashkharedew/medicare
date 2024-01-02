import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
// Define form key
  final _formKey = GlobalKey<FormState>();

// Form Fields initialization
  var _username = '';
  var _email = '';
  var _password = '';
  bool isSignIn = false;

// Define button style
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.black87,
    backgroundColor: Colors.grey[300],
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: isSignIn
              ? Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 5, 5, 5)),
                  textAlign: TextAlign.center,
                )
              : Text(
                  'Register',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 5, 5, 5)),
                  textAlign: TextAlign.center,
                ),
        ),
        SizedBox(
          height: 16,
        ),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: isSignIn
                      ? null
                      : TextFormField(
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please fill the username';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _username = value!;
                          },

                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(8.0),
                                borderSide: new BorderSide()),
                            labelText: "Enter Username",
                          ),
                        )),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'Please fill the correct email address';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },

                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                      borderSide: new BorderSide()),
                  labelText: "Enter Email Address",
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter valid password';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },

                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                      borderSide: new BorderSide()),
                  labelText: "Enter Password",
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    // if (_formKey.currentState!.validate()) {
                    //   // If the form is valid, display a snackbar. In the real world,
                    //   // you'd often call a server or save the information in a database.
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(content: Text('Processing Data')),
                    //   );
                    //   submitAuth(_username, _email, _password);
                    // } else {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(
                    //         content: Text('Incorrect! Please fill it again')),
                    //   );
                    // }
                  },
                  child: isSignIn ? Text('Login') : Text('Sign Up'),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        isSignIn = !isSignIn;
                      });
                    },
                    child: isSignIn
                        ? Text('Not a member')
                        : Text('Already a member')),
              )
            ],
          ),
        )
      ],
    );
  }

// Authentication method on button submit
  void submitAuth(email, password, username) {
    try {} catch (e) {}
  }
}
