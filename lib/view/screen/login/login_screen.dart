import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task_d_anurag_1786/helper/firstore_helper.dart';
import 'package:task_d_anurag_1786/view/screen/login/model/login_model.dart';
import 'package:task_d_anurag_1786/view/screen/login/provider/login_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, provider, child) {
      return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.network(
                    "https://i.pinimg.com/originals/eb/1f/85/eb1f85accd6f12497323c06e4a89aa76.gif"),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Form(
                      child: Column(
                        children: [
                          Text(
                            "\t\t\t\t              🙏\nWe are there for you to \nDeliver the Best You want",
                            style: GoogleFonts.openSans(
                              color: Colors.blue.shade500,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: provider.usernameController,
                              decoration: const InputDecoration(
                                label: Text("Username"),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.yellow,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: provider.emailController,
                              decoration: const InputDecoration(
                                label: Text("Email"),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.yellow,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        onPressed: () {
                          UserModel userModel = UserModel(
                            username: provider.usernameController.text,
                            email: provider.emailController.text,
                          );
                          FireStoreHelper.storeHelper
                              .addUser(userModel: userModel);
                          Navigator.of(context).pushNamed("home_page");
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "Login",
                            style: GoogleFonts.openSans(
                              fontSize: 20,
                              color: Colors.blue.shade500,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
