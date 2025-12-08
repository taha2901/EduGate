import 'package:edugate/core/widgets/common/custom_text_field.dart';
import 'package:edugate/core/helper/responsive_helper.dart';
import 'package:edugate/features/auth/ui/widgets/remember_me_row.dart';
import 'package:edugate/features/auth/ui/widgets/signIn_botton.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _isObscure = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: _emailController,
          icon: Icons.email_outlined,
          label: 'Email',
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: ResponsiveHelper.spacing(context, 16)),
        CustomTextField(
          controller: _passwordController,
          icon: Icons.lock_outline,
          label: 'Password',
          obscureText: _isObscure,
          suffixIcon: IconButton(
            icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
            onPressed: () => setState(() => _isObscure = !_isObscure),
          ),
        ),
        SizedBox(height: ResponsiveHelper.spacing(context, 24)),
        RememberMeRow(
          rememberMe: _rememberMe,
          onRememberMeChanged: (value) => setState(() => _rememberMe = value!),
        ),
        SizedBox(height: ResponsiveHelper.spacing(context, 24)),
        SignInButton(),
      ],
    );
  }
}


