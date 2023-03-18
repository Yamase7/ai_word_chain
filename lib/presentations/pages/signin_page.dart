import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/guest_sign_in_form.dart';
import '../widgets/login_form.dart';

class SignInPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef watch) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('アプリ名'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'ゲスト'),
              Tab(text: 'ログイン'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GuestSignInForm(),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
