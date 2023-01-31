
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:onstaraapplication/authentication/signup_form.dart';
import 'package:onstaraapplication/home_screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

 final GoogleSignIn _googleSignIn = GoogleSignIn();



  ///-----------------------------------------Validation part-------------------------------------------------------------------------------->
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool? check1 = false;
  bool isloading = false;
  bool isSecureText = true;

  _commmonTextFields(
      TextEditingController controller,
      TextInputType keyboardType,
      bool isSecureText,
      TextInputAction textInputAction,
      List<String>? validationText,
      int maxLength,
      int? minLength,
      RegExp validText,
      String hintText,
      Icon? icon,
      IconButton? iconButton) {
    return TextFormField(
        controller: controller,
        validator: ((val) {
          if (validationText == null && minLength == null) {
            return null;
          }
          if (val == null || val.trim().isEmpty) {
            return validationText![0];
          } else if ((minLength ?? 0) > val.length) {
            return "Enter greater than $minLength characters";
          } else if (!validText.hasMatch(val)) {
            return validationText![0];
          } else {
            return null;
          }
        }),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: isSecureText,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        decoration: InputDecoration(

            border: InputBorder.none,
            errorStyle: TextStyle(color: Colors.red),
            contentPadding: EdgeInsets.fromLTRB(10, 15, 0, 0),
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 15),
            suffixIcon: icon == null ? iconButton : icon));

  }

 Future<String?> signInwithGoogle() async {
   try {
     final GoogleSignInAccount? googleSignInAccount =
     await _googleSignIn.signIn();
     final GoogleSignInAuthentication googleSignInAuthentication =
     await googleSignInAccount!.authentication;
     final AuthCredential credential = GoogleAuthProvider.credential(
       accessToken: googleSignInAuthentication.accessToken,
       idToken: googleSignInAuthentication.idToken,
     );
     await FirebaseAuth.instance.signInWithCredential(credential);
     await _googleSignIn.signOut();
   } on FirebaseAuthException catch (e) {
     print(e.message);
     throw e;
   }
 }

  signinAction(BuildContext context) async {
      setState(() {
        isloading = true;
      });
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text,
          password: password.text
      );
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);

    } on FirebaseAuthException catch (e) {
      setState(() {
        isloading = false;
      });
      String errorMessage = "";
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
        print('Wrong password provided for that user.');
      }
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text(errorMessage)),
      );
    }
  }
@override
  void dispose() {
    // TODO: implement dispose
  email.text = "";
  password.text = "";
  super.dispose();
  }
//------------------------------------------------------------------------------------------------------------------------------------------------------->
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child:Form(
                key: _formKey,
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 90,
                ),
                Text(
                  'Welcome to\n Onstara',
                  style: TextStyle(
                      color: Colors.indigo,
                      fontFamily: 'onstar',
                      fontWeight: FontWeight.w900,
                      fontSize: 40),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.0,
                              color: Color.fromARGB(255, 169, 162, 162))),
                      child: _commmonTextFields(
                          email,
                          TextInputType.emailAddress,
                          false,
                          TextInputAction.next,
                          [
                            "enter a valid email address"

                          ],
                          8,
                          3,
                          RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"),
                          'Email',
                          Icon(Icons.mail_outline_outlined),
                          null)),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.0,
                              color: Color.fromARGB(255, 169, 162, 162))),
                      child: _commmonTextFields(
                          password,
                          TextInputType.visiblePassword,
                          isSecureText,
                          TextInputAction.next,
                          [
                            "enter a valid password"
                          ],
                          8,
                          3,
                          RegExp(
                            ('[a-zA-Z0-9!@#%^&]'),
                          ),
                          'Password',
                          null,
                          IconButton(
                              onPressed: (() {
                                setState(() {
                                  isSecureText = !isSecureText;
                                });
                              }),
                              icon: isSecureText
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility)))),
                ),
                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: EdgeInsets.all(12),
                  child: GestureDetector(
                    onTap: (() {
                      if (_formKey.currentState!.validate() && !isloading) {
                        signinAction(context);
                      }

                    }),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        // color: Color.fromARGB(255, 43, 197, 159),
                        color: Colors.indigo,
                      ),
                      child: Center(
                          child: isloading
                              ? Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 3.0,
                            ),
                          )
                              : Center(
                            child:
                            Text(
                              'Sign In',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'onstar',
                                  fontSize: 20),
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                ///=========================================================================================================>

                GestureDetector(
                  onTap: (){

                  },

                  ///======================================================================================================>
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      color: Colors.grey[300],
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/images/googleSignin.png'),
                                width: 40,
                                height: 40,
                              ),
                              SizedBox(width: 10,),
                              Text(
                                'Signin with Google',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'cata',
                                    fontSize: 17),
                              )

                            ],
                      ),
                    ),
                  ),
                ),


                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: (()=>  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SighUpPageAssmnt()),
                  )),
                  child: Padding(padding: EdgeInsets.only(right: 10), child:
                  Text('Register now',
                    style: TextStyle(
                        color: Colors.indigo,
                        fontFamily: 'cata',
                        fontSize: 15),
                        textAlign: TextAlign.right,),),
                ),

              ],
            ),
          ),
        ),),
      ),
    );
  }
}
