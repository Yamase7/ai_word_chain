import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
        TextField(
          controller: _emailController,
          decoration: InputDecoration(labelText: 'メールアドレス'),
        ),
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(labelText: 'パスワード'),
          obscureText: true,
        ),
        ElevatedButton(
          onPressed: () {
            // ここで認証を行い、成功した場合にロビーページに遷移します。
          },
          child: Text('ログイン'),
        ),
      ],
    );
  }
}
