import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/src/source.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(title: 'xylophone'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //AudioCache play = AudioCache();
  final player = AudioPlayer();
  void playNote(int n) {
    //AudioCache c = AudioCache();
    //c.load('assets_note1.wav');
    //setState(() {
      //player.setSourceAsset('assets_note1.wav');
      player.play(AssetSource('assets_note$n.wav'));
    //});
    //play.load('assets_note1.wav');

  }

  Expanded createKey(Color c, int n) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(c),
        ),
        onPressed: () {
          playNote(n);
        },
        child: Text(
          'Note $n',
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('xylophone'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          createKey(Colors.red, 1),
          createKey(Colors.pink, 2),
          createKey(Colors.orange, 3),
          createKey(Colors.yellow, 4),
          createKey(Colors.green, 5),
          createKey(Colors.blue, 6),
          createKey(Colors.purple, 7),
        ],
      ),
    );
  }
}

