import 'package:flutter/material.dart';

class GuestSignInForm extends StatefulWidget {
  @override
  _GuestSignInFormState createState() => _GuestSignInFormState();
}

class _GuestSignInFormState extends State<GuestSignInForm> {
  final _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(labelText: 'ユーザー名'),
        ),
        ElevatedButton(
          onPressed: () {
            // ここで一時的なアカウントを作成し、ロビーページに遷移します。
          },
          child: Text('進む'),
        ),
      ],
    );
  }
}
