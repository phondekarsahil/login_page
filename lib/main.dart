import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login Screen"),
          backgroundColor: Colors.blue[600],
        ),
        body: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                child: TextFormField(
                  controller: userNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required!';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      labelText: "User Name",
                      border: UnderlineInputBorder(),
                      hintText: "Enter your username"),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                child: TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required!';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: "Password",
                      border: UnderlineInputBorder(),
                      hintText: "Enter your password"),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              "Login Successfull! User Name: ${userNameController.text}, Password: ${userNameController.text}")),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ));
  }
}
