import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LoginPg.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginPg()));
          },
        ),
        title: Text("Register"),
        shadowColor: Colors.black,
        backgroundColor: Colors.blueGrey,
      ),
    body: Column(
      children: [
        Container(
          child: Image.asset('assets/login.png',scale: 0.9,),
        //   padding: EdgeInsets.fromLTRB(0.0, 10.0, 100.0, 0.0),
        //   child: const Text(
        //     'Welcome to the',
        //     style: TextStyle(
        //       color: Colors.blueGrey,
        //       fontSize: 62.0,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // ),
        // Container(
        //   child: Padding(
        //     padding: const EdgeInsets.only(right: 180.0),
        //     child: const Text(
        //       'Family!',
        //       style: TextStyle(
        //         color: Colors.blueGrey,
        //         fontSize: 62.0,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
        //   ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
          child: Container(

            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blueGrey.shade900,width: 2),
            ),
            child: TextFormField(
                //controller: usernameController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: ' Username',
                    hintStyle: TextStyle(
                      letterSpacing: 2.0,
                      fontSize: 20,
                    ),
                    prefixIcon: Icon(
                      Icons.person_rounded,
                      color: Colors.blueGrey,
                    ))),
          ),
        ),
        // SizedBox(
        //   height: 120.0,
        // ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 13.0, 20.0, 0.0),
          child: Container(

            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blueGrey.shade900,width: 2),
            ),
            child: TextFormField(
                //controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: ' Email',
                    hintStyle: TextStyle(
                      letterSpacing: 2.0,
                      fontSize: 20,
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.blueGrey,
                    ))),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[50],
              border: Border.all(color: Colors.blueGrey.shade900,width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextFormField(
                //controller: passwordController,
                obscureText: true,
                obscuringCharacter: '*',
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: ' Password',
                    hintStyle: TextStyle(
                      letterSpacing: 2.0,
                      fontSize: 20,
                    ),
                    prefixIcon: Icon(
                      Icons.lock_outline_sharp,
                      color: Colors.blueGrey,
                    ))),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[50],
              border: Border.all(color: Colors.blueGrey.shade900,width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextFormField(
                //controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Phone_no.',
                    hintStyle: TextStyle(
                      letterSpacing: 2.0,
                      fontSize: 20,
                    ),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.blueGrey,
                    ))),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 20),
          child: Container(
            height: 40,
            width: 500,
            decoration: BoxDecoration(
                color: Colors.blueGrey.shade900,
                borderRadius: BorderRadius.circular(12.0)),
            child: TextButton(
              onPressed: () {
                //signUp();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPg()));
              },
              child: Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                ),
              ),
            ),
          ),
        )
      ],
    ),
    );
  }
}
