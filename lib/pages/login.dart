import 'package:flutter/material.dart';
import 'package:gmap/pages/login.dart';
import 'package:gmap/pages/signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: Container(
                  // width: size.width * 0.2,
                  height: size.height * 0.15,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage("assets/topnew.png"),
                      alignment: Alignment.bottomRight,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(1), BlendMode.dstATop),
                    ),
                  ),
                  child: Row(children: [
                    IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/');
                        }),
                    // const SizedBox(
                    //   width: 20,
                    // ),
                  ])),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                    child: Text('Login',
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.mail),
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          hintText: 'Enter your Email'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      obscureText:
                          !_passwordVisible, //This will obscure text dynamically
                      decoration: InputDecoration(
                        prefixIcon:
                            // add padding to adjust icon
                            const Icon(Icons.lock_outlined),
                        fillColor: Colors.green,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        // Here is key idea
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(250, 0, 20, 0),
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/');
                      },
                      icon: const Icon(
                        Icons.forward,
                        size: 20,
                      ),
                      label:
                          const Text("Login", style: TextStyle(fontSize: 15)),
                      backgroundColor: Colors.green[600],
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
                      child: Row(
                        children: [
                          const Text('Dont Have an account?',
                              style: TextStyle(
                                letterSpacing: 2,
                              )),
                          TextButton(
                              child: const Text('SingUp',
                                  style: TextStyle(
                                      letterSpacing: 2,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()),
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: size.width * 0.95,
                        height: size.width * 0.59,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: const AssetImage("assets/bottomnew.png"),
                            alignment: Alignment.bottomLeft,
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(1), BlendMode.dstATop),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )));
  }
}
