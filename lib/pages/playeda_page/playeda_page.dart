import 'package:flutter/material.dart';

class PlayedaPage extends StatefulWidget {
  const PlayedaPage({Key? key}) : super(key: key);

  @override
  _PlayedaPageState createState() => _PlayedaPageState();
}

class _PlayedaPageState extends State<PlayedaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text("PalyedaPage"),
      ),
    );
  }
}
