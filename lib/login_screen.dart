import 'package:chat_app__qurinom_solutions__assignment/core/extensions/build_context.extension.dart';
import 'package:chat_app__qurinom_solutions__assignment/core/user_type.enum.dart';
import 'package:chat_app__qurinom_solutions__assignment/home_screen.dart';
import 'package:chat_app__qurinom_solutions__assignment/widgets/app_rounded_button.dart';
import 'package:chat_app__qurinom_solutions__assignment/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late final UserType userType;

  @override
  void initState() {
    super.initState();
    // set customer as default usertype value
    userType = UserType.customer;
  }

  @override
  void dispose() {
    super.dispose();
    // dispose of all controllers
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person_rounded,
              size: 124,
              color: context.colorScheme.primary,
            ),
            Text(
              "L O G I N",
              style: context.textTheme.displayMedium?.copyWith(
                color: context.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            AppTextField(
              controller: emailController,
              labelText: "Email",
              hintText: "Enter your email",
            ),
            SizedBox(height: 15),
            AppTextField(
              controller: passwordController,
              labelText: "Password",
              hintText: "Enter your password",
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Customer",
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: userType == UserType.customer
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                SizedBox(width: 20),
                Switch.adaptive(
                  value: userType == UserType.vendor,
                  onChanged: (isVendor) {
                    userType = isVendor ? UserType.vendor : UserType.customer;
                    setState(() {});
                  },
                ),
                SizedBox(width: 20),
                Text(
                  "Vendor",
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: userType == UserType.vendor
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            AppRoundedButton(
              "Login",
              icon: Icons.login,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    ));
  }
}
