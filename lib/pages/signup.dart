import 'package:flutter/material.dart';
import 'package:gmap/screens/search.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 25, 0, 0),
              child: Container(
                  width: 400,
                  height: 100,
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
                    const SizedBox(
                      width: 200,
                    ),
                  ])),
            ),
            Flexible(
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(25, 50, 0, 0),
                    child: Text('Create Account',
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
                      // keyboardType: TextInputType.text,

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
                          const Text("Signup", style: TextStyle(fontSize: 15)),
                      backgroundColor: Colors.green[600],
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
                      child: Row(
                        children: [
                          const Text('Already Have an account?',
                              style: TextStyle(
                                letterSpacing: 2,
                              )),
                          TextButton(
                              child: const Text('Login',
                                  style: TextStyle(
                                      letterSpacing: 2,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              onPressed: () {
                                Navigator.push<void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        const Search(),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 400,
                        height: 95,
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
        ));
  }
}
