import 'package:chat_app__qurinom_solutions__assignment/core/utils/extensions/build_context.extension.dart';
import 'package:chat_app__qurinom_solutions__assignment/core/utils/user_type.enum.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/home/views/home_screen.dart';
import 'package:chat_app__qurinom_solutions__assignment/core/widgets/app_rounded_button.dart';
import 'package:chat_app__qurinom_solutions__assignment/core/widgets/app_text_field.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/login/bloc/login_bloc.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/login/bloc/login_events.dart';
import 'package:chat_app__qurinom_solutions__assignment/features/login/bloc/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late UserType userType;

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
            BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen(
                          userId: state.user.id,
                        );
                      },
                    ),
                  );
                } else if (state is LoginFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Login failed: ${state.error}'),
                    ),
                  );
                }
              },
              child: Form(
                child: Column(
                  children: [
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
                    UserRoleToggleTile(
                      userType: userType,
                      onChanged: (isVendor) {
                        setState(() {
                          userType =
                              isVendor ? UserType.vendor : UserType.customer;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    AppRoundedButton(
                      "Login",
                      icon: Icons.login,
                      onPressed: () {
                        context.read<LoginBloc>().add(
                              LoginSubmitted(
                                email: emailController.text,
                                password: passwordController.text,
                                role: userType == UserType.vendor
                                    ? "vendor"
                                    : "customer",
                              ),
                            );
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class UserRoleToggleTile extends StatefulWidget {
  const UserRoleToggleTile({
    super.key,
    required this.userType,
    required this.onChanged,
  });
  final UserType userType;
  final ValueChanged<bool> onChanged;

  @override
  State<UserRoleToggleTile> createState() => _UserRoleToggleTileState();
}

class _UserRoleToggleTileState extends State<UserRoleToggleTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Customer",
          style: context.textTheme.titleMedium?.copyWith(
            color: context.colorScheme.primary,
            fontWeight: widget.userType == UserType.customer
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
        SizedBox(width: 20),
        Switch.adaptive(
          value: widget.userType == UserType.vendor,
          onChanged: widget.onChanged,
        ),
        SizedBox(width: 20),
        Text(
          "Vendor",
          style: context.textTheme.titleMedium?.copyWith(
            color: context.colorScheme.primary,
            fontWeight: widget.userType == UserType.vendor
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
