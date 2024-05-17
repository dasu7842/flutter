import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'registrationpage.dart';

void main() {
  runApp(MaterialApp(home:Loginpage(),
    debugShowCheckedModeBanner: false,));

}


class Loginpage extends StatefulWidget {
  const Loginpage({Key? key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 10),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Already",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "have an",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Account ?",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Image.asset(
                      "assets/images2.jpeg",
                      height: 200,
                      width: 200,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: 'Enter Email',
                      hintStyle: TextStyle(color: Colors.cyan.shade700),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.cyan.shade700),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan.shade700),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.cyan
                                .shade700), // Change underline color when focused
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 15)),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Enter Password',
                      hintStyle: TextStyle(color: Colors.cyan.shade700),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.cyan.shade700),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan.shade700),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.cyan
                                .shade700), // Change underline color when focused
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 15)),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(200, 40)),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.cyan.shade500,
                  ), // Change background color
                ),
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 10,),
              Center(
                child: InkWell(
                  onTap: () {
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Registrationpage()),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'New user? Register Now',
                        style: TextStyle(
                          color: Colors.cyan.shade500,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
