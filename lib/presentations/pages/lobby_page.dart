import 'package:flutter/material.dart';

class LobbyPage extends StatelessWidget {
  const LobbyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isSmallScreen = screenSize.width < 600;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            constraints: const BoxConstraints(maxWidth: 1200),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _header(context),
                _body(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Row(
      children: [
        _backButton(context),
        Spacer(),
        Center(child: _logo()), // Centerウィジェットを追加
        Spacer(),
      ],
    );
  }

  Widget _backButton(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.arrow_back),
      label: const Text('戻る'),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  Widget _logo() {
    return const FlutterLogo(size: 100);
  }

  Widget _body(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: _playerList(),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: _storyThemes(context),
          ),
        ),
      ],
    );
  }

  Widget _playerList() {
    return SizedBox(
      height: 600,
      width: 400,
      child: ListView.builder(
        itemCount: 5, // プレイヤーの数
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Player ${index + 1}'),
          );
        },
      ),
    );
  }

  Widget _storyThemes(BuildContext context) {
    return SizedBox(
      height: 300,
      child: GridView.count(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 1.0,
        children:
            List.generate(16, (index) => _storyThemeButton(context, index)),
      ),
    );
  }

  Widget _storyThemeButton(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        // ここで選択したストーリーテーマを処理する
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Theme.of(context).primaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.book, size: 50),
            Text('Theme ${index + 1}'),
          ],
        ),
      ),
    );
  }

  Widget _inviteAndStartButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            // 招待リンクを生成・共有する処理
          },
          icon: const Icon(Icons.link),
          label: const Text('招待'),
        ),
        ElevatedButton.icon(
          onPressed: () {
            // ゲームを開始する処理
          },
          icon: const Icon(Icons.play_arrow),
          label: const Text('開始'),
        ),
      ],
    );
  }

  Widget _inviteButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // 招待リンクを生成・共有する処理
      },
      icon: const Icon(Icons.link),
      label: const Text('招待'),
    );
  }

  Widget _startButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // 招待リンクを生成・共有する処理
      },
      icon: const Icon(Icons.link),
      label: const Text('招待'),
    );
  }
}
