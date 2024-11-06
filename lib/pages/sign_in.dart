import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:travel_hour/blocs/sign_in_bloc.dart';
import 'package:travel_hour/config/config.dart';
import 'package:travel_hour/newfeatures/Login_Page.dart';
import 'package:travel_hour/pages/done.dart';
import 'package:travel_hour/services/app_service.dart';
import 'package:travel_hour/utils/next_screen.dart';
import 'package:travel_hour/utils/snacbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:travel_hour/widgets/language.dart';

class SignInPage extends StatefulWidget {
  final String? tag;
  const SignInPage({Key? key, this.tag}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> handleSignIn(Future<void> Function() signInMethod) async {
    setState(() => isLoading = true);
    final sb = context.read<SignInBloc>();
    bool? hasInternet = await AppService().checkInternet();

    if (!hasInternet!) {
      openSnacbar(context, 'check your internet connection!'.tr());
      setState(() => isLoading = false);
      return;
    }

    await signInMethod().then((_) {
      if (sb.hasError) {
        openSnacbar(context, 'something is wrong. please try again.'.tr());
      } else {
        sb.checkUserExists().then((userExists) async {
          if (userExists) {
            await sb.getUserDatafromFirebase(sb.uid);
          } else {
            await sb.getJoiningDate();
            await sb.saveToFirebase();
            await sb.increaseUserCount();
          }
          await sb.saveDataToSP();
          await sb.guestSignout();
          await sb.setSignIn();
          afterSignIn();
        });
      }
    }).whenComplete(() => setState(() => isLoading = false));
  }

  void afterSignIn() {
    if (widget.tag == null) {
      nextScreen(context, DonePage());
    } else {
      Navigator.pop(context);
    }
  }

  Widget buildSignInButton({
    required IconData icon,
    required String text,
    required Color color,
    required Future<void> Function() signInMethod,
  }) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.80,
      child: TextButton(
        onPressed: () => handleSignIn(signInMethod),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        ),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(backgroundColor: Colors.white))
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  // Widget buildManualSignIn() {
  //   return Form(
  //     key: _formKey,
  //     child: Column(
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 40),
  //           child: TextFormField(
  //             controller: emailController,
  //             decoration: InputDecoration(
  //               labelText: 'Email',
  //               border: OutlineInputBorder(),
  //             ),
  //             validator: (value) {
  //               if (value == null || value.isEmpty) {
  //                 return 'Please enter your email';
  //               }
  //               if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
  //                 return 'Enter a valid email';
  //               }
  //               return null;
  //             },
  //           ),
  //         ),
  //         SizedBox(height: 15),
  //         Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 40),
  //           child: TextFormField(
  //             controller: passwordController,
  //             decoration: InputDecoration(
  //               labelText: 'Password',
  //               border: OutlineInputBorder(),
  //             ),
  //             obscureText: true,
  //             validator: (value) {
  //               if (value == null || value.isEmpty) {
  //                 return 'Please enter your password';
  //               }
  //               if (value.length < 6) {
  //                 return 'Password must be at least 6 characters';
  //               }
  //               return null;
  //             },
  //           ),
  //         ),
  //         SizedBox(height: 20),
  //         Container(
  //           height: 50,
  //           width: MediaQuery.of(context).size.width * 0.80,
  //           child: TextButton(
  //             onPressed: () {
  //               if (_formKey.currentState!.validate()) {
  //                 // Perform manual sign-in with email and password
  //                 handleSignIn(() async {
  //                   final sb = context.read<SignInBloc>();
  //                   return sb.signInWithEmail(
  //                     emailController.text,
  //                     passwordController.text,
  //                   );
  //                 });
  //               }
  //             },
  //             style: ButtonStyle(
  //               backgroundColor: MaterialStateProperty.all(Colors.orange),
  //               shape: MaterialStateProperty.all(
  //                 RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(5)),
  //               ),
  //             ),
  //             child: isLoading
  //                 ? Center(
  //                     child: CircularProgressIndicator(
  //                         backgroundColor: Colors.white))
  //                 : Text(
  //                     'Sign In with Email',
  //                     style: TextStyle(
  //                       fontSize: 16,
  //                       fontWeight: FontWeight.w600,
  //                       color: Colors.white,
  //                     ),
  //                   ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          if (widget.tag == null)
            TextButton(
              onPressed: () {
                context.read<SignInBloc>().setGuestUser();
                nextScreen(context, DonePage());
              },
              child: Text('skip',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
                  .tr(),
            ),
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () => nextScreenPopup(context, LanguagePopup()),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'welcome to',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[700]),
                ).tr(),
                SizedBox(height: 5),
                Text(
                  Config().appName,
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                      color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'welcome message',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600]),
                  ).tr(),
                ),
                SizedBox(height: 20),
                Container(
                  height: 3,
                  width: MediaQuery.of(context).size.width * 0.50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                buildSignInButton(
                  icon: FontAwesome.google,
                  text: 'Sign In with Google',
                  color: Colors.blueAccent,
                  signInMethod: context.read<SignInBloc>().signInWithGoogle,
                ),
                SizedBox(height: 15),
                // buildSignInButton(
                //   icon: FontAwesome.facebook,
                //   text: 'Sign In with Facebook',
                //   color: Colors.indigo,
                //   signInMethod: context.read<SignInBloc>().signInwithFacebook,
                // ),
                if (Platform.isIOS) SizedBox(height: 15),
                if (Platform.isIOS)
                  buildSignInButton(
                    icon: FontAwesome.apple,
                    text: 'Sign In with Apple',
                    color: Colors.black,
                    signInMethod: context.read<SignInBloc>().signInWithApple,
                  ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the LoginPage when the button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ), // Navigate to LoginPage
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent, // Set the button color
                    padding: EdgeInsets.symmetric(
                        vertical: 16, horizontal: 40), // Adjust padding
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12), // Rounded corners
                    ),
                  ),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white, // Text color
                      fontSize: 18, // Font size
                    ),
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
