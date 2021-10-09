import 'package:flutter/material.dart';

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
        // appBar: AppBar(
        //     backgroundColor: Colors.blue,
        //     title: const Text('Signup'),
        //     centerTitle: true,
        //     elevation: 0,
        //     leading: IconButton(
        //         icon: const Icon(Icons.arrow_back),
        //         onPressed: () {
        //           Navigator.pushReplacementNamed(context, '/');
        //         })),
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 50, 0, 0),
          child: Container(
            //     decoration: BoxDecoration(
            // image:const DecorationImage(
            //     image: NetworkImage(
            //             "https://images.unsplash.com/photo-1579202673506-ca3ce28943ef"
            //             ),
            //     fit: BoxFit.cover
            // ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(""),
                fit: BoxFit.cover,
                alignment: Alignment.bottomRight,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.dstATop),
              ),
            ),

            child: Row(
              children: [
                IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/');
                    }),
              ],
            ),
          ),
        ),
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(colors: [
        //     Colors.blue,
        //     Colors.lightBlueAccent,
        //   ]),

        Flexible(
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(25, 50, 0, 0),
                child: Text('Create Account',
                    style:
                        TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
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
                padding: const EdgeInsets.fromLTRB(200, 0, 20, 0),
                child: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/maps');
                  },
                  icon: const Icon(
                    Icons.forward,
                    size: 20,
                  ),
                  label: const Text("Singup", style: TextStyle(fontSize: 15)),
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
