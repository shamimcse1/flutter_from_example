import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();

  late FocusNode myFocusNode;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(

        appBar: AppBar(
          title:  const Text("Form Demo"),
        ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Builder(
              builder: (context) => Center(
                child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Center(
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        shadowColor: Colors.blue,
                        margin:  const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0, right: 16.0,top: 36),
                              child: TextFormField(
                                autofocus: true,
                                controller: emailController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter your email',
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                              child: TextFormField(
                                focusNode: myFocusNode,
                                controller: passwordController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter your password',
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  myFocusNode.requestFocus();
                                  // Validate returns true if the form is valid, or false otherwise.

                                  if (emailController.text.isEmpty) {
                                    _validationError(context, "Email is empty");
                                  }
                                  else if (passwordController.text.isEmpty) {
                                    _validationError(context, "Password is empty");
                                  }
                                  else {
                                    _printLatestValue(context);
                                  }

                                },
                                child: const Text('Log In'),

                              ),

                            ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               const Text("Don't have an account?"),
                               TextButton(
                                 onPressed: () {
                                 },
                                 child: const Text('Sign Up'),
                               ),
                             ],)
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
            ),
              ),

      ),
          ],
        ),));
  }
  void _printLatestValue(BuildContext context) {
    print('Email text field: ${emailController.text}');
    print('Password text field: ${passwordController.text}');
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Email text field: ${emailController.text}"),
          Text("Password text field: ${passwordController.text}"),
        ],
      )
    ));
  }

  String? _validationError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
        content: Text(message)
    ));
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    emailController.dispose();
    passwordController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

}
