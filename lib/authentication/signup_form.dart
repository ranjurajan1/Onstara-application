import 'package:firebase_auth/firebase_auth.dart';
import 'package:onstaraapplication/home_screen/home_screen.dart';
import 'package:flutter/material.dart';


class SighUpPageAssmnt extends StatefulWidget {
  const SighUpPageAssmnt({super.key});

  @override
  State<SighUpPageAssmnt> createState() => _SighUpPageAssmntState();
}

class _SighUpPageAssmntState extends State<SighUpPageAssmnt> {
  TextEditingController fullName = TextEditingController();
  TextEditingController eMail = TextEditingController();
  TextEditingController passWord = TextEditingController();
  TextEditingController cnfrmPasswrd = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool passwrd = true;
  bool cnfrmpasswrd = true;
  bool isloading = false;

  _cntainrdsign(String img) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
            color: Color.fromARGB(122, 134, 134, 134),
            width: 1.0,
            style: BorderStyle.solid),
      ),
      child: Image(
        image: AssetImage(img),
        width: 10,
      ),
    );
  }
  _comnTextFields(
      TextEditingController controller,
      TextInputType keyboardType,
      bool isSecureText,
      TextInputAction textInputAction,
      String? validationText,
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
            return validationText;
          } else if ((minLength ?? 0) > val.length) {
            return "Enter the greater than $minLength characters";
          } else if (!validText.hasMatch(val)) {
            return validationText;
          } else {
            return null;
          }
        }),
        autovalidateMode: AutovalidateMode.disabled,
        obscureText: isSecureText,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        decoration: InputDecoration(
            border: InputBorder.none,
            errorStyle: TextStyle(color: Colors.red),
            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 15),
            suffixIcon: icon == null ? iconButton : icon));
  }

  registerUser(BuildContext context) async {
    setState(() {
      isloading = true;
    });
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: eMail.text,
        password: passWord.text,
      );
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
    } on FirebaseAuthException catch (e) {
      setState(() {
        isloading = false;
      });
      String errorMsg = "";
      if (e.code == 'weak-password') {
        errorMsg = 'The password provided is too weak.' ;
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        errorMsg = 'The account already exists for that email.';
        print('The account already exists for that email.');
      }
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text(errorMsg)),
      );
    } catch (e) {
      print(e);
      setState(() {
        isloading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text(e.toString())),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*************appbar strt**********/
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Sign up',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: (() {
              Navigator.pop(context);
            }),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      /*************appbar end**********/
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 210),
                    child: Text(
                      "Sign up!",
                      style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'onstar'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(9),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.grey),
                      ),
                      child: _comnTextFields(
                        fullName,
                        TextInputType.name,
                        false,
                        TextInputAction.next,
                        'Enter a valid name',
                        30,
                        3,
                        RegExp('[a-zA-Z]'),
                        "Enter your name",
                        null,
                        IconButton(
                          onPressed: (() {
                            setState(() {});
                          }),
                          icon: Icon(
                            cnfrmpasswrd
                                ? Icons.person_outline_sharp
                                : Icons.person_outline,
                            color: Color.fromARGB(171, 139, 138, 138),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(9),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.grey),
                      ),
                      child: _comnTextFields(
                          eMail,
                          TextInputType.emailAddress,
                          false,
                          TextInputAction.next,
                          'Enter a valid email address',
                          100,
                          null,
                          RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"),
                          "Enter Your Email ",
                          null,
                          IconButton(
                            onPressed: (() {
                              setState(() {});
                            }),
                            icon: Icon(
                              cnfrmpasswrd ? Icons.email : Icons.email,
                              color: Color.fromARGB(171, 139, 138, 138),
                            ),
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(9),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.grey),
                      ),
                      child: _comnTextFields(
                          passWord,
                          TextInputType.visiblePassword,
                          passwrd,
                          TextInputAction.next,
                          'Enter a valid password',
                          30,
                          3,
                          RegExp('[a-zA-Z0-9!@#%^&]'),
                          "Enter Your Password",
                          null,
                          IconButton(
                            onPressed: (() {
                              setState(() {
                                passwrd = !passwrd;
                              });
                            }),
                            icon: Icon(
                              passwrd ? Icons.visibility : Icons.visibility_off,
                              color: Color.fromARGB(171, 139, 138, 138),
                            ),
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(9),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.grey),
                      ),
                      child: _comnTextFields(
                          cnfrmPasswrd,
                          TextInputType.visiblePassword,
                          cnfrmpasswrd,
                          TextInputAction.next,
                          'Enter a valid password',
                          30,
                          3,
                          RegExp('[a-zA-Z0-9!@#%^&]'),
                          "Confirm Your Password",
                          null,
                          IconButton(
                            onPressed: (() {
                              setState(() {
                                cnfrmpasswrd = !cnfrmpasswrd;
                              });
                            }),
                            icon: Icon(
                              cnfrmpasswrd
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_off_outlined,
                              color: Color.fromARGB(171, 139, 138, 138),
                            ),
                          )),
                    ),
                  ),
                  /*****sign up******/
                  Padding(
                    padding: const EdgeInsets.all(9),
                    child: GestureDetector(
                      onTap: (() {
                        if (_formKey.currentState!.validate() && !isloading) {
                          registerUser(context);

                        }
                      }),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.indigo,
                          // color: Color.fromARGB(255, 43, 197, 159),
                        ),
                        height: 50,
                        child: Center(
                          child: isloading
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    strokeWidth: 3.0,
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        //  color: Colors.indigo,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 17,
                                        fontFamily: 'joseph'),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                  /********sign in */
                  SizedBox(
                    height: 20,
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
