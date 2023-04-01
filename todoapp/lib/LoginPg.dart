import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/BottomNav.dart';
import 'package:todoapp/SignUp.dart';

class LoginPg extends StatefulWidget {
  const LoginPg({super.key});

  @override
  State<LoginPg> createState() => _LoginPgState();
}

class _LoginPgState extends State<LoginPg> {
  bool passwordObscured = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.lightBlue.shade50,
      body: SingleChildScrollView(
        child: Column(
            children: [
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1,
                autoPlayCurve: Curves.fastOutSlowIn,
                height: 250.0,
                autoPlay: true,
                enlargeCenterPage: true,
                autoPlayInterval: Duration(seconds: 6)
              ),
              items: items.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade900,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      //width: MediaQuery.of(context).size.width*9,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Center(
                            child: Text(
                              item,
                              style: GoogleFonts.abel(color: Colors.white,fontSize: 19),
                              // const TextStyle(
                              //   color: Colors.white,
                              //   fontSize: 30.0,
                              //   fontWeight: FontWeight.bold,
                              //   fontStyle: FontStyle.italic,
                              // ),

                            )
                        )
                    );
                  },
                );
              }).toList(),
          ),
            ),
          SizedBox(
            height: 120,
          ),
          Text('Taskify',style: TextStyle(color: Colors.blueGrey.shade900,fontWeight: FontWeight.bold,fontSize: 56,fontStyle: FontStyle.italic),),
          SizedBox(
            height: 20,
          ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(12),
                    
                  ),
                  child: TextFormField(
                    // validator: MultiValidator([
                    //   RequiredValidator(errorText: "  Required*"),
                    //   EmailValidator(errorText: "Enter a valid E-mail")
                    // ]),
                    //controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.blueGrey), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        border: InputBorder.none,
                        hintText: ' Email',
                        hintStyle: TextStyle(letterSpacing: 2.0,fontSize: 20,),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.blueGrey,
                        )),
                    // validator: (email) =>//*********************************** VALIDATOR FUNCTION ****************************
                    //     email != null && !EmailValidator.validate(email)
                    //         ? 'Enter a valid Email'
                    //         : null,
                  ),
                ),
              ),
          // Container(
          //   child: Image.network('https://www.usmobile.com/blog/wp-content/uploads/2021/01/Stuck-at-Home-To-Do-List.png'),
          // )
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextFormField(
                    //controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '   Required*';
                      } else {
                        return null;
                      }
                    },
                    obscureText: passwordObscured,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.blueGrey), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        border: InputBorder.none,
                        hintText: ' Password',
                        hintStyle: TextStyle(
                          letterSpacing: 2.0,
                          fontSize: 20,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              passwordObscured = !passwordObscured;
                            });
                          },
                          icon: Icon(
                            passwordObscured
                                ? Icons.visibility_off_sharp
                                : Icons.visibility,
                            color: Colors.blueGrey,
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.blueGrey,
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 50,
                  width: 800,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[900],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      // if (formKey.currentState!.validate()) {
                      //   try {
                      //     await FirebaseAuth.instance
                      //         .signInWithEmailAndPassword(
                      //         email: emailController.text.trim(),
                      //         password: passwordController.text.trim());
                      //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Nav_bar()));
                      //   } on FirebaseAuthException catch (error) {
                      //     errorMessage = error.message!;
                      //   }
                      // }
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> BottomNav()));
                      setState(() {});
                    },

                    child: Center(
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 50,
                  width: 800,
                  decoration: BoxDecoration(
                    //color: Colors.blueGrey[900],
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(width: 3, color: Colors.blueGrey),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      // if (formKey.currentState!.validate()) {
                      //   try {
                      //     await FirebaseAuth.instance
                      //         .signInWithEmailAndPassword(
                      //         email: emailController.text.trim(),
                      //         password: passwordController.text.trim());
                      //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Nav_bar()));
                      //   } on FirebaseAuthException catch (error) {
                      //     errorMessage = error.message!;
                      //   }
                      // }
                      setState(() {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUp()));
                      });
                    },

                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.blueGrey.shade900,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

        ]),
      ),
    ));
  }
}

final List items = [
  '"Believe you can and youre halfway there."',
  '"You miss 100% of the shots you dont take."',
  '"I can, and I will."',
  '"It always seems impossible until its done."',
  '"Action is the foundational key to all success."',
  '"The only way to do great work is to love what you do."',
  '"Dont wait for opportunity, create it."',
];
