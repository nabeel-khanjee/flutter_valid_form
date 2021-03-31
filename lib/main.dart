import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final focusNode = new FocusNode();   1st body elemnt for focus field
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  String _email;
  String _password;

  // @override
  // void initState() {
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      performLogin();
    }
  }

  void performLogin() {
    final snackbar = new SnackBar(
      content: new Text("Email is :$_email, Password is : $_password"),
    );
    // ignore: deprecated_member_use
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        appBar: new AppBar(
          title: new Text("Form Page"),
        ),
        // body: new Container(   1st body
        //   padding: const EdgeInsets.all(10.0),
        //   child: Column(children: [
        //     new TextField(
        //       autofocus: true,
        //     ),
        //     new TextField(
        //       focusNode: focusNode,
        //     )
        //   ]),
        // ),
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.add),
        //   onPressed: () => FocusScope.of(context).requestFocus(focusNode),
        // ),

        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: new Form(
            key: formKey,
            child: new Column(
              children: [
                TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Email",
                  ),
                  validator: (val) =>
                      val.contains('@') ? null : "Invalid Email",
                  onSaved: (val) => _email = val,
                ),
                TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Password",
                  ),
                  validator: (val) =>
                      val.length < 8 ? "Password too short" : null,
                  onSaved: (val) => _password = val,
                  obscureText: true,
                ),
                Padding(padding: const EdgeInsets.only(top: 20.0)),
                RaisedButton(child: Text("Login"), onPressed: () => _submit)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
