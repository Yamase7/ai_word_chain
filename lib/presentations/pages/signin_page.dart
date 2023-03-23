import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
        body: Center(
            child: isSmallScreen
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      _Logo(),
                      _FormContent(),
                    ],
                  )
                : Container(
                    padding: const EdgeInsets.all(32.0),
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Row(
                      children: const [
                        Expanded(child: _Logo()),
                        Expanded(
                          child: Center(child: _FormContent()),
                        ),
                      ],
                    ),
                  )));
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FlutterLogo(size: isSmallScreen ? 100 : 200),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "AI Word Chain",
            textAlign: TextAlign.center,
            style: isSmallScreen
                ? Theme.of(context).textTheme.headline5
                : Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: Colors.black),
          ),
        )
      ],
    );
  }
}

class _FormContent extends StatefulWidget {
  const _FormContent({Key? key}) : super(key: key);

  @override
  State<_FormContent> createState() => __FormContentState();
}

class __FormContentState extends State<_FormContent>
    with TickerProviderStateMixin {
  bool _isPasswordVisible = false;
  bool _rememberMe = false;
  late TabController _tabController;
  final _tabs = const [
    Tab(text: 'ゲスト'),
    Tab(text: 'ログイン'),
  ];

  final GlobalKey<FormState> _guestKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  @override
  void initState() {
    _tabController = TabController(length: 2, animationDuration: Duration.zero, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TabBar(
            controller: _tabController,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Theme.of(context).primaryColor,
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs: _tabs,
          ),
          Container(
            constraints: const BoxConstraints(maxHeight: 250),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(8.0)),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: TabBarView(
              controller: _tabController,
              children: [
                // ゲスト用のコンテンツを追加
                Container(
                  padding: EdgeInsetsDirectional.symmetric(vertical: 16.0),
                  child: Form(
                    key: _guestKey,
                    child: Center(
                        child: TextFormField(
                      validator: (value) {
                        // add email validation
                        if (value == null || value.isEmpty) {
                          return 'ニックネームが入力されていません';
                        }

                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'ニックネーム',
                        hintText: 'ニックネームを入力してください',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                      ),
                    )),
                  ),
                ),
                // ログイン用のコンテンツ
                Container(
                  padding: EdgeInsetsDirectional.symmetric(vertical: 16.0),
                  child: Form(
                    key: _loginKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          validator: (value) {
                            // add email validation
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }

                            bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value);
                            if (!emailValid) {
                              return 'Please enter a valid email';
                            }

                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            hintText: 'Enter your email',
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        _gap(),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }

                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter your password',
                              prefixIcon:
                                  const Icon(Icons.lock_outline_rounded),
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                icon: Icon(_isPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              )),
                        ),
                        _gap(),
                        CheckboxListTile(
                          value: _rememberMe,
                          onChanged: (value) {
                            if (value == null) return;
                            setState(() {
                              _rememberMe = value;
                            });
                          },
                          title: const Text('Remember me'),
                          controlAffinity: ListTileControlAffinity.leading,
                          dense: true,
                          contentPadding: const EdgeInsets.all(0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          _startButton(),
        ],
      ),
    );
  }

  SizedBox _startButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: const Icon(
          Icons.play_arrow_rounded,
          color: Colors.white,
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        label: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            '開始',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: () {
          switch (_tabController.index) {
            case 0:
              if (_guestKey.currentState?.validate() ?? false) {
                /// do something
              }
              break;
            case 1:
              if (_loginKey.currentState?.validate() ?? false) {
                /// do something
              }
              break;
            default:
          }
        },
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
