import 'package:cari_atap/controllers/register_controller.dart';
import 'package:cari_atap/presentation/login_feature/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final ScrollController _scrollController = ScrollController();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final RegisterController registerController = Get.put(RegisterController());
  // String _valNumber = "+62";
  // final List _myFriends = ["+62", "+63", "+64", "+65"];

  @override
  void dispose() {
    _scrollController.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    roleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg_app.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image(
                        image: AssetImage('assets/ic_logo_app.png'),
                        width: 200,
                        height: 200,
                      ),
                    ),
                    Text(
                      "Welcome!",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Enter your details to create an account",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Gap(16.0),
                    Text(
                      "Username",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(5.0),
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        hintText: "Username",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Harap isi data kosong";
                        }
                        return value;
                      },
                    ),
                    Gap(12.0),
                    Text(
                      "E-mail",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(5.0),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        hintText: "E-mail",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Harap isi data kosong";
                        }
                        return value;
                      },
                    ),
                    // Gap(12.0),
                    // Text(
                    //   "Phone",
                    //   style: GoogleFonts.poppins(
                    //     fontSize: 14,
                    //     fontWeight: FontWeight.w600,
                    //   ),
                    // ),
                    // Gap(5.0),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Flexible(
                    //       child: DropdownButton(
                    //         borderRadius: BorderRadius.circular(16.0),
                    //         itemHeight: 58,
                    //         value: _valNumber,
                    //         items: _myFriends.map((value) {
                    //           return DropdownMenuItem(
                    //             value: value,
                    //             child: Text(value),
                    //           );
                    //         }).toList(),
                    //         onChanged: (value) {
                    //           setState(() {
                    //             _valNumber = value.toString();
                    //           });
                    //         },
                    //       ),
                    //     ),
                    //     Gap(4.0),
                    //     Expanded(
                    //       flex: 6,
                    //       child: TextFormField(
                    //         keyboardType: TextInputType.number,
                    //         decoration: InputDecoration(
                    //           border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(8.0),
                    //           ),
                    //           enabledBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(8.0),
                    //           ),
                    //           hintText: "Phone",
                    //         ),
                    //         validator: (value) {
                    //           if (value!.isEmpty) {
                    //             return "Harap isi data kosong";
                    //           }
                    //           return value;
                    //         },
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Gap(12.0),
                    Text(
                      "Password",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(5.0),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        hintText: "Password",
                        suffixIcon: Icon(Icons.remove_red_eye),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Harap isi data kosong";
                        }
                        return value;
                      },
                    ),
                    Gap(12.0),
                    Text(
                      "Role",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(5.0),
                    TextFormField(
                      controller: roleController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        hintText: "Role",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Harap isi data kosong";
                        }
                        return value;
                      },
                    ),
                    Gap(16.0),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: 48,
                        child: Obx(
                          () => ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Color(0xDF736256),
                              ),
                            ),
                            onPressed: () {
                              registerController.register(
                                nameController.text,
                                emailController.text,
                                passwordController.text,
                                roleController.text,
                              );
                            },
                            child: registerController.loading.value
                                ? SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                    ),
                                  )
                                : Text(
                                    "Sign Up",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                    Gap(16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: GoogleFonts.poppins(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Gap(4.0),
                        GestureDetector(
                          onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          ),
                          child: Text(
                            "Sign in",
                            style: GoogleFonts.poppins(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
