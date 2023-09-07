import 'dart:ffi';

import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const routeName = '/SignIn';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _signInData = {'email': '', 'password': ''};
  bool _passwordVisible = false;
  var _isLoading = false;

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                child: Image.asset(
                  'assets/images/signInBackground.png',
                  fit: BoxFit.cover,
                  width: size.width,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height / 2 - 5),
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 50),
                  width: size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sign In',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Card(
                          elevation: 0.0,
                          child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'E-Mail',
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        borderSide: BorderSide(
                                            color: Colors.white,
                                            style: BorderStyle.none),
                                      ),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !value.contains('@')) {
                                        return 'Invalid email!';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _signInData['email'] = value as String;
                                    },
                                  ),
                                  SizedBox(height: 7),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        borderSide: BorderSide(
                                            color: Colors.white,
                                            style: BorderStyle.none),
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(_passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible =
                                                !_passwordVisible;
                                          });
                                        },
                                      ),
                                    ),
                                    obscureText: !_passwordVisible,
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 5) {
                                        return 'Password is too short!';
                                      }
                                    },
                                    onSaved: (value) {
                                      _signInData['password'] = value as String;
                                    },
                                  ),
                                  SizedBox(height: 40),
                                  SizedBox(
                                    height: 50,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: _submit,
                                      child: _isLoading
                                          ? const CircularProgressIndicator()
                                          : Text(
                                              'SIGN IN',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(35.0)),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        )
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
